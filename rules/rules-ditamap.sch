<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
  xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
  <!-- Rule that detects the use of both href and keyref attribute in the same topicref element. 
    While perfectly legit, we prefer to use only one of these attributes at a time. -->
  <sch:pattern>
    <sch:rule context="topicref">
      <sch:report test="@href and @keyref">
        Both "href" and "keyref" attributes set. Keep only one of them.
      </sch:report>
    </sch:rule>
  </sch:pattern>
</sch:schema>
