<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:p="http://www.seagullsoftware.com/schemas/legasuite/panel"
	xmlns:s="http://www.seagullsoftware.com/schemas/legasuite/screen"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:exsl="http://exslt.org/common"
	exclude-result-prefixes="p s xsl exsl">

	<xsl:output omit-xml-declaration="yes" encoding="UTF-8"
		version="1.0" indent="yes" method="xml" standalone="yes" />

	<xsl:variable name="column-size-multiplicator" select="9" />
	<xsl:variable name="screens-dir"
		select="'C:/Seagull Projects/workspace_OrchardBrands/git/ob-projects/OrchardBrands for WebOMOI/Screens/'" />

	<xsl:variable name="screen"
		select="//p:panel/p:properties/p:screen_name/text()" />

	<xsl:template match="p:ajax_grid">
		<xsl:copy>
			<xsl:apply-templates select="*[not (self::p:dimensions)]" />
			<dimensions>
				<xsl:attribute name="x">
					<xsl:value-of select="./p:dimensions/@x" />
				</xsl:attribute>
				<xsl:attribute name="y">
					<xsl:value-of select="./p:dimensions/@y" />
				</xsl:attribute>
				<xsl:attribute name="cx">
					<xsl:call-template name="calculate-grid-width">
						<xsl:with-param name="columns" select="./p:ajax_grid_column" />
					</xsl:call-template>
				</xsl:attribute>
				<xsl:attribute name="cy">
					<xsl:value-of select="./p:dimensions/@cy" />
				</xsl:attribute>
			</dimensions>
		</xsl:copy>
	</xsl:template>

	<xsl:template match="p:ajax_grid_column">
		<xsl:copy>
			<xsl:variable name="host_field" select="./p:host_field/text()" />
			<xsl:apply-templates select="*[not (self::p:column_width_chars)]" />
			<column_width_chars>
				<xsl:choose>
					<xsl:when
						test="$screen and string-length($screen) &gt; 0
							and string-length($host_field) &gt; 0">
						<xsl:value-of
							select="number(document(concat($screens-dir, $screen, '.screen'))
								//s:HostField[./s:FieldId/text()=$host_field]
								/s:HostSize
								/s:cx
								/text()) * $column-size-multiplicator" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="./p:column_width_chars/text()" />
					</xsl:otherwise>
				</xsl:choose>
			</column_width_chars>
		</xsl:copy>
	</xsl:template>

	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()" />
		</xsl:copy>
	</xsl:template>

	<xsl:template name="calculate-grid-width">
		<xsl:param name="columns" />
		<xsl:param name="index" select="1" />
		<xsl:param name="width" select="0" />
		<xsl:choose>
			<xsl:when test="$columns[$index]">
				<xsl:variable name="column_host_field"
					select="$columns[$index]/p:host_field/text()" />
				<xsl:call-template name="calculate-grid-width">
					<xsl:with-param name="columns" select="$columns" />
					<xsl:with-param name="index" select="$index + 1" />
					<xsl:with-param name="width">
						<xsl:choose>
							<xsl:when
								test="$screen and string-length($screen) &gt; 0
									and string-length($column_host_field) &gt; 0">
								<xsl:value-of
									select="$width + (number(document(concat($screens-dir, $screen, '.screen'))
										//s:HostField[./s:FieldId/text()=$column_host_field]
										/s:HostSize
										/s:cx
										/text()) * $column-size-multiplicator)" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of
									select="$width + number($columns[$index]/p:column_width_chars/text())" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:with-param>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$width + $index - 1" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

</xsl:stylesheet>