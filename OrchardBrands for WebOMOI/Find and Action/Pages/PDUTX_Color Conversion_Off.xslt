<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" exclude-result-prefixes="java ns"     xmlns="http://www.seagullsoftware.com/schemas/legasuite/panel"
    xmlns:ns="http://www.seagullsoftware.com/schemas/legasuite/panel"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:java="http://xml.apache.org/xslt/java">
<!-- CHANGE SEQUENCE (Label)                                -->
<!-- Search criteria:                                       -->
<!--   Find property Field color conversion with value "A". -->
<!--   Find property Label with value "@#PDUTX@".           -->
<!--   Find property Text color with value "Title".         -->
<!--   Find property Background color with value "(None)".  -->
<!-- Actions:                                               -->
<!--   Set property Field color conversion to (None).       -->
<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" standalone="yes" />
<xsl:template match="ns:ajax_label">
  <xsl:choose>
      <xsl:when test="(./ns:color_conversion/text()[normalize-space() = normalize-space('1')]) and (./ns:title/text()[normalize-space() = normalize-space('@#PDUTX@')]) and (./ns:FontColor/ns:ColorForeground/text()[normalize-space() = normalize-space('90')]) and (./ns:FontColor/ns:ColorBackground/text()[normalize-space() = normalize-space('50')])">
        <xsl:copy>
           <xsl:apply-templates select="*[not(self::ns:color_conversion)]"/>
           <color_conversion>0</color_conversion>
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
