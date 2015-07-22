<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" exclude-result-prefixes="java ns"     xmlns="http://www.seagullsoftware.com/schemas/legasuite/panel"
    xmlns:ns="http://www.seagullsoftware.com/schemas/legasuite/panel"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:java="http://xml.apache.org/xslt/java">
<!-- CHANGE SEQUENCE (Label)                                     -->
<!-- Search criteria:                                            -->
<!--   Find property Text color with value "Output Foreground1". -->
<!-- Actions:                                                    -->
<!--   Set property Right-mouse enabled to Enabled.              -->
<!--   Set property Selectable to Yes.                           -->
<!--   Set property Right mouse menu to Standard.                -->
<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" standalone="yes" />
<xsl:template match="ns:ajax_label">
  <xsl:choose>
      <xsl:when test="(./ns:FontColor/ns:ColorForeground/text()[normalize-space() = normalize-space('63')])">
        <xsl:copy>
           <xsl:apply-templates select="*[not(self::ns:ajax_opts_common)]"/>
           <ajax_opts_common>
               <xsl:copy-of select="./ns:ajax_opts_common/*[name()!='ajax_inherit_context_menu' and name()!='ajax_native_context_menu' and name()!='ajax_selectable' and name()!='ajax_enable_right_mouse_menu']"/>
              <ajax_enable_right_mouse_menu/>
              <ajax_selectable/>
              <ajax_native_context_menu/>
           </ajax_opts_common>
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
