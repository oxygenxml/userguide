<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron"
  xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  
  queryBinding="xslt2">
  <sch:ns uri="http://www.oxygenxml.com/customFunction" prefix="oxyF"/>
   
   <!--<sch:pattern is-a="avoidWordInElement">
      <sch:param name="word" value="oXygen"/>
      <sch:param name="element" value="indexterm"/>
      <sch:param name="message" value="We should avoid using oXygen inside index terms!"/>
   </sch:pattern>-->
   <!--Generated from topics/images.dita-->
   <sch:pattern is-a="avoidAttributeInElement">
      <sch:param name="element" value="image"/>
      <sch:param name="attribute" value="scale"/>
      <sch:param name="message"
             value="Dynamically scaled images are not properly displayed, you&#xA;            should scale the image with an image tool and keep it within&#xA;            the recommended with and height limits."/>
   </sch:pattern>
   <!--Generated from topics/lists.dita-->
   <sch:pattern is-a="avoidEndFragment">
      <sch:param name="fragment" value=";"/>
      <sch:param name="element" value="li"/>
      <sch:param name="message"
             value="List items should not end with a semi-colon (;). If it is&#xA;            a sentence then end it with a full stop (.), otherwise leave&#xA;            it without an ending character."/>
   </sch:pattern>
  
<!-- ***Commented out since index terms were updated in the entire UG
  <!-\- Check the indexterm exist. -\->
  <sch:pattern>
    <sch:rule context="/*">
      <sch:assert test="prolog/metadata/keywords/indexterm" role="warn" sqf:fix="addFragment">
        It is recommended to add an 'indexterm' in the current '<sch:name/>' element.
      </sch:assert>
      
      <sqf:fix id="addFragment">
        <sqf:description>
          <sqf:title>Add the 'indexterm' element</sqf:title>
        </sqf:description>
        
        <!-\- Add the indexterm element element and its parents -\->
        <sqf:add match="(title | titlealts | abstract | shortdesc)[last()]" position="after" use-when="not(prolog)">
          <xsl:text>
          </xsl:text><prolog><xsl:text>
            </xsl:text><metadata><xsl:text>
              </xsl:text><keywords><xsl:text>
                 </xsl:text><indexterm><xsl:text> </xsl:text> </indexterm><xsl:text>
              </xsl:text></keywords><xsl:text>
            </xsl:text></metadata><xsl:text>
          </xsl:text></prolog>
        </sqf:add>
      </sqf:fix>
    </sch:rule>
  </sch:pattern>
