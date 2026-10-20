@echo off
rem Regenerates the ui-strings.<lang>.md files from the UI strings XML by running
rem ui-strings-to-md.xsl with Saxon.
rem
rem Usage: ui-strings-to-md.bat [param=value ...]
rem   Extra arguments go to Saxon and win over the settings below, e.g. out=C:\temp\md
setlocal

rem --- Settings ------------------------------------------------------------------------------
rem Relative paths are relative to this script's folder.

rem Folder with the Saxon-HE 12 jar and the jars it needs, as in the Saxonica download (the jar
rem plus lib\). Leave empty to use Saxon-HE 12 and xmlresolver 5 from %USERPROFILE%\.m2\repository
rem (with several versions there, the last one in name order wins).
set "SAXON_LIB="

rem Folder with the UI strings XML files (every *.xml in it is read).
set "IN_DIR=xml-translation\fusion"

rem Folder that receives the ui-strings.<lang>.md files.
set "OUT_DIR=..\.contentfusion\i18n\fusion\terminology"
rem -------------------------------------------------------------------------------------------

set "XSL=%~dp0ui-strings-to-md.xsl"

rem Checks below use goto instead of ( ... ) blocks: a path such as C:\Program Files (x86) would
rem end a block early. ERR holds the message that :fail prints.

rem --- Java
if not defined JAVA_HOME goto java_on_path
set "JAVA=%JAVA_HOME%\bin\java.exe"
set "ERR=Java not found: %JAVA%. Fix JAVA_HOME or install Java 11 or later."
if not exist "%JAVA%" goto fail
goto java_ok
:java_on_path
set "JAVA=java"
set "ERR=Java not found on the PATH. Install Java 11 or later, or set JAVA_HOME."
where java >nul 2>nul || goto fail
:java_ok

set "ERR=Stylesheet not found: %XSL%"
if not exist "%XSL%" goto fail

rem --- Folders: made absolute, relative to this script's folder (setlocal restores the current
rem folder on exit). A trailing backslash is dropped: before a closing quote it would escape it.
cd /d "%~dp0"
for %%F in ("%IN_DIR%") do set "IN_DIR=%%~fF"
for %%F in ("%OUT_DIR%") do set "OUT_DIR=%%~fF"
if "%IN_DIR:~-1%"=="\" set "IN_DIR=%IN_DIR:~0,-1%"
if "%OUT_DIR:~-1%"=="\" set "OUT_DIR=%OUT_DIR:~0,-1%"

set "ERR=Input folder (IN_DIR) not found: %IN_DIR%"
if not exist "%IN_DIR%\" goto fail
set "ERR=No *.xml files in the input folder (IN_DIR): %IN_DIR%"
if not exist "%IN_DIR%\*.xml" goto fail

if not exist "%OUT_DIR%\" mkdir "%OUT_DIR%" 2>nul
set "ERR=Cannot create the output folder (OUT_DIR): %OUT_DIR%"
if not exist "%OUT_DIR%\" goto fail

rem --- Saxon
if not defined SAXON_LIB goto maven
for %%F in ("%SAXON_LIB%") do set "SAXON_LIB=%%~fF"
if "%SAXON_LIB:~-1%"=="\" set "SAXON_LIB=%SAXON_LIB:~0,-1%"
set "ERR=Saxon folder (SAXON_LIB) not found: %SAXON_LIB%"
if not exist "%SAXON_LIB%\" goto fail
set "ERR=No saxon-he-*.jar in the Saxon folder (SAXON_LIB): %SAXON_LIB%"
if not exist "%SAXON_LIB%\saxon-he-*.jar" goto fail
set "ERR=No xmlresolver-*.jar in %SAXON_LIB% or %SAXON_LIB%\lib (Saxon-HE 12 needs it)."
if exist "%SAXON_LIB%\xmlresolver-*.jar" goto saxon_lib_ok
if not exist "%SAXON_LIB%\lib\xmlresolver-*.jar" goto fail
:saxon_lib_ok
for %%J in ("%SAXON_LIB%\saxon-he-*.jar") do set "SAXON_JAR=%%~fJ"
set "CLASSPATH_=%SAXON_LIB%\*;%SAXON_LIB%\lib\*"
goto run

:maven
set "M2_REPO=%USERPROFILE%\.m2\repository"
set "SAXON_JAR="
set "RESOLVER_JAR="
for /d %%D in ("%M2_REPO%\net\sf\saxon\Saxon-HE\12.*") do set "SAXON_JAR=%%D\Saxon-HE-%%~nxD.jar"
for /d %%D in ("%M2_REPO%\org\xmlresolver\xmlresolver\5.*") do (
  set "RESOLVER_JAR=%%D\xmlresolver-%%~nxD.jar"
  set "RESOLVER_DATA_JAR=%%D\xmlresolver-%%~nxD-data.jar"
)
set "ERR=Saxon-HE 12 not found in %M2_REPO%. Set SAXON_LIB in %~f0."
if not defined SAXON_JAR goto fail
set "ERR=xmlresolver 5 not found in %M2_REPO%. Set SAXON_LIB in %~f0."
if not defined RESOLVER_JAR goto fail
for %%J in ("%SAXON_JAR%" "%RESOLVER_JAR%" "%RESOLVER_DATA_JAR%") do (
  if not exist "%%~J" set "ERR=Jar not found: %%~J. Set SAXON_LIB in %~f0."
  if not exist "%%~J" goto fail
)
set "CLASSPATH_=%SAXON_JAR%;%RESOLVER_JAR%;%RESOLVER_DATA_JAR%"

:run
echo Saxon:  %SAXON_JAR%
echo Input:  %IN_DIR%
echo Output: %OUT_DIR%
"%JAVA%" -cp "%CLASSPATH_%" net.sf.saxon.Transform "-xsl:%XSL%" -it "in=%IN_DIR%" "out=%OUT_DIR%" %*
set "RC=%ERRORLEVEL%"
set "ERR=Generating the MD files failed (Saxon exit code %RC%). See the messages above."
if not "%RC%"=="0" goto fail
echo Done.
exit /b 0

:fail
rem Delayed expansion prints the message even when a path in it contains characters like &.
setlocal EnableDelayedExpansion
>&2 echo ERROR: !ERR!
exit /b 1
