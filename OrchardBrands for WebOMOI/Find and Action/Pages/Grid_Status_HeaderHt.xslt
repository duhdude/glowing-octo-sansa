<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" exclude-result-prefixes="java ns"     xmlns="http://www.seagullsoftware.com/schemas/legasuite/panel"
    xmlns:ns="http://www.seagullsoftware.com/schemas/legasuite/panel"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:java="http://xml.apache.org/xslt/java">
<!-- CHANGE SEQUENCE (Grid)                        -->
<!-- Search criteria:                              -->
<!--   Find property Field ID with value "(LIST)". -->
<!-- Actions:                                      -->
<!--   Set property Status bar to Disabled.        -->
<!--   Set property Header height to 22.           -->
<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" standalone="yes" />
<xsl:template match="ns:ajax_grid">
  <xsl:choose>
      <xsl:when test="(./ns:id/text()[normalize-space() = normalize-space('(LIST)')])">
        <xsl:copy>
           <xsl:apply-templates select="*[not(self::ns:ajax_grid_flags) and not(self::ns:header_height)]"/>
           <header_height>22</header_height>
           <ajax_grid_flags>
               <xsl:copy-of select="./ns:ajax_grid_flags/*[name()!='ajax_statusbar_hide']"/>
              <ajax_statusbar_hide/>
           </ajax_grid_flags>
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
