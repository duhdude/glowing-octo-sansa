﻿<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" exclude-result-prefixes="java ns"     xmlns="http://www.seagullsoftware.com/schemas/legasuite/panel"
    xmlns:ns="http://www.seagullsoftware.com/schemas/legasuite/panel"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:java="http://xml.apache.org/xslt/java">
<!-- CHANGE SEQUENCE (Grid column)       -->
<!-- Actions:                            -->
<!--   Set property Sorting to Disabled. -->
<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" standalone="yes" />
<xsl:template match="ns:ajax_grid_column">
        <xsl:copy>
           <xsl:apply-templates select="*[not(self::ns:ajax_grid_column_flags)]"/>
           <ajax_grid_column_flags>
               <xsl:copy-of select="./ns:ajax_grid_column_flags/*[name()!='no_sorting']"/>
              <no_sorting/>
           </ajax_grid_column_flags>
        </xsl:copy>
</xsl:template>

<!-- Copy an ordinary node or attribute-->
<xsl:template match="@*|node()">
  <xsl:copy>
     <xsl:apply-templates select="@*|node()"/>
  </xsl:copy>
</xsl:template>
</xsl:stylesheet>
