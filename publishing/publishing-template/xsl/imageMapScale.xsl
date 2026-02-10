<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:dita-ot="http://dita-ot.sourceforge.net/ns/201007/dita-ot"
  exclude-result-prefixes="xs dita-ot"
  version="3.0">

  <!-- Force image map scaling -->
  <xsl:template match="*[contains(@class, 'ut-d/imagemap')]/@class">
    <xsl:copy/>
    <xsl:attribute name="scale" select="'70'"/>
  </xsl:template>

</xsl:stylesheet>