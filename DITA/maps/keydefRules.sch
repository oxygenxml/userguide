<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt3"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
    <sch:pattern>
    
      <!-- Add a rule to check that the currentYear key value matches 
        the year of the current date 
      
      The code fragment to check is:
      ...
      <keydef keys="currentYear">
        <topicmeta>
          <keywords>
            <keyword>2026</keyword>
          </keywords>
        </topicmeta>
      </keydef>
      ...
      
      -->
      <sch:rule context="keydef[@keys='currentYear']">
        <sch:let name="currentYear" value="year-from-date(current-date())"/>
        <sch:let name="keyValue" value="topicmeta/keywords/keyword/text()"/>
        <sch:assert test="$keyValue = string($currentYear)" sqf:fix="fixCurrentYear">
          The currentYear key value must match the current year. Expected: <sch:value-of select="$currentYear"/>, but found: <sch:value-of select="$keyValue"/>
        </sch:assert>
        
        <sqf:fix id="fixCurrentYear">
          <sqf:description>
            <sqf:title>Update currentYear to current date year</sqf:title>
          </sqf:description>
          <sqf:replace match="topicmeta/keywords/keyword" target="keyword" 
            node-type="element" select="year-from-date(current-date())"/>
        </sqf:fix>
      </sch:rule>
      
    
    
    </sch:pattern>
</sch:schema>