-->
  
  <!-- The indexterm element should always be in a prolog because it creates output problems. -->
  <sch:pattern>
    <sch:rule context="*[contains(@class, ' topic/indexterm ')]">
      <sch:assert test="ancestor::node()/local-name() = 'prolog'">The indexterm element should be in a prolog.</sch:assert>
    </sch:rule>
  </sch:pattern>
  
  <!-- Topic ID must be equal to file name -->
  <sch:pattern>
    <sch:rule context="/*[1][contains(@class, ' topic/topic ')]">
      <sch:let name="reqId" value="replace(tokenize(document-uri(/), '/')[last()], '\.dita', '')"/>
      <sch:assert test="@id = $reqId" sqf:fix="setId">
        Topic ID must be equal to file name.
      </sch:assert>
      <sqf:fix id="setId">
        <sqf:description>
          <sqf:title>Set "<sch:value-of select="$reqId"/>" as a topic ID</sqf:title>
          <sqf:p>The topic ID must be equal to the file name.</sqf:p>
        </sqf:description>
        <sqf:add node-type="attribute" target="id" select="$reqId"/>
      </sqf:fix>
    </sch:rule>
  </sch:pattern>
  
  <!-- Report if link text same as @href value -->
  <sch:pattern>
    <sch:rule context="*[contains(@class, ' topic/xref ') or contains(@class, ' topic/link ')]">
      <sch:report test="@scope='external' and @href=text()" sqf:fix="removeText">
        Link text is same as @href attribute value. Please remove.
      </sch:report>
      <sqf:fix id="removeText">
        <sqf:description>
          <sqf:title>Remove redundant link text, text is same as @href value.</sqf:title>
        </sqf:description>
        <sqf:delete match="text()"/>
      </sqf:fix>
      
      <!-- Check that the scope attribute is set. -->
      <sch:report test="@format='html' and (not(@scope) or @scope!='external')" sqf:fix="setScopeAttr" role="warn">
        External link should have a scope attribute set to external
      </sch:report>
      <sqf:fix id="setScopeAttr">
        <sqf:description>
          <sqf:title>Set scope attribute to external</sqf:title>
        </sqf:description>
        <sqf:add node-type="attribute" target="scope" select="'external'"/>
      </sqf:fix>
    </sch:rule>
  </sch:pattern>
  
  <sch:pattern>
    <!-- Image without any kind of reference -->
    <sch:rule context="*[contains(@class, ' topic/image ')]">
      <sch:report test="not(@href) and not(@keyref) and not(@conref) and not(@conkeyref)" sqf:fix="add_href add_keyref add_conref add_conkeyref"> Image without
        a reference. </sch:report>
      
      <sqf:fix id="add_href">
        <sqf:description>
          <sqf:title>Add @href attribute</sqf:title>
        </sqf:description>
        <sqf:add node-type="attribute" target="href"/>
      </sqf:fix>
      
      <sqf:fix id="add_keyref">
        <sqf:description>
          <sqf:title>Add @keyref attribute</sqf:title>
        </sqf:description>
        <sqf:add node-type="attribute" target="keyref"/>
      </sqf:fix>
      
      <sqf:fix id="add_conref">
        <sqf:description>
          <sqf:title>Add @conref attribute</sqf:title>
        </sqf:description>
        <sqf:add node-type="attribute" target="conref"/>
      </sqf:fix>
      
      <sqf:fix id="add_conkeyref">
        <sqf:description>
          <sqf:title>Add @conkeyref attribute</sqf:title>
        </sqf:description>
        <sqf:add node-type="attribute" target="conkeyref"/>
      </sqf:fix>
    </sch:rule>
  </sch:pattern>
 
  <sch:pattern>
    <!-- Report ul after ul -->
    <sch:rule context="*[contains(@class, ' topic/ul ')]">
      <sch:report test="following-sibling::node()[1]
          [contains(@class, ' topic/ul ') or 
          (self::text() and normalize-space(.)='') and 
            following-sibling::node()[1][self::*][contains(@class, ' topic/ul ')]]" 
      role="warn" sqf:fix="mergeLists"> Two
        consecutive unordered lists. You can probably merge them into one. </sch:report>
    </sch:rule>
  </sch:pattern>

  <sch:pattern>
    <!-- Report dl after dl -->
    <sch:rule context="*[contains(@class, ' topic/dl ')]">
      <sch:report test="following-sibling::node()[1][contains(@class, ' topic/dl ')]" role="warn" sqf:fix="mergeLists"> Two
        consecutive definition lists. You can probably merge them into one. </sch:report>
    </sch:rule>
  </sch:pattern>

  <sch:pattern>
    <!-- Report ol after ol -->
    <sch:rule context="*[contains(@class, ' topic/ol ')]">
      <sch:report test="following-sibling::node()[1]
        [contains(@class, ' topic/ol ') or 
        (self::text() and normalize-space(.)='') and 
        following-sibling::node()[1][self::*][contains(@class, ' topic/ol ')]]" role="warn" sqf:fix="mergeLists"> Two
        consecutive ordered lists. You can probably merge them into one. </sch:report>
    </sch:rule>
  </sch:pattern>

  <sch:pattern>
    <!-- Report ordered and unordered lists with only one list item -->
    <sch:rule context="*[contains(@class, ' topic/ul ') or contains(@class, ' topic/ol ')]">
      <sch:report test="count(li) = 1 and not(@conkeyref) and not(@conref)">
        Single list item! Converted to a paragraph and get rid of the parent list element.
      </sch:report>
    </sch:rule>
  </sch:pattern>

  <sqf:fixes>
    <!-- Merge the two lists into one -->
    <sqf:fix id="mergeLists">
      <sqf:description>
        <sqf:title>Merge lists into one</sqf:title>
      </sqf:description>
      <sqf:add position="last-child">
        <xsl:apply-templates mode="copyExceptClass" select="following-sibling::*[1]/node()"/>
      </sqf:add>
      <sqf:delete match="following-sibling::*[1]"/>
    </sqf:fix>
    
    <!-- Wrap the current element in a paragraph. -->
    <sqf:fix id="wrapInParagraph" use-when="not(parent::p)">
      <sqf:description>
        <sqf:title>Wrap "<sch:name/>" element in a paragraph</sqf:title>
      </sqf:description>
      <sqf:add node-type="element" target="p" position="after">
        <xsl:apply-templates mode="copyExceptClass" select="."/>
      </sqf:add>
      <sqf:delete/>
    </sqf:fix>
    
    <!-- Split the paragraph before and after and leve the current element as the only child in its parent paragraph. -->
    <sqf:fix id="splitParagraphBeforeAndAfter" use-when="parent::p">
      <sqf:description>
        <sqf:title>Wrap "<sch:name/>" element in its own paragraph</sqf:title>
      </sqf:description>
      <sch:let name="currentNode" value="."/>
      <sch:let name="nodesAfter" value="following-sibling::node()"/>
      <sch:let name="nodesBefore" value="preceding-sibling::node()"/>
      <!-- Add the content that is after the current element in a separate paragraph -->
      <sqf:add match="parent::node()" node-type="element" target="p" position="after" use-when="count($nodesAfter) > 1 or (count($nodesAfter) = 1 and normalize-space($nodesAfter)!='')">
        <xsl:apply-templates mode="copyExceptClass" select="$nodesAfter"/>
      </sqf:add>
      <!-- Add the content that is before the current element in a separate paragraph -->
      <sqf:add match="parent::node()" node-type="element" target="p" position="after">
        <xsl:apply-templates mode="copyExceptClass" select="$currentNode"/>
      </sqf:add>
      <!-- Add the the current element in a separate paragraph -->
      <sqf:add match="parent::node()" node-type="element" target="p" position="after" use-when="count($nodesBefore) > 1 or (count($nodesBefore) = 1 and normalize-space($nodesBefore)!='')">
        <xsl:apply-templates mode="copyExceptClass" select="$nodesBefore"/>
      </sqf:add>
      <!-- Delete the parent node. -->
      <sqf:delete match="parent::node()"/>
    </sqf:fix>
  </sqf:fixes>
  
  <sch:pattern>
    <!-- Report cases when the lines in a codeblock exceeds 90 characters -->
    <sch:rule context="*[contains(@class, ' pr-d/codeblock ') and not(@outputclass='language-css') and not(@outputclass='language-bourne')]" role="warn">
      <sch:let name="offendingLines" value="oxyF:lineLengthCheck(string(), 90)"/>
      <sch:report test="string-length($offendingLines) > 0">
        Lines (<sch:value-of select="$offendingLines"/>) in codeblocks should not exceed 90 characters. </sch:report>
    </sch:rule>
  </sch:pattern>
  
    
  
  <sch:pattern>
    <!-- Report possible case in which a codeblock containg XML was not marked appropriately. -->
    <sch:rule context="*[contains(@class, ' pr-d/codeblock ')]" role="warn">
      <sch:report test="not(@outputclass)" sqf:fix="add_outputclass"> Possible XML Codeblock
        without @outputclass set to it. </sch:report>
      
      <sqf:fix id="add_outputclass">
        <sqf:description>
          <sqf:title>Add @outputclass attribute to codeblock</sqf:title>
        </sqf:description>
        <sqf:add node-type="attribute" target="outputclass"></sqf:add>
      </sqf:fix>
    </sch:rule>
  </sch:pattern>
  
  <sch:pattern>
    <!-- Report two consecutive note elements -->
    <sch:rule context="*[contains(@class, ' topic/note ')]">
      <sch:report test="preceding-sibling::element()[1][contains(@class, ' topic/note ')] and 
        @type=preceding-sibling::element()[1]/@type" role="warn" sqf:fix="changeType changeTypePrev"> Try to avoid inserting two consecutive notes with the same type. </sch:report>
      <sqf:fix id="changeType">
        <sqf:description>
          <sqf:title>Change current note type</sqf:title>
        </sqf:description>
        <sqf:delete match="@type" use-when="@type"/>
        <sqf:add node-type="attribute" target="type"/>
      </sqf:fix>
      <sqf:fix id="changeTypePrev">
        <sqf:description>
          <sqf:title>Change previous note type</sqf:title>
        </sqf:description>
        <sqf:delete match="preceding-sibling::element()[1]/@type" use-when="@type"/>
        <sqf:add match="preceding-sibling::element()[1]" node-type="attribute" target="type"/>
      </sqf:fix>
    </sch:rule>
  </sch:pattern>
  
  <sch:pattern>
    <!-- Most DITA elements should not be empty -->
    <sch:rule
      context="
      *[not(contains(@class, ' topic/image '))]
      [not(contains(@class, ' topic/colspec '))]
      [not(contains(@class, ' map/topicref '))]
      [not(contains(@class, ' topic/data '))]
      [not(contains(@class, ' topic/vrm '))]
      [not(contains(@class, ' topic/entry '))]
      [not(contains(@class, ' topic/stentry '))]
      [not(contains(@class, ' topic/object '))]
      [not(contains(@class, ' topic/param '))]
      [not(contains(@class, ' topic/resourceid '))]
      [not(@conref)]
      [not(@conkeyref)]
      [not(@keyref)]
      [not(@href)]
      [not(ancestor::*[@conref or @conkeyref])]">
      <sch:report test="not(node())"> Empty element. Most DITA elements should not be empty.</sch:report>
    </sch:rule>
  </sch:pattern>
  
  
  <!-- Add Ids to all sections, in this way you can easly refer the section from documentation -->
  <sch:pattern>
    <sch:rule context="*[contains(@class, ' topic/section ') and not(contains(@class, ' task/')) and not(contains(@class, ' glossentry/'))]">
      <sch:assert test="@id" sqf:fix="addId addIds" role="warn">All sections should have an @id attribute</sch:assert>
      
      <sqf:fix id="addId">
        <sqf:description>
          <sqf:title>Add @id to the current section</sqf:title>
          <sqf:p>Add an @id attribute to the current section. The ID is generated from the section title.</sqf:p>
        </sqf:description>
        
        <!-- Generate an id based on the section title. If there is no title then generate a random id. -->
        <sqf:add target="id" node-type="attribute"
          select="if (exists(title) and string-length(title) > 0) 
                    then substring(lower-case(replace(replace(normalize-space(string(title)), '\s', '_'), '[^a-zA-Z0-9_]', '')), 0, 50) 
                    else generate-id()"/>
      </sqf:fix>
      
      <sqf:fix id="addIds">
        <sqf:description>
          <sqf:title>Add @id to all sections</sqf:title>
          <sqf:p>Add an @id attribute to each section from the document. The ID is generated from the section title.</sqf:p>
        </sqf:description>
        <!-- Generate an id based on the section title. If there is no title then generate a random id. -->
        <sqf:add match="//section[not(@id)]" target="id" node-type="attribute" 
          select="if (exists(title) and string-length(title) > 0) 
                    then substring(lower-case(replace(replace(normalize-space(string(title)), '\s', '_'), '[^a-zA-Z0-9_]', '')), 0, 50) 
                    else generate-id()"/>
      </sqf:fix>
    </sch:rule>
  </sch:pattern>
  
  <!-- The topic titles should not be longer than 75 characters. -->
  <sch:pattern>
    <sch:rule context="*[contains(@class, ' topic/title ') 
      and not(contains(@class, ' bookmap/booktitle '))
      and not(parent::node()/contains(@class, ' topic/section '))
      and not(parent::node()/contains(@class, ' topic/fig '))
      and not(parent::node()/contains(@class, ' topic/table '))
      and not(parent::node()/contains(@class, ' topic/example '))]" role="warn">
      <sch:assert test="string-length(string(.)) lt 76">
        The title is too long (<sch:value-of select="string-length(string(.))"/> chars).
        It should be less than 75 characters.</sch:assert>
    </sch:rule>

    <!-- Rules that checks the menucascade element has more than one uicontrol element -->
    <sch:rule context="menucascade">
      <sch:assert test="count(uicontrol) > 1" role="warn" sqf:fix="addUicontrol removeMenucascade">
        "menucascade" should contain more than one "uicontrol"</sch:assert>
      
      <sqf:fix id="addUicontrol">
        <sqf:description>
          <sqf:title>Add new "uicontrol" element</sqf:title>
        </sqf:description>
        <sqf:add node-type="element" position="last-child" target="uicontrol"/>
      </sqf:fix>
      
      <sqf:fix id="removeMenucascade">
        <sqf:description>
          <sqf:title>Remove "menucascade" and just left as a "uicontrol"</sqf:title>
        </sqf:description>
        <sqf:replace>
          <xsl:apply-templates mode="copyExceptClass" select="node()"/>
        </sqf:replace>
      </sqf:fix>
    </sch:rule>
  </sch:pattern>
  
  <!-- Rules that checks the fig element has a title and is not empty -->
  <sch:pattern>
    <sch:rule context="*[contains(@class, ' topic/fig ') and not(contains(@class, ' pr-d/syntaxdiagram ')) and not(contains(@class, ' topic/fig ut-d/imagemap '))]">
      <sch:assert test="child::*[contains(@class, ' topic/title ')]" role="warn" sqf:fix="addTitle">
        The figure should have a title.
      </sch:assert>
      
      <sqf:fix id="addTitle">
        <sqf:description>
          <sqf:title>Add a title element inside figure</sqf:title>
        </sqf:description>
        <sqf:user-entry name="titleVal">
          <sqf:description>
            <sqf:title>Title element content</sqf:title>
          </sqf:description>
        </sqf:user-entry>
        <sqf:add node-type="element" target="title" position="first-child" select="$titleVal"/>
      </sqf:fix>
    </sch:rule>
    
    <sch:rule context="*[contains(@class, ' topic/fig ')]/*[contains(@class, ' topic/title ')]">
      <sch:report test="not(node())" role="warn" sqf:fix="addTitleContent">
        The title should have content.
      </sch:report>
      <sqf:fix id="addTitleContent">
        <sqf:description>
          <sqf:title>Add title content</sqf:title>
        </sqf:description>
        <sqf:user-entry name="titleVal">
          <sqf:description>
            <sqf:title>Title element content</sqf:title>
          </sqf:description>
        </sqf:user-entry>
        <sqf:add position="first-child" select="$titleVal"/>
      </sqf:fix>
    </sch:rule>
  </sch:pattern>

  <!-- The fig element should always be in a paragraph because otherwise the output doesn't produce enough space before the image. -->
  <sch:pattern>
    <sch:rule context="*[contains(@class, ' topic/fig ') and not(contains(@class, ' topic/fig ut-d/imagemap '))]" role="warn">
      <sch:let name="precedingText" value="preceding-sibling::text()"/>
      <sch:let name="followingText" value="following-sibling::text()"/>
      <sch:assert test=".[parent::p][count(parent::node()/child::*) = 1]
        [not($precedingText) or $precedingText[normalize-space()='']]
        [not($followingText) or $followingText[normalize-space()='']]" 
        sqf:fix="splitParagraphBeforeAndAfter wrapInParagraph">
        The fig element should be wrapped in a paragraph.</sch:assert>
    </sch:rule>
  </sch:pattern>

  <!-- The dl element should be wrapped in a paragraph to make the output look better. -->
  <sch:pattern>
    <sch:rule context="*[contains(@class, ' topic/dl ')]" role="warn">
      <sch:assert test="parent::node()/local-name() = 'p'" sqf:fix="wrapInParagraph">The dl element should be wrapped in a paragraph.</sch:assert>
    </sch:rule>
  </sch:pattern>
  
  <!-- Rules that checks the section element has a title and is not empty -->
  <sch:pattern>
    <!-- Check that the section should have a title. -->
    <sch:rule context="*[contains(@class, ' topic/section ') 
      and not(contains(@class, ' task/result ')) 
      and not(contains(@class, ' task/steps-informal ')) 
      and not(contains(@class, ' task/prereq ')) 
      and not(contains(@class, ' task/postreq ')) 
      and not(contains(@class, ' task/context '))]">
      <!-- The section should have a title or a conKeyref or a conref -->
      <sch:assert test="child::*[contains(@class, ' topic/title ')] or @conkeyref or @conref" role="warn" sqf:fix="addTitle">
        The section should have a title.
      </sch:assert>
      
      <sqf:fix id="addTitle">
        <sqf:description>
          <sqf:title>Add a title element inside section</sqf:title>
        </sqf:description>
        <sqf:user-entry name="titleVal">
          <sqf:description>
            <sqf:title>Title element content</sqf:title>
          </sqf:description>
        </sqf:user-entry>
        <sqf:add node-type="element" target="title" position="first-child" select="$titleVal"/>
      </sqf:fix>
    </sch:rule>
    
    <sch:rule context="*[contains(@class, ' topic/section ')]/*[contains(@class, ' topic/title ')]">
      <sch:report test="not(node())" role="warn" sqf:fix="addTitleContent">
        The title should have content.
      </sch:report>
      <sqf:fix id="addTitleContent">
        <sqf:description>
          <sqf:title>Add title content</sqf:title>
        </sqf:description>
        <sqf:user-entry name="titleVal">
          <sqf:description>
            <sqf:title>Title element content</sqf:title>
          </sqf:description>
        </sqf:user-entry>
        <sqf:add position="first-child" select="$titleVal"/>
      </sqf:fix>
    </sch:rule>
  </sch:pattern>
  
  <sch:pattern>
    <!-- The text is not allowed directly in the section, it should be in a paragraph. Otherwise the output will be rendered with no space after the section -->
    <sch:rule context="*[contains(@class, ' topic/section ')]">
      <sch:report test="child::text()[string-length(normalize-space(.)) > 0]">The text in a section element should be in a paragraph.</sch:report>
    </sch:rule>
  </sch:pattern>
  
  <!-- XML Schema used instead of DTD. -->
  <sch:pattern id="checkSchemaUseOnDITATopics">
    <sch:rule context="/*">
      <sch:report test="@*:noNamespaceSchemaLocation">We should not use XML Schema as schema for
        DITA topics! Instead we should use the corresponding DTD!</sch:report>
    </sch:rule>
  </sch:pattern>
  
  <!-- Titles without double quotes. -->
  <sch:pattern>
    <sch:rule context="*[contains(@class, ' topic/title ')]">
      <sch:report test="contains(., '&quot;')"> Title contains quotes. This breaks the Java Help System. See EXM-36415.</sch:report>
      <sch:report test="contains(.,'&amp;') "> Title contains markup. This breaks the Java Help System. See EXM-36415.</sch:report>
      <sch:report test="contains(.,'&lt;')"> Title contains markup. This breaks the Java Help System. See EXM-36415.</sch:report>
    </sch:rule>
    
  </sch:pattern>
  
  <!-- msgblock, screen, pre -> codeblock -->
  <sch:pattern>
    <sch:rule context="msgblock | screen | pre"> 
      <sch:report test="true()">You should not use this element because it is not rendered properly in the output. Use a "codeblock" element instead.        
      </sch:report>
    </sch:rule>
  </sch:pattern>
  
  <!-- msgph -> codeph -->
  <sch:pattern>
    <sch:rule context="msgph"> 
      <sch:report test="true()" sqf:fix="replaceWithCodeph">You should not use this element because it is not rendered properly in the output. Use a "codeph" element instead.        
      </sch:report>
      <sqf:fix id="replaceWithCodeph">
        <sqf:description>
          <sqf:title>Replace "msgph" with "codeph"</sqf:title>
        </sqf:description>
        <sqf:replace node-type="element" target="codeph" select="node()"/>
      </sqf:fix>
    </sch:rule>
  </sch:pattern>
  
  <!-- wintitle,apiname,parmname,varname   -> b, i, uicontrol, filepath, codeph -->
  <sch:pattern>
    <sch:rule context="wintitle | apiname | parmname | varname "> 
      <sch:report test="true()">You should not use this element because it is not rendered properly in the output. Use one of the following elements instead: b, i, uicontrol, filepath, codeph, term.        
      </sch:report>
    </sch:rule>
  </sch:pattern>
  
  <!-- keyword -> b, i, uicontrol, filepath, codeph -->
  <sch:pattern>
    <sch:rule context="keyword"> 
      <sch:report test="not(@keyref) and not(ancestor::node()/local-name() = 'keydef')">
        You should not use this element because it is not rendered properly in the output. Use one of the following elements instead: b, i, uicontrol, filepath, codeph, term.
      </sch:report>        
    </sch:rule>
  </sch:pattern>
  
  <!-- example -> create a manual rendering inside a new paragraph -->
  <sch:pattern>
    <sch:rule context="example"> 
      <sch:report test="true()">You should not use this element because it is not rendered properly in the output. Create a manual rendering inside a new paragraph.        
      </sch:report>
    </sch:rule>
  </sch:pattern>
  
  <!-- List items that have a paragraph as their first child are not rendered ok in WebHelp. -->
  <sch:pattern>
    <sch:rule context="li">
      <sch:report test="child::node()[1][not(self::text()) or normalize-space(self::text())=''] and child::*[1][local-name() = 'p']" subject="p">
        The list item should not have a paragraph as its first child.</sch:report>
    </sch:rule>
  </sch:pattern> 
  
  <sch:pattern>
    <sch:rule context="text()">
      <sch:report test="matches(.,'[oO][xX]ygen') 
        and parent::node()/local-name() != 'ph'
        and parent::node()/local-name() != 'keyword'
        and parent::node()/local-name() != 'xmlelement'
        and parent::node()/local-name() != 'filepath'
        and parent::node()/local-name() != 'indexterm'
        and parent::node()/local-name() != 'shortdesc'
        and parent::node()/local-name() != 'entry'
        and parent::node()/local-name() != 'link'
        and parent::node()/local-name() != 'dt'
        and parent::node()/local-name() != 'linktext'
        and parent::node()/local-name() != 'uicontrol'
        and parent::node()/local-name() != 'term'
        and parent::node()/local-name() != 'b'
        and parent::node()/local-name() != 'xref'
        and parent::node()/local-name() != 'i'
        and parent::node()/local-name() != 'codeph'
        and parent::node()/local-name() != 'codeblock'
        and parent::node()/local-name() != 'title'" sqf:fix="replaceWithProKey">
        Should use product key instead!
      </sch:report>
      
      <sqf:fix id="replaceWithProKey">
        <sqf:description>
          <sqf:title>Replace with product key</sqf:title>
        </sqf:description>
        <sqf:stringReplace regex="[oO][xX]ygen">
          <ph keyref="product"/>
        </sqf:stringReplace>
      </sqf:fix>
    </sch:rule>
  </sch:pattern>
  
  <!-- Look for non breakable space characters and replace them with normal space characters -->
  <sch:pattern id="checkNoBreakableSpace">
    <sch:rule context="text()">
      <!-- Check if the text contains a weird space character which made its way into UG via pasting from other sources -->
      <sch:report test="contains(., ' ')" sqf:fix="replaceNBSP">Replace non breakable space with a normal space character</sch:report>
      <sqf:fix id="replaceNBSP">
        <sqf:description>
          <sqf:title>Replace NBSP with a normal space character</sqf:title>
        </sqf:description>
        <sqf:stringReplace regex="[ ]" xml:space="preserve"> </sqf:stringReplace>
      </sqf:fix>
    </sch:rule>
  </sch:pattern>
  
  <!-- Unwrap all elements inside a codeblocks -->
  <sch:pattern>
    <sch:rule context="codeblock/*">
      <sch:report test="." sqf:fix="del">No elements are allowed in codeblocks</sch:report>
      
      <sqf:fix id="del">
        <sqf:description>
          <sqf:title>Unwrap element</sqf:title>
        </sqf:description>
        <sqf:replace select="text()"></sqf:replace>
      </sqf:fix>
    </sch:rule>
  </sch:pattern>
  
  <!-- There should be no markup inside a topic title -->
  <sch:pattern>
    <sch:rule context="topic/title/* 
                    | task/title/* 
                    | troubleshooting/title/* 
                    | concept/title/* 
                    | glossentry/title/*">
      <sch:report test=". and name(.) != 'ph'" sqf:fix="del">No elements other than "ph" are allowed inside topic titles</sch:report>
      
      <sqf:fix id="del">
        <sqf:description>
          <sqf:title>Unwrap element</sqf:title>
        </sqf:description>
        <sqf:replace select="text()"></sqf:replace>
      </sqf:fix>
    </sch:rule>
  </sch:pattern>
  
  
  <!-- Rules for 'related-links':
    - we want the 'related-links' to contain only one 'linklist'
    - the 'linklist' must have a title
    - if there is a 'link' added directly in a ''related-links', it sould be moved in a 'linklist'
   -->
  <sch:pattern>
    <sch:rule context="related-links/link">
      <sch:assert test="false()" sqf:fix="wrapInLinkList moveInExistingLinkList" role="warn">
        The 'link' element should be added in a 'linklist'</sch:assert>
      
      <!-- Create a new link list -->
      <sqf:fix id="wrapInLinkList" use-when="not(parent::node()/linklist)">
        <sqf:description>
          <sqf:title>Move all the links in a link list</sqf:title>
        </sqf:description>
        <!-- The value for the title element must be specified by the user. -->
        <sch:let name="title" value="'Related Information:'"/>
        <sqf:add node-type="element" target="linklist" position="before">
          <title><xsl:value-of select="$title"/></title>
          <xsl:apply-templates mode="copyExceptClass" select="parent::node()/link"/>
        </sqf:add>
        <sqf:delete match="parent::node()/link"/>
      </sqf:fix>
      
      <!-- Move all the links in the existing link list -->
      <sqf:fix id="moveInExistingLinkList" use-when="parent::node()/linklist">
        <sqf:description>
          <sqf:title>Move all the links in the existing link list</sqf:title>
        </sqf:description>
        <sch:let name="links" value="parent::node()/link"/>
        <sqf:add match="parent::node()/linklist[1]" position="last-child">
          <xsl:apply-templates mode="copyExceptClass" select="$links"/>
        </sqf:add>
        <sqf:delete match="$links"/>
      </sqf:fix>
    </sch:rule>
    
    <sch:rule context="related-links/linklist/title">
      <sch:assert test="text() = 'Related Information:'" sqf:fix="correctTitle" role="warn">
        The title of a linklist must be 'Related Information:'
      </sch:assert>
      
      <sqf:fix id="correctTitle">
        <sqf:description>
          <sqf:title>Set the title to 'Related Information:'</sqf:title>
        </sqf:description>
        <sqf:replace match="text()" select="'Related Information:'"></sqf:replace>
      </sqf:fix>
    </sch:rule>
    
    <sch:rule context="related-links/linklist">
      <!-- The link list should have a title -->
      <sch:assert test="title" sqf:fix="add_title" role="warn">The linklist should have a title</sch:assert>
      
      <!-- Quick fix that adds a title element in a linklist -->
      <sqf:fix id="add_title">
        <sqf:description>
          <sqf:title>Add a title for the linklist</sqf:title>
        </sqf:description>
        <!-- The value for the title element must be specified by the user. -->
        <sch:let name="title" value="'Related Information:'"/>
        <sqf:add node-type="element" position="first-child" target="title" select="$title"/>
      </sqf:fix>
    
     <!-- Only one link list allowed -->
      <sch:report test="following-sibling::linklist" sqf:fix="mergeLinkLists" role="warn">
        Only one link list allowed
      </sch:report>
      
      <!-- Merge flowing link lists into current one -->
      <sqf:fix id="mergeLinkLists">
        <sqf:description>
          <sqf:title>Merge flowing link lists into current one</sqf:title>
        </sqf:description>
        <sqf:add position="last-child">
          <xsl:apply-templates mode="copyExceptClass" select="following-sibling::linklist/link"/>
        </sqf:add>
        <sqf:delete match="following-sibling::linklist"/>
      </sqf:fix>
    </sch:rule>
  </sch:pattern>

  <!-- Template used to copy the current node -->
  <xsl:template match="node() | @*" mode="copyExceptClass">
    <xsl:copy copy-namespaces="no">
      <xsl:apply-templates select="node() | @*" mode="copyExceptClass"/>
    </xsl:copy>
  </xsl:template>
  <!-- Template used to skip the @class attribute from being copied -->
  <xsl:template match="@class" mode="copyExceptClass"/>
  
  <!-- Template that breaks a text into its composing lines of text -->
  <xsl:function name="oxyF:lineLengthCheck" as="xs:string">
    <xsl:param name="textToBeChecked" as="xs:string"/>
    <xsl:param name="maxLength" as="xs:integer"/>
    <xsl:value-of>
      <xsl:for-each select="tokenize($textToBeChecked, '\n')">
        <xsl:if test="string-length(current()) > $maxLength">
          <xsl:value-of select="concat(position(), ' - ', string-length(current()), ', ') "/>
        </xsl:if>
      </xsl:for-each>
    </xsl:value-of>
  </xsl:function>
</sch:schema>
