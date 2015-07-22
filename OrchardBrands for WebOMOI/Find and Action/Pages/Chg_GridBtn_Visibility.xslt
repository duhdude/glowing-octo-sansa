<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" exclude-result-prefixes="java ns"     xmlns="http://www.seagullsoftware.com/schemas/legasuite/panel"
    xmlns:ns="http://www.seagullsoftware.com/schemas/legasuite/panel"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:java="http://xml.apache.org/xslt/java">
<!-- CHANGE SEQUENCE (Button)                                    -->
<!-- Search criteria:                                            -->
<!--   Find property Text color with value "Push button - text". -->
<!--   Find property Override host field with value "".          -->
<!--   Find property Font style with value "Push Button3".       -->
<!-- Actions:                                                    -->
<!--   Set property Output data to No action.                    -->
<!--   Set property Check host field condition to Enabled.       -->
<!--   Set property Not present to No action.                    -->
<!--   Set property Entry capable to No action.                  -->
<!--   Set property Output empty to No action.                   -->
<!--   Set property No focus to Disable.                         -->
<!--   Set property Override host field to #1SEL.                -->
<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" standalone="yes" />
<xsl:template match="ns:ajax_button">
  <xsl:choose>
      <xsl:when test="(./ns:FontColor/ns:ColorForeground/text()[normalize-space() = normalize-space('44')]) and (string-length(normalize-space(./ns:enable_field_name/text())) = 0) and (./ns:FontColor/ns:FontStyleName/text()[normalize-space() = normalize-space('Push Button3')])">
        <xsl:copy>
           <xsl:apply-templates select="*[not(self::ns:general_flags_2) and not(self::ns:ajax_opts_common) and not(self::ns:general_flags_3) and not(self::ns:enable_field_name)]"/>
           <ajax_opts_common>
               <xsl:copy-of select="./ns:ajax_opts_common/*[name()!='ajax_visibility_not_present_exclude' and name()!='ajax_visibility_output_data_exclude' and name()!='ajax_enable_host_condition' and name()!='ajax_visibility_output_empty_exclude' and name()!='ajax_exclude_if_focus' and name()!='ajax_visibility_entry_capable_exclude']"/>
              <ajax_enable_host_condition/>
           </ajax_opts_common>
           <general_flags_3>
               <xsl:copy-of select="./ns:general_flags_3/*[name()!='disable_if_focus' and name()!='hide_if_focus']"/>
              <disable_if_focus/>
           </general_flags_3>
           <general_flags_2>
               <xsl:copy-of select="./ns:general_flags_2/*[name()!='visibility_output_empty_hide' and name()!='visibility_entry_capable_disable' and name()!='visibility_output_data_disable' and name()!='visibility_not_present_hide' and name()!='visibility_output_data_hide' and name()!='visibility_output_empty_disable' and name()!='visibility_entry_capable_hide' and name()!='visibility_not_present_disable']"/>
           </general_flags_2>
           <enable_field_name>#1SEL</enable_field_name>
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
