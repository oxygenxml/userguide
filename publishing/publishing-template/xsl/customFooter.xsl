<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">

    <xsl:param name="webhelp.footer.add.generation.time" select="'no'"/>

    <xsl:template match="*:div[contains(@class, 'footer-container')]" mode="copy_template">
        <!-- Apply the default processing -->
        <xsl:next-match/>

        <!-- Add a div containing the copyright information -->
                    
        <div class="generation_time"><xsl:value-of select="format-dateTime(current-dateTime(), '[h1]:[m01] [P] on [M01]/[D01]/[Y0001].')"/>
        </div>            
        
    </xsl:template>
</xsl:stylesheet>
