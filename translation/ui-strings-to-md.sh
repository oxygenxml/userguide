#!/usr/bin/env bash
# Regenerates the ui-strings.<lang>.md files from the UI strings XML by running
# ui-strings-to-md.xsl with Saxon.
#
# Usage: ui-strings-to-md.sh [param=value ...]
#   Extra arguments go to Saxon and win over the settings below, e.g. out=/tmp/md
set -euo pipefail

# --- Settings ------------------------------------------------------------------------------
# Relative paths are relative to this script's folder.

# Folder with the Saxon-HE 12 jar and the jars it needs, as in the Saxonica download (the jar
# plus lib/). Leave empty to use the newest Saxon-HE 12 and xmlresolver 5 from ~/.m2/repository.
SAXON_LIB=""

# Folder with the UI strings XML files (every *.xml in it is read).
IN_DIR="xml-translation/fusion"

# Folder that receives the ui-strings.<lang>.md files.
OUT_DIR="../.contentfusion/i18n/fusion/terminology"
# -------------------------------------------------------------------------------------------

script_dir=$(cd "$(dirname "$0")" && pwd)
xsl="$script_dir/ui-strings-to-md.xsl"
java="${JAVA_HOME:+$JAVA_HOME/bin/}java"

fail() {
  echo "ERROR: $*" >&2
  exit 1
}

# Git Bash / Cygwin run a Windows JVM: it needs Windows paths and ';' between classpath entries.
case "$(uname -s)" in
  MINGW*|MSYS*|CYGWIN*) windows=1; sep=';' ;;
  *) windows=0; sep=':' ;;
esac

native() {
  if [ "$windows" = 1 ]; then cygpath -m "$1"; else echo "$1"; fi
}

# Absolute path of a folder given relative to this script's folder (or already absolute).
abs_dir() {
  (cd "$script_dir" && cd "$1" 2>/dev/null && pwd) || fail "$2 not found: $1"
}

# First file matching a glob pattern, or nothing.
first_match() {
  compgen -G "$1" | head -n 1 || true
}

newest() {
  ls -d "$1"/$2 2>/dev/null | sort -V | tail -n 1 || true
}

command -v "$java" >/dev/null 2>&1 \
  || fail "Java not found: $java. Install Java 11 or later, or set JAVA_HOME."
[ -f "$xsl" ] || fail "Stylesheet not found: $xsl"

in_dir=$(abs_dir "$IN_DIR" "Input folder (IN_DIR)")
[ -n "$(first_match "$in_dir/*.xml")" ] || fail "No *.xml files in the input folder (IN_DIR): $in_dir"
(cd "$script_dir" && mkdir -p "$OUT_DIR") || fail "Cannot create the output folder (OUT_DIR): $OUT_DIR"
out_dir=$(abs_dir "$OUT_DIR" "Output folder (OUT_DIR)")

if [ -n "$SAXON_LIB" ]; then
  saxon_lib=$(abs_dir "$SAXON_LIB" "Saxon folder (SAXON_LIB)")
  saxon_jar=$(first_match "$saxon_lib/[Ss]axon-[Hh][Ee]-*.jar")
  [ -n "$saxon_jar" ] || fail "No saxon-he-*.jar in the Saxon folder (SAXON_LIB): $saxon_lib"
  resolver_jar=$(first_match "$saxon_lib/xmlresolver-*.jar")
  [ -n "$resolver_jar" ] || resolver_jar=$(first_match "$saxon_lib/lib/xmlresolver-*.jar")
  [ -n "$resolver_jar" ] \
    || fail "No xmlresolver-*.jar in $saxon_lib or $saxon_lib/lib (Saxon-HE 12 needs it)."
  classpath="$(native "$saxon_lib")/*$sep$(native "$saxon_lib")/lib/*"
else
  m2="$HOME/.m2/repository"
  saxon_dir=$(newest "$m2/net/sf/saxon/Saxon-HE" '12.*')
  resolver_dir=$(newest "$m2/org/xmlresolver/xmlresolver" '5.*')
  [ -n "$saxon_dir" ] || fail "Saxon-HE 12 not found in $m2. Set SAXON_LIB in $0."
  [ -n "$resolver_dir" ] || fail "xmlresolver 5 not found in $m2. Set SAXON_LIB in $0."
  saxon_jar="$saxon_dir/Saxon-HE-${saxon_dir##*/}.jar"
  jars=("$saxon_jar"
        "$resolver_dir/xmlresolver-${resolver_dir##*/}.jar"
        "$resolver_dir/xmlresolver-${resolver_dir##*/}-data.jar")
  classpath=""
  for jar in "${jars[@]}"; do
    [ -f "$jar" ] || fail "Jar not found: $jar. Set SAXON_LIB in $0."
    classpath+="${classpath:+$sep}$(native "$jar")"
  done
fi

echo "Saxon:  $saxon_jar"
echo "Input:  $in_dir"
echo "Output: $out_dir"

status=0
"$java" -cp "$classpath" net.sf.saxon.Transform "-xsl:$(native "$xsl")" -it \
  "in=$(native "$in_dir")" "out=$(native "$out_dir")" "$@" || status=$?
[ "$status" = 0 ] || fail "Generating the MD files failed (Saxon exit code $status). See the messages above."
echo "Done."
