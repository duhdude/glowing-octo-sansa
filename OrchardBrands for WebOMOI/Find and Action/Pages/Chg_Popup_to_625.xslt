<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" exclude-result-prefixes="java ns"     xmlns="http://www.seagullsoftware.com/schemas/legasuite/panel"
    xmlns:ns="http://www.seagullsoftware.com/schemas/legasuite/panel"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:java="http://xml.apache.org/xslt/java">
<!-- CHANGE SEQUENCE (Page)                               -->
<!-- Search criteria:                                     -->
<!--   Find property Page type with value "Popup/dialog". -->
<!--   Find property Height with value "625".             -->
<!-- Actions:                                             -->
<!--   Set property Height to 625.                        -->
<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" standalone="yes" />
<xsl:template match="ns:panel/ns:properties">
  <xsl:choose>
      <xsl:when test="(./ns:panel_type/text()[normalize-space() = normalize-space('1')]) and ((./ns:dimensions/@cy) &gt; '625')">
        <xsl:copy>
           <xsl:apply-templates select="*[not(self::ns:dimensions)]"/>
           <dimensions>
             <xsl:attribute name="x"><xsl:value-of select="./ns:dimensions/@x"/></xsl:attribute>
             <xsl:attribute name="y"><xsl:value-of select="./ns:dimensions/@y"/></xsl:attribute>
             <xsl:attribute name="cx"><xsl:value-of select="./ns:dimensions/@cx"/></xsl:attribute>
             <xsl:attribute name="cy">625</xsl:attribute>

</dimensions>
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
