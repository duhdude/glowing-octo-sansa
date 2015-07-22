<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" exclude-result-prefixes="java ns"     xmlns="http://www.seagullsoftware.com/schemas/legasuite/panel"
    xmlns:ns="http://www.seagullsoftware.com/schemas/legasuite/panel"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:java="http://xml.apache.org/xslt/java">
<!-- CHANGE SEQUENCE (Image)                                -->
<!-- Search criteria:                                       -->
<!--   Find property Source with value "Resources\up2.png". -->
<!-- Actions:                                               -->
<!--   Set property Width to 38.                            -->
<!--   Set property Source to Resources\up4.png.            -->
<!--   Set property Height to 38.                           -->
<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" standalone="yes" />
<xsl:template match="ns:ajax_image">
  <xsl:choose>
      <xsl:when test="(./ns:image_file/text()[normalize-space() = normalize-space('Resources\up2.png')])">
        <xsl:copy>
           <xsl:apply-templates select="*[not(self::ns:dimensions) and not(self::ns:image_file)]"/>
           <image_file>Resources\up4.png</image_file>
           <dimensions>
             <xsl:attribute name="x"><xsl:value-of select="./ns:dimensions/@x"/></xsl:attribute>
             <xsl:attribute name="y"><xsl:value-of select="./ns:dimensions/@y"/></xsl:attribute>
             <xsl:attribute name="cx">38</xsl:attribute>
             <xsl:attribute name="cy">38</xsl:attribute>

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
