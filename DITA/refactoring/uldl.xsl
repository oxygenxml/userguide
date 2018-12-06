<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ul">
        <xsl:element name="dl">
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="ul/li">
        <xsl:element name="dlentry">
            <xsl:apply-templates select="@*"/>
            <dt></dt>
            <dd>
                <xsl:apply-templates/>
            </dd>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>