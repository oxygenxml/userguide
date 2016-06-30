<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
  queryBinding="xslt2">
  
  <pattern abstract="true" id="avoidWordInElement">
    <title>Issue a warning if a word appears inside a specified
      element</title>
    <p>This pattern allows you to advise users not to use a specific
      word in an element.</p>
    <p>As parameters we have <emph>word</emph> that points to the word
      that we need to check, <emph>element</emph> that points to the
      element we will check to not contain that word and
      <emph>message</emph> that contains the message we should display
      to the user in case the word appears in the specified element.</p>
    <parameters xmlns="http://oxygenxml.com/ns/schematron/params">
      <parameter>
        <name>element</name>
        <desc>Specifies the element we will verify to not contain a specified word.</desc>
      </parameter>
      <parameter>
        <name>word</name>
        <desc>Specifies the word we will look for.</desc>
      </parameter>
      <parameter>
        <name>message</name>
        <desc>The message the end user will see when the specified word appears
          in the specified element.</desc>
      </parameter>
    </parameters> 
    <rule context="$element">
      <assert test="not(tokenize(normalize-space(.), ' ') = '$word')"
        role="warn" sqf:fix="avoidWordInElement_deleteWord avoidWordInElement_replaceWord">
        $message
      </assert>
    </rule>
  </pattern>
  
  <pattern abstract="true" id="avoidEndFragment">
    <title>Issue a warning if a an element end with a specified fragment
      or character</title>
    <p>This pattern allows you to advise users not to use a specific end
      sequence to end an element.</p>
    <p>As parameters we have <emph>fragment</emph> that points to the
      text that we need to check, <emph>element</emph> that points to
      the element we will check to not end with that fragment and
      <emph>message</emph> that contains the message we should display
      to the user in case the fragment appears at the end of the the
      specified element.</p>
    <parameters xmlns="http://oxygenxml.com/ns/schematron/params">
      <parameter>
        <name>element</name>
        <desc>Specifies the element we will verify to not contain a specified word.</desc>
      </parameter>
      <parameter>
        <name>fragment</name>
        <desc>Specifies the text to check.</desc>
      </parameter>
      <parameter>
        <name>message</name>
        <desc>The message the end user will see when the specified text ends with the given fragment.</desc>
      </parameter>
    </parameters> 
    <rule context="$element">
      <assert test="not(ends-with(normalize-space(.), '$fragment'))"
        role="warn" sqf:fix="avoidEndFragment_deleteFragment avoidEndFragment_replaceFragment">
        $message
      </assert>
    </rule>
  </pattern>
  
  <pattern abstract="true" id="avoidAttributeInElement">
    <title>Issue a warning if an attribute appears inside a specified
      element</title>
    <p>This pattern allows you to advise users not to use a specific
      attribute in an element.</p>
    <p>As parameters we have <emph>attribute</emph> that points to the
      attribute that we need to check, <emph>element</emph> that points
      to the element we will check to not contain that attribute and
      <emph>message</emph> that contains the message we should display
      to the user in case the attribute appears in the specified
      element.</p>
    <parameters xmlns="http://oxygenxml.com/ns/schematron/params">
      <parameter>
        <name>element</name>
        <desc>Specifies the element we will verify to not contain a specified word.</desc>
      </parameter>
      <parameter>
        <name>attribute</name>
        <desc>Specifies the forbidden attribute.</desc>
      </parameter>
      <parameter>
        <name>message</name>
        <desc>The message the end user will see when the forbidden attribute is encountered.</desc>
      </parameter>
    </parameters> 
    <rule context="$element">
      <assert test="not(@$attribute)" role="warn" 
        sqf:fix="avoidAttributeInElement_delete avoidAttributeInElement_rename">
        $message
      </assert>
    </rule>
  </pattern>
  
  <pattern id="recommendElementInParent" abstract="true">
    <title>Recommend usage of an element inside a parent element</title>
    <p>This pattern allows you to advise users to enter a specific
      element inside a parent, usually that element is optional but we
      want to advise users to use it.</p>
    <p>As parameters we have <emph>parent</emph> that points to the
      parent element, <emph>element</emph> that points to the child
      element and <emph>message</emph> that contains the message we
      should display to the user in case the element is not present
      within the parent element.</p>
    <parameters xmlns="http://oxygenxml.com/ns/schematron/params">
      <parameter>
        <name>parent</name>
        <desc>Specifies the parent element.</desc>
      </parameter>
      <parameter>
        <name>element</name>
        <desc>Specifies the element that should appear in the parent.</desc>
      </parameter>
      <parameter>
        <name>message</name>
        <desc>The message the end user will see when recommended child is not found in the parent.</desc>
      </parameter>
    </parameters> 
    <rule context="$parent">
      <assert test="$element" role="warn"
        sqf:fix="recommendElementInParent_createAfterAnchor">
        $message
      </assert>
    </rule>
  </pattern>
  
  <pattern id="restrictWords" abstract="true">
    <title>Check the number of words to be within certain limits</title>
    <p>This pattern allows to check that the number of words in an
      element fits between a lower and an upper limit and instructs the
      user to stay within those limits.</p>
    <p>As parameters we have <emph>parentElement</emph> that specifies
      the element containing the text to be checked,
      <emph>minWords</emph> and <emph>maxWords</emph> that specifies the
      minimum and maximum number of words, respectively, and 
      <emph>message</emph> that specifies the message that we will show to the
      user if the number of words is outside the specified limits.</p>
    <parameters xmlns="http://oxygenxml.com/ns/schematron/params">
      <parameter>
        <name>parentElement</name>
        <desc>Specifies the element who's word number should be counted.</desc>
      </parameter>
      <parameter>
        <name>minWords</name>
        <desc>Specifies the minimum number of words that is accepted.</desc>
      </parameter>
      <parameter>
        <name>maxWords</name>
        <desc>Specifies the maximum number of words that is accepted.</desc>
      </parameter>
      <parameter>
        <name>message</name>
        <desc>An additional message we should display to the user in case the
          number of words is not within the specified limits.</desc>
      </parameter>
    </parameters> 
    <rule context="$parentElement">
      <let name="words" value="count(tokenize(normalize-space(.), ' '))"/>
      <assert test="$words &lt;= $maxWords" role="warn"
        sqf:fix="restrictWords_setNew">
        $message
        You have <value-of select="$words"/>
        <value-of select="if ($words=1) then ' word' else ' words'"/>. 
      </assert>
      <assert test="$words &gt;= $minWords" role="warn"
        sqf:fix="restrictWords_setNew">
        $message
        You have <value-of select="$words"/>
        <value-of select="if ($words=1) then ' word' else ' words'"/>.
      </assert>
    </rule>
  </pattern>
  
  <pattern id="restrictCharacters" abstract="true">
    <title>Check the number of characters to be within certain limits</title>
    <p>This pattern allows to check that the number of characters in an
      element is between a lower and an upper limit and instructs the
      user to stay within those limits.</p>
    <p>As parameters we have <emph>parentElement</emph> that specifies
      the element containing the text to be checked,
      <emph>minChars</emph> and <emph>maxChars</emph> that specifies the
      minimum and maximum number of charactes, respectively, a 
      <emph>normalize</emph> parameter that controls what happens with 
      the whitespace - if set to <emph>true</emph> or <emph>yes</emph> then 
      consecutive whitespace will be normalized and leading and trailing 
      whitespace will be discarded and 
      <emph>message</emph> that specifies the message that we will show to the
      user if the number of characters is outside the specified limits.</p>
    <parameters xmlns="http://oxygenxml.com/ns/schematron/params">
      <parameter>
        <name>parentElement</name>
        <desc>Specifies the element who's number of characters should be counted.</desc>
      </parameter>
      <parameter>
        <name>minChars</name>
        <desc>Specifies the minimum number of characters that is accepted.</desc>
      </parameter>
      <parameter>
        <name>maxChars</name>
        <desc>Specifies the maximum number of characters that is accepted.</desc>
      </parameter>
      <parameter>
        <name>normalize</name>
        <desc>Set this to "true" or "yes" if you want the characters to be counted after
          normalizing the content of the element.</desc>
      </parameter>
      <parameter>
        <name>message</name>
        <desc>An additional message we should display to the user in case the
          number of characters is not within the specified limits.</desc>
      </parameter>
    </parameters> 
    <rule context="$parentElement">
      <let name="characters" value="string-length(if ($normalize = ('true', 'true()', 'yes')) then normalize-space(.) else .)"/>
      <assert test="$characters &lt;= $maxChars" role="warn">
        $message
        It is recommended to not exceed $maxChars
        <value-of select="if ($maxChars=1) then ' character' else ' characters'"/>!
        You have <value-of select="$characters"/>
        <value-of select="if ($characters=1) then ' character' else ' characters'"/>. 
      </assert>
      <assert test="$characters &gt;= $minChars" role="warn"> 
        $message
        It is
        recommended to have at least $minChars
        <value-of select="if ($maxChars=1) then ' character' else ' characters'"/>!
        You have <value-of select="$characters"/>
        <value-of select="if ($characters=1) then ' character' else ' characters'"/>.
      </assert>
    </rule>
  </pattern>
  
  
  <pattern id="restrictNesting" abstract="true">
    <title>Restrict nesting levels for an element</title>
    <p>Check the number of nesting levels of an element. 
      This may be used for example to enforce
      that an element should not be nested more than 3 levels.</p>
    <p>As parameters we have <emph>element</emph> that specifies
      the element to be checked,
      <emph>maxNestingLevel</emph> that specifies the maximum number of 
      ancestors with the same name as the element are allowed and 
      <emph>message</emph> that specifies the message that we will show to the
      user if the nesting level is greater than the maximum value.</p>
    <parameters xmlns="http://oxygenxml.com/ns/schematron/params">
      <parameter>
        <name>element</name>
        <desc>Specifies the element that we should check for nesting.</desc>
      </parameter>
      <parameter>
        <name>maxNestingLevel</name>
        <desc>Specifies the maximum nesting level allowed for the specified element.
          In case the number of ancestors of the same type is larger than this a
          warning will be displayed to the user.</desc>
      </parameter>
      <parameter>
        <name>message</name>
        <desc>The message that should be presented to the user if the maximum 
          nesting level is exceeded.</desc>
      </parameter>
    </parameters>
    <rule context="$element">
      <assert test="count(ancestor::$element) &lt;= $maxNestingLevel">
        $message
      </assert>
    </rule>
  </pattern>
  
  
  
  <pattern id="restrictNumberOfChildren" abstract="true">
    <title>Restrict the number of children elements in a parent element</title>
    <p>Check the number of children of an element in a parent element to 
      be between specified limits.</p>
    <p>As parameters we have <emph>parentElement</emph> that specifies
      the element to be checked,
      <emph>element</emph> that specifies the element we will look for as child of
      the parentElement 
      <emph>min</emph> that specifies the minimum number of element children,
      <emph>max</emph> that specifies the maximum number of element children and
      <emph>message</emph> which points to an additional message that should be 
      diplayed to the user in case the number of children elements is not within
      the specified limits.</p>
    <parameters xmlns="http://oxygenxml.com/ns/schematron/params">
      <parameter>
        <name>parentElement</name>
        <desc>Specifies the element that we should check for nesting.</desc>
      </parameter>
      <parameter>
        <name>element</name>
        <desc>Specifies the element we will look for as child element.</desc>
      </parameter>
      <parameter>
        <name>min</name>
        <desc>The minimum number of occurrences allowed.</desc>
      </parameter>
      <parameter>
        <name>max</name>
        <desc>The maximum number of occurrences allowed.</desc>
      </parameter>
      <parameter>
        <name>message</name>
        <desc>A message we should present to the user in case the number of 
          children elements is not within the specified limits.</desc>
      </parameter>
    </parameters>
    <rule context="$parentElement">
      <let name="children" value="count($element)"/>
      <assert test="$children &lt;= $max" role="warn">
        $message 
        You have <value-of select="$children"/> 
        <value-of select="if ($children=1) then ' child element' else ' children elements'"/>. 
      </assert>
      <assert test="$children &gt;= $min" role="warn">$message 
        You have <value-of select="$children"/> 
        <value-of select="if ($children=1) then ' child element' else ' children elements'"/>.
      </assert>
    </rule>
  </pattern>
  
  <pattern id="restrictChildrenElements" abstract="true">
    <title>Restrict the elements that can appear inside a parent element</title>
    <p>You can use this to constrain the elements that can appear inside a parent element 
      to a set of allowed elements.</p>
    <p>As parameters we have <emph>parentElement</emph> that specifies
      the the element to be checked,
      <emph>allowedChildren</emph> that specifies the comma separated 
      list of allowed child element names and
      <emph>message</emph> that specifies an additional message we should output in 
      case the matched element contains elements that are not in the list of allowed elements.</p>
    <parameters xmlns="http://oxygenxml.com/ns/schematron/params">
      <parameter>
        <name>parentElement</name>
        <desc>Specifies the parent element.</desc>
      </parameter>
      <parameter>
        <name>allowedChildren</name>
        <desc>Specifies a comma separated list of element local names.</desc>
      </parameter>
      <parameter>
        <name>message</name>
        <desc>An additional message we should display to the user in case the 
          matched element contains children that are not in the list of allowed elements.</desc>
      </parameter>
    </parameters>
    <rule context="$parentElement/*">
      <let name="elements" 
        value="tokenize(translate(normalize-space('$allowedChildren'), ' ', ''), ',')"/>
      <assert test="local-name() = $elements" role="warn" sqf:fix="unwrapElement removeCurrentElement"> 
        $message
        The element '<value-of select="local-name()"/>' is not in the list 
        of allowed elements: ($allowedChildren).
      </assert>
    </rule>
  </pattern>
  
  
  <pattern id="avoidDuplicateContent" abstract="true">
    <title>Avoid having two elements with the same content</title>
    <p>Use this to identify an element that has the same content as one of its sibling elements
      and notify the user if that is not what you want.</p>
    <p>As parameters we have 
      <emph>matchElement</emph> that specifies the element to be checked,
      <emph>targetElement</emph> that specifies a sibling element to check against and
      <emph>message</emph> that specifies an additional message we should output in 
      case the matched element contains the same content as the target element.</p>
    <parameters xmlns="http://oxygenxml.com/ns/schematron/params">
      <parameter>
        <name>matchElement</name>
        <desc>Specifies the element to check.</desc>
      </parameter>
      <parameter>
        <name>targetElement</name>
        <desc>Specifies a sibling element name to check against.</desc>
      </parameter>
      <parameter>
        <name>message</name>
        <desc>A message we should display to the user in case the 
          matched element contains the same content as the target.</desc>
      </parameter>
    </parameters>
    <rule context="$matchElement">
      <assert test="not(
          normalize-space((preceding-sibling::$targetElement, following-sibling::$targetElement)[1]) 
          = normalize-space(.)
        )" role="warn"> 
        $message
      </assert>
    </rule>
  </pattern>
  
  
  
  <pattern id="requireContentAfterElement" abstract="true">
    <title>Check that we still have some text content following a specified element.</title>
    <p></p>
    <p>As parameters we have 
      <emph>element</emph> that specifies the element to be checked and
      <emph>message</emph> that specifies an additional message we should output in 
      case there is no content after the specified element.</p>
    <parameters xmlns="http://oxygenxml.com/ns/schematron/params">
      <parameter>
        <name>element</name>
        <desc>Specifies the element to check.</desc>
      </parameter>
      <parameter>
        <name>message</name>
        <desc>A message we should display to the user in case there is no 
          content after the reference element.</desc>
      </parameter>
    </parameters>
    <rule context="$element">
      <assert test="following::text()[normalize-space()!='']" role="warn"> 
        $message
      </assert>
    </rule>
  </pattern>
  
  <!-- DITA specific patterns start with 'dita-' prefix -->
  
  <pattern id="dita-allowedElementsForClass" abstract="true">
    <title>Check element names for a DITA element that has a specified class value</title>
    <p>Check that the element name matched by a specified class value is in a list of allowed element names.</p>
    <p>As parameters we have <emph>elementClass</emph> that specifies
      the DITA class value of the element to be checked,
      <emph>allowedElementNames</emph> that specifies the comma separated 
      list of allowed element names and
      <emph>message</emph> that specifies an additional message we should output in 
      case the matched element is not in the allowed list of elements.</p>
    <parameters xmlns="http://oxygenxml.com/ns/schematron/params">
      <parameter>
        <name>elementClass</name>
        <desc>Specifies the DITA class value of the element that we should check.</desc>
      </parameter>
      <parameter>
        <name>allowedElementNames</name>
        <desc>Specifies a comma separated list of element local names.</desc>
      </parameter>
      <parameter>
        <name>message</name>
        <desc>An additional message we should display to the user in case the 
          matched element is not found in the list of allowed elements.</desc>
      </parameter>
    </parameters>
    <rule context="*[contains(@class, ' $elementClass ')]">
      <let name="elements" 
        value="tokenize(translate(normalize-space('$allowedElementNames'), ' ', ''), ',')"/>
      <assert test="local-name() = $elements" role="warn" sqf:fix="removeCurrentElement"> 
        $message
        The element '<value-of select="local-name()"/>' is not in the list 
        of allowed elements: ($allowedElementNames).
      </assert>
    </rule>
  </pattern>
  
  <pattern id="dita-allowOnlyBlockElements" abstract="true">
    <title>Allow only DITA block elements inside an element</title>
    <p>Check that a specified element contains only DITA block elements and no inlines or text content.</p>
    <p>As parameters we have 
      <emph>element</emph> that specifies
      the DITA element to be checked.</p>
    <parameters xmlns="http://oxygenxml.com/ns/schematron/params">
      <parameter>
        <name>element</name>
        <desc>Specifies the DITA element that we should check to contain only block elements.</desc>
      </parameter>
      <parameter>
        <name>message</name>
        <desc>The message we should display to the user in case the 
          specified element contains text or inline elements.</desc>
      </parameter>
    </parameters>
    <rule context="$element[text()/normalize-space(.)!='']" role="warn">
      <assert test="false()">
        $message
      </assert>
    </rule>
    <rule context="$element/*">
      <assert test="substring-before(substring-after(@class, ' '), ' ')=document('blockElements.xml')//*:class">
        $message
      </assert>
    </rule>
  </pattern>
  
  
</schema>
