<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" exclude-result-prefixes="java ns"     xmlns="http://www.seagullsoftware.com/schemas/legasuite/panel"
    xmlns:ns="http://www.seagullsoftware.com/schemas/legasuite/panel"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:java="http://xml.apache.org/xslt/java">
<!-- CHANGE SEQUENCE (Toolbar)                       -->
<!-- Search criteria:                                -->
<!--   Find property Field ID with value "TOOLBAR1". -->
<!-- Actions:                                        -->
<!--   Set property Max height to 24.                -->
<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" standalone="yes" />
<xsl:template match="ns:ajax_tool_bar">
  <xsl:choose>
      <xsl:when test="(./ns:id/text()[normalize-space() = normalize-space('TOOLBAR1')])">
        <xsl:copy>
           <xsl:apply-templates select="*[not(self::ns:ajax_max_height)]"/>
           <ajax_max_height>24</ajax_max_height>
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
