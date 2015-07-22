<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" exclude-result-prefixes="java ns"     xmlns="http://www.seagullsoftware.com/schemas/legasuite/panel"
    xmlns:ns="http://www.seagullsoftware.com/schemas/legasuite/panel"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:java="http://xml.apache.org/xslt/java">
<!-- CHANGE SEQUENCE (Grid)                           -->
<!-- Search criteria:                                 -->
<!--   Find property Status bar with value "Enabled". -->
<!-- Actions:                                         -->
<!--   Set property Status bar to Disabled.           -->
<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" standalone="yes" />
<xsl:template match="ns:ajax_grid">
  <xsl:choose>
      <xsl:when test="(((count(./ns:ajax_grid_flags) = 0) or (count(./ns:ajax_grid_flags/ns:ajax_statusbar_hide)=0)))">
        <xsl:copy>
           <xsl:apply-templates select="*[not(self::ns:ajax_grid_flags)]"/>
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
