<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://purl.oclc.org/dsdl/schematron"
  xmlns:iso="http://purl.oclc.org/dsdl/schematron"
  exclude-result-prefixes="iso"
  version="2.0">
  <xsl:output indent="yes"/>
  
  
  <xsl:variable name="library" select="'urn:rules:library.sch'"/>
  <xsl:variable name="base" select="resolve-uri('.', base-uri(/))"/>  
    
  <xsl:template match="/bookmap" priority="100">
      <schema queryBinding="xslt2">
        <xsl:apply-templates mode="rules"/>
        <xsl:apply-templates select="document($library)" mode="includesGenericRules"/>
        <xsl:copy-of select="document('urn:rules:quickFix-library.xml')"/>
      </schema>
  </xsl:template>
  
  <xsl:template match="/*">
    <xsl:copy-of select="."/>
  </xsl:template>

  <xsl:template match="*[contains(@class, ' map/topicref ')]" mode="rules">
    <xsl:if test="@href">
      <xsl:comment>
        <xsl:value-of select="@href"/>
        (<xsl:value-of select="base-uri(.)"/>)
        [<xsl:value-of select="base-uri(document(@href, .))"/>]
      </xsl:comment>
      <xsl:apply-templates select="document(@href, .)" mode="rules"/>
    </xsl:if>
    <xsl:apply-templates mode="rules"/>
  </xsl:template>
  <xsl:template match="section[@audience='rules']/dl" mode="rules">
    <xsl:apply-templates select="." mode="instantiate"/>
  </xsl:template>
  <xsl:template match="*" mode="rules">
    <xsl:apply-templates mode="rules"/>
  </xsl:template>
  <xsl:template match="text()" mode="rules"/>

  <xsl:template match="dl" mode="instantiate">
    <xsl:variable name="origin" select="substring-after(base-uri(.), $base)"/>
    <xsl:variable name="target">
      <xsl:text>http://example.com/styleguide/webhelp/</xsl:text>
      <xsl:value-of select="replace($origin, '.dita', '.html')"/>
    </xsl:variable>
    <xsl:comment>Generated from <xsl:value-of select="$origin"/>.
    </xsl:comment>
    <pattern is-a="{dlhead/ddhd}" see="{$target}">
      <xsl:apply-templates mode="instantiate"/>
    </pattern>
  </xsl:template>
  <xsl:template match="dlentry" mode="instantiate">
    <param name="{dt}" value="{dd}"/>
  </xsl:template>
  <xsl:template match="text()" mode="instantiate"/>


  <!-- generate include instuctions for all abstract patterns from the library -->
  <xsl:template match="text()" mode="includesGenericRules"/>
  <xsl:template match="iso:pattern[@abstract='true']" mode="includesGenericRules">
      <xsl:copy-of select="."/>
  </xsl:template>
  
</xsl:stylesheet>