<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" 
  xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
  queryBinding="xslt2">
  <sch:ns uri="http://oxygenxml.com/dita/blockElements" prefix="e"/>
  <sch:pattern id="check.note">
    <sch:rule context="note" role="warning">
      <sch:let name="paragraphs" value="count(*[substring-before(substring-after(@class, ' '), ' ')='topic/p'])"/>
      <sch:let name="blockElements" value="count(*[substring-before(substring-after(@class, ' '), ' ')=document('blockElements.xml')//e:class])"/>
      <sch:report test="$paragraphs=1 and $blockElements=1"
        > Please remove the "<sch:value-of select="name(*[1])"/>" element and place its text directly in
        the note. If there is just one block of text in the note, then the note should be left as
        string-only. This stores the minimum of mark-up, and simplifies the processed output. If
        there are multiple blocks in the note, then paragraphs, lists (or other block elements)
        should be used. </sch:report>
      <sch:report test="$blockElements > 0 and count(text()[normalize-space(.)!=''])>0" role="error"
        > You should wrap the text that you entered directly inside the note element in a "p"
        element or other block element, or move it inside one of the existing block elements.
        Alternatively remove all the block elements and leave the note to contain only text.
        String-only text should not be used in the same note alongside block elements. </sch:report>
      <sch:report test="matches(., 'Note:')"
        > Please remove the "Note:" text that starts your note! The mark-up of that element in DITA
        must always follow the pattern: &lt;note>Before having...&lt;/note> and never:
        &lt;note>Note: Before having...&lt;/note>. Embedding the label for an element in its text
        will limit the ways in which the element can be presented. </sch:report>
    </sch:rule>
  </sch:pattern>

  <sch:pattern>
    <sch:rule context="*[contains(@class, ' topic/li ')]">
      <sch:let name="paragraphs" value="count(*[substring-before(substring-after(@class, ' '), ' ')='topic/p '])"/>
      <sch:report test="$paragraphs>0 and count(text()[normalize-space(.)!=''])>0" role="error" sqf:fix="wrapInP">
        When a "p" element exists later within the <sch:name/> element, you should also wrap the initial text content in a "p"
        element. </sch:report>
      <sqf:fix id="wrapInP">
        <sqf:description>
          <sqf:title>Wrap in paragraph</sqf:title>
        </sqf:description>
        <sqf:replace match="text()[normalize-space(.)!='']">
          <p><sqf:copy-of select="."/></p>
        </sqf:replace>
      </sqf:fix>
    </sch:rule>
  </sch:pattern>
</sch:schema>
