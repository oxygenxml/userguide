<?xml version="1.0" encoding="UTF-8"?>
<!--
  Converts the product UI strings (translation/xml-translation/fusion/*.xml) into one Markdown
  table per target language: .contentfusion/i18n/fusion/terminology/ui-strings.<lang>.md

  Run translation/ui-strings-to-md.bat (Windows) or translation/ui-strings-to-md.sh, or call
  Saxon (XSLT 3.0) directly, with no input document and the default initial template:
    java -cp "saxon-he-12.x.jar;lib/*" net.sf.saxon.Transform -xsl:translation/ui-strings-to-md.xsl -it
  In Oxygen: create an XSLT scenario for this file and set "Initial template" to xsl:initial-template.

  Parameters, each a folder given as a file system path (Windows or POSIX) or a file: URI;
  relative ones resolve against this stylesheet's folder:
    in   - folder with the source XML files (every *.xml in it is read)
    out  - folder that receives the generated .md files
-->
<xsl:stylesheet version="3.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:local="urn:local"
    exclude-result-prefixes="xs local"
    expand-text="yes">

  <xsl:param name="in" as="xs:string" select="'xml-translation/fusion/'"/>
  <xsl:param name="out" as="xs:string" select="'../.contentfusion/i18n/fusion/terminology/'"/>

  <xsl:variable name="source-lang" as="xs:string" select="'en_US'"/>
  <!-- Sorted by file name: a directory collection's order depends on the file system, and it
       decides the order of rows that share an ID. -->
  <xsl:variable name="docs" as="document-node()*"
      select="sort(collection(local:folder-uri($in) || '?select=*.xml'), (), document-uri#1)"/>
  <xsl:variable name="keys" as="element(key)*" select="$docs/translation/key"/>
  <xsl:variable name="out-dir" as="xs:string" select="local:folder-uri($out)"/>

  <!-- Absolute URI, ending in '/', of a folder given as a file: URI or as a Windows or POSIX path
       (absolute, or relative to this stylesheet). -->
  <xsl:function name="local:folder-uri" as="xs:string">
    <xsl:param name="folder" as="xs:string"/>
    <xsl:variable name="path" as="xs:string"
        select="replace($folder, '\\', '/') => replace('([^/])$', '$1/')"/>
    <xsl:sequence select="resolve-uri(iri-to-uri(
          if (matches($path, '^[A-Za-z]:/')) then 'file:///' || $path
          else if (starts-with($path, '/')) then 'file://' || $path
          else $path),
        static-base-uri())"/>
  </xsl:function>

  <!-- Text of a node as a Markdown table cell: inline markup (<link>) dropped, whitespace collapsed,
       MessageFormat-escaped apostrophes ('') shown as one ('), pipes escaped. -->
  <xsl:function name="local:cell" as="xs:string">
    <xsl:param name="node" as="node()?"/>
    <xsl:sequence select="normalize-space(string($node))
        => replace('''''', '''')
        => replace('\|', '\\|')"/>
  </xsl:function>

  <xsl:template name="xsl:initial-template">
    <xsl:variable name="target-langs" as="element(language)*"
        select="$docs/translation/languageList/language[@lang ne $source-lang]"/>
    <xsl:if test="empty($keys)">
      <xsl:message terminate="yes"
          error-code="local:no-strings">No UI strings found in {local:folder-uri($in)}: no *.xml file there has translation/key elements ({count($docs)} XML file(s) read).</xsl:message>
    </xsl:if>
    <xsl:if test="empty($target-langs)">
      <xsl:message terminate="yes"
          error-code="local:no-languages">No target languages found: no translation/languageList/language other than {$source-lang} in {local:folder-uri($in)}.</xsl:message>
    </xsl:if>
    <xsl:message>Read {count($keys)} UI strings from {count($docs)} XML file(s).</xsl:message>

    <!-- Target languages come from the files' language lists; every file declares them, so keep
         one entry per @lang. -->
    <xsl:for-each-group select="$target-langs" group-by="@lang">
      <xsl:call-template name="language-file">
        <xsl:with-param name="lang" select="current-grouping-key()"/>
        <xsl:with-param name="description" select="string(@description)"/>
      </xsl:call-template>
    </xsl:for-each-group>
  </xsl:template>

  <xsl:template name="language-file">
    <xsl:param name="lang" as="xs:string"/>
    <xsl:param name="description" as="xs:string"/>

    <xsl:variable name="file" as="xs:string" select="'ui-strings.' || $lang || '.md'"/>
    <xsl:variable name="untranslated" as="xs:string*"
        select="distinct-values($keys[normalize-space(val[@lang = $source-lang])]
                                     [not(normalize-space(val[@lang = $lang]))]/@value)"/>

    <!-- One entry per key, as table cells. A key not yet translated into this language keeps its
         entry, with an empty target. Sorted case-insensitively by ID; the sort is stable, so equal
         IDs keep their source order. -->
    <xsl:variable name="entries" as="element(entry)*">
      <xsl:for-each select="$keys[normalize-space(val[@lang = $source-lang])]">
        <entry id="{@value}"
            source="{local:cell(val[@lang = $source-lang])}"
            target="{local:cell(val[@lang = $lang])}"
            context="{local:cell(comment)}"/>
      </xsl:for-each>
    </xsl:variable>
    <xsl:variable name="sorted" as="element(entry)*"
        select="sort($entries, (), function($e) { lower-case($e/@id) })"/>

    <!-- Entries with the same source and target strings, whatever their IDs, become one row: it
         keeps the ID that sorts first and joins the distinct contexts with '; '. -->
    <xsl:variable name="rows" as="xs:string*">
      <xsl:for-each-group select="$sorted" group-by="@source, @target" composite="yes">
        <xsl:sequence select="'| ' || @id
            || ' | ' || @source
            || ' | ' || @target
            || ' | ' || string-join(distinct-values(current-group() ! @context[. ne '']), '; ')
            || ' |'"/>
      </xsl:for-each-group>
    </xsl:variable>

    <xsl:result-document href="{$out-dir}{$file}" method="text" encoding="UTF-8">
      <xsl:text># UI strings (en-US → {$lang}, {$description})&#10;&#10;</xsl:text>
      <xsl:text>| ID | Source (en-US) | Target ({$lang}) | Context |&#10;</xsl:text>
      <xsl:text>|---|---|---|---|&#10;</xsl:text>
      <xsl:for-each select="$rows">
        <xsl:text>{.}&#10;</xsl:text>
      </xsl:for-each>
    </xsl:result-document>
    <xsl:message>Wrote {$file}: {count($rows)} rows ({count($entries) - count($rows)} duplicate(s) merged)</xsl:message>
    <xsl:if test="exists($untranslated)">
      <xsl:message>  WARNING: {count($untranslated)} string(s) have no {$description} ({$lang}) translation in the source XML: {string-join($untranslated, ', ')}</xsl:message>
    </xsl:if>
  </xsl:template>

</xsl:stylesheet>
