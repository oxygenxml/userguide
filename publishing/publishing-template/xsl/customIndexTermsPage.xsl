<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    xmlns:html="http://www.w3.org/1999/xhtml"
    xmlns:ls="http://www.oxygenxml.com/ns/webhelp/language-selector"
    version="2.0">
    
    <xsl:include href="customFooter.xsl"/>
  
   <xsl:include href="language_selector_common.xslt"/>
   
   <xsl:template match="html:div[@id='wh-language-selector']" mode="copy_template">
     <xsl:call-template name="ls:language-selector">
       <xsl:with-param name="targetRelPath" select="concat('indexTerms', $OUTEXT)"/>
     </xsl:call-template>
   </xsl:template>
</xsl:stylesheet>
