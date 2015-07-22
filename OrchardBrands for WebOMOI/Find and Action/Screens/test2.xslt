<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" exclude-result-prefixes="java ns"     xmlns="http://www.seagullsoftware.com/schemas/legasuite/screen"
    xmlns:ns="http://www.seagullsoftware.com/schemas/legasuite/screen"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:java="http://xml.apache.org/xslt/java">
<!-- CHANGE SEQUENCE (Field)                   -->
<!-- Search criteria:                          -->
<!--   where 'justification' is set to 'Right' -->
<!--   where the flag 'StripEnd' is 'false'    -->
<!--   where the flag 'StripBegin' is 'false'  -->
<!-- Actions:                                  -->
<!--   set the flag 'StripBegin' to 'false'    -->
<!--   set the flag 'StripEnd' to 'false'      -->
<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"  cdata-section-elements="ns:IdentificationData ns:IdentificationDataUnicode"/>
<xsl:template match="ns:HostField">
  <xsl:choose>
      <xsl:when test="(count(./ns:Flags/ns:RightAdjust) = 1) and (count(./ns:Flags/ns:StripEnd) = 0) and (count(./ns:Flags/ns:StripBegin) = 0)">
        <xsl:copy>
           <xsl:apply-templates select="*[not(self::ns:Flags)]"/>
           <Flags>
             <xsl:apply-templates select="./ns:Flags/ns:DynamicLength"/>
             <xsl:apply-templates select="./ns:Flags/ns:DynamicXMove"/>
             <xsl:apply-templates select="./ns:Flags/ns:DynamicXSize"/>
             <xsl:apply-templates select="./ns:Flags/ns:DynamicYMove"/>
             <xsl:apply-templates select="./ns:Flags/ns:DynamicYSize"/>
             <xsl:apply-templates select="./ns:Flags/ns:ExactLength"/>
             <xsl:apply-templates select="./ns:Flags/ns:FieldExitRequired"/>
             <xsl:apply-templates select="./ns:Flags/ns:LeftAdjust"/>
             <xsl:apply-templates select="./ns:Flags/ns:NoAdjust"/>
             <xsl:apply-templates select="./ns:Flags/ns:RightAdjust"/>
             <xsl:apply-templates select="./ns:Flags/ns:Reverse"/>
             <xsl:apply-templates select="./ns:Flags/ns:StripPunctuation"/>
             <xsl:apply-templates select="./ns:Flags/ns:AutoAdjust"/>
             <xsl:apply-templates select="./ns:Flags/ns:MetaAdjust"/>
             <xsl:apply-templates select="./ns:Flags/ns:HostAdjust"/>
             <xsl:apply-templates select="./ns:Flags/ns:HindiDigitsOnHost"/>
           </Flags>
        </xsl:copy>
      </xsl:when>
      <xsl:otherwise>
        <xsl:copy>
           <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
      </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- Copy an ordinary node or attribute-->
<xsl:template match="@*|node()">
  <xsl:copy>
     <xsl:apply-templates select="@*|node()"/>
  </xsl:copy>
</xsl:template>
</xsl:stylesheet>
