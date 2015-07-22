<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" exclude-result-prefixes="java ns"     xmlns="http://www.seagullsoftware.com/schemas/legasuite/panel"
    xmlns:ns="http://www.seagullsoftware.com/schemas/legasuite/panel"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:java="http://xml.apache.org/xslt/java">

<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" standalone="yes" />
<xsl:template match="ns:ajax_button">
  <xsl:choose>
      <xsl:when test="(./ns:image_file/text()[normalize-space() = normalize-space('Resources\bttn_arrowRight_on.png')])">
        <xsl:copy>
           <xsl:apply-templates select="*[not(self::ns:image_file) and not(self::ns:dimensions) and not(self::ns:ajax_center) and not(self::ns:ajax_show) and not(self::ns:ajax_decorator_name) and not(self::ns:FontColor)]"/>
           <image_file></image_file>
           <title>OK</title>
           <FontColor>
                  <!-- xsl:apply-templates select="./ns:FontColor/ns:FontStyleName"/-->
                  <!-- xsl:apply-templates select="./ns:FontColor/ns:FontDefinition"/-->
                  <!-- ColorBackground>0</ColorBackground-->
                  <!-- xsl:apply-templates select="./ns:FontColor/ns:ColorForeground"/-->
                  <FontStyleName>Push Button</FontStyleName>
                  <ColorBackground>92</ColorBackground>
                  <ColorForeground>66</ColorForeground>     
           </FontColor>
           <image_file></image_file>
           <ajax_show>1</ajax_show>
           <ajax_decorator_name></ajax_decorator_name>
           <ajax_center>1</ajax_center>
           <dimensions>
             <xsl:attribute name="x"><xsl:value-of select="./ns:dimensions/@x - 7"/></xsl:attribute>
             <xsl:attribute name="y"><xsl:value-of select="./ns:dimensions/@y + 15"/></xsl:attribute>
             <xsl:attribute name="cx">63</xsl:attribute>
             <xsl:attribute name="cy">27</xsl:attribute>
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
