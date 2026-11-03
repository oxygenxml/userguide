<?xml version="1.0" encoding="UTF-8"?>
<!--
    Shared code for the language selector. Included by the four custom*.xsl
    extensions (main, topic, search, and index terms pages).

    The selector assumes every language is published in a sibling folder of the same
    root (for example site/en and site/fr) and that all languages have the same output
    file structure.
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:oxygen="http://www.oxygenxml.com/functions"
    xmlns:ls="http://www.oxygenxml.com/ns/webhelp/language-selector"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="#all"
    version="3.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Dec 11, 2025</xd:p>
            <xd:p><xd:b>Author:</xd:b> radu_pisoi</xd:p>
        </xd:desc>
    </xd:doc>

    <xd:doc>
        <xd:desc>
            <xd:p>Generates the language selector: a globe button placed next to the theme button,
                opening a dropdown with the available languages.</xd:p>
        </xd:desc>
        <xd:param name="targetRelPath">The path of the current page relative to the output root.
            The link for each language points to the same path in that language's folder.</xd:param>
    </xd:doc>
    <xsl:template name="ls:language-selector">
        <xsl:param name="targetRelPath" as="xs:string"/>

        <xsl:variable name="availableLanguagesPath" select="string(oxygen:getParameter('available.languages'))"/>
        <xsl:variable name="currentLanguage" select="string(oxygen:getParameter('current.language'))"/>
        <xsl:variable name="langURI" select="
            if ($availableLanguagesPath != '')
            then string(oxygen:makeURL($availableLanguagesPath))
            else ''"/>

        <xsl:choose>
            <xsl:when test="normalize-space($currentLanguage) = ''">
                <xsl:message>Language selector: the 'current.language' parameter cannot be empty.</xsl:message>
            </xsl:when>
            <xsl:when test="$langURI = '' or not(doc-available($langURI))">
                <xsl:message>Language selector: cannot read the 'available.languages' file: <xsl:value-of select="$availableLanguagesPath"/></xsl:message>
            </xsl:when>
            <xsl:otherwise>
                <xsl:variable name="languages" select="doc($langURI)//language"/>
                <xsl:variable name="currentLanguageEntry" select="$languages[name = $currentLanguage][1]"/>

                <xsl:variable name="currentLabel" select="string(($currentLanguageEntry/label, $currentLanguageEntry/name)[1])"/>
                <!-- The tooltip is localized in the languages file. The 'q' flag replaces '{label}' literally. -->
                <xsl:variable name="buttonLabel" select="
                    if (exists($currentLanguageEntry/tooltip))
                    then replace($currentLanguageEntry/tooltip, '{label}', $currentLabel, 'q')
                    else 'Switch language'"/>

                <div class="wh_language dropdown">
                    <button type="button" class="wh_language_btn" data-bs-toggle="dropdown"
                        aria-haspopup="menu" aria-expanded="false"
                        title="{$buttonLabel}" aria-label="{$buttonLabel}">
                        <!-- The globe icon is copied inline so it can use the button color (currentColor). -->
                        <xsl:variable name="iconURI" select="resolve-uri('../css/images/language.svg', static-base-uri())"/>
                        <xsl:choose>
                            <xsl:when test="doc-available($iconURI)">
                                <xsl:for-each select="doc($iconURI)/*">
                                    <xsl:copy copy-namespaces="no">
                                        <xsl:copy-of select="@*"/>
                                        <xsl:attribute name="class">wh_language_icon</xsl:attribute>
                                        <xsl:attribute name="aria-hidden">true</xsl:attribute>
                                        <xsl:copy-of select="*" copy-namespaces="no"/>
                                    </xsl:copy>
                                </xsl:for-each>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:message>Language selector: cannot read the icon file: <xsl:value-of select="$iconURI"/></xsl:message>
                            </xsl:otherwise>
                        </xsl:choose>
                    </button>
                    <ul class="dropdown-menu dropdown-menu-end" role="menu">
                        <xsl:for-each select="$languages">
                            <xsl:variable name="isCurrent" select=". is $currentLanguageEntry"/>
                            <!-- Go up from the current page to the output root, then up once more to the folder holding all languages. -->
                            <xsl:variable name="href" select="concat($PATH2PROJ, '../', folder, '/', $targetRelPath)"/>
                            <li role="none">
                                <a role="menuitem" class="dropdown-item{if ($isCurrent) then ' active' else ''}"
                                    lang="{folder}" hreflang="{folder}" href="{$href}">
                                    <xsl:if test="$isCurrent">
                                        <xsl:attribute name="aria-current">page</xsl:attribute>
                                    </xsl:if>
                                    <xsl:value-of select="(label, name)[1]"/>
                                </a>
                            </li>
                        </xsl:for-each>
                    </ul>
                    <!-- Keeps the search query and the anchor of the current page when switching the language. -->
                    <script src="{$PATH2PROJ}oxygen-webhelp/template/js/language-selector.js" defer="defer"><xsl:comment/></script>
                </div>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
