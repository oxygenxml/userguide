<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:f="http://www.oxygenxml.com/functions"
  exclude-result-prefixes="xs"
  version="2.0">
  
  <xsl:template match="node() | @*">
    <xsl:copy>
      <xsl:apply-templates select="node() | @*"/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:function name="f:replace" as="xs:string*">
    <xsl:param name="initialValues" as="xs:string*"/>
    <xsl:param name="replaceValues" as="xs:string+"/>
    <xsl:param name="toReplace" as="xs:string"/>
    
    <xsl:variable name="contains" select="every $x in $replaceValues satisfies $initialValues=$x"/>
    <xsl:choose>
      <xsl:when test="$contains">
        <xsl:copy-of select="(distinct-values(for $x in $initialValues return if ($x = $replaceValues) then $toReplace else $x))"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:copy-of select="$initialValues"/>
      </xsl:otherwise>
    </xsl:choose>
    
    
  </xsl:function>
  
  <xsl:template match="@product">
    <xsl:variable name="values" as="xs:string*" select="tokenize(., ' ')"/>
    <xsl:variable name="r1" as="xs:string*" select="f:replace($values, ('webauthor', 'fusion', 'waCustom'), 'web')"/>
    <xsl:variable name="r2" as="xs:string*" select="f:replace($r1, ('authorEclipse','developerEclipse','editorEclipse'), 'eclipse')"/>
    <xsl:variable name="r3" as="xs:string*" select="f:replace($r2, ('author', 'editor', 'developer'), 'standalone')"/>
    
    <xsl:attribute name="product">
      <xsl:value-of select="$r3" separator=" "/>
    </xsl:attribute>
  </xsl:template>
  
  
</xsl:stylesheet>