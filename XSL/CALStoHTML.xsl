<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version='1.0' >
	<xsl:template match="table">
		<table align="center" width="90%" border="1pt solid black">
			<xsl:apply-templates/>
		</table>
	</xsl:template>
	<xsl:template match="tbody">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="row">
		<TR>
			<xsl:apply-templates/>
		</TR>
	</xsl:template>
	<xsl:template match="entry">
		<TD>
			<xsl:apply-templates/>
		</TD>
	</xsl:template>
	<xsl:template match="thead/row/entry/text/para">
		<br/>
		<th align="center" valign="top" rowspan="0.5" colspan="1" nowrap="nowrap">
			<P>
				<xsl:apply-templates/>
			</P>
		</th>
	</xsl:template>
	<xsl:template match="row">
		<TR align="left" valign="top">
			<P>
				<xsl:apply-templates/>
			</P>
		</TR>
	</xsl:template>
	<xsl:template match="thead">
		<xsl:element name="{name(.)}">
			<xsl:if test="@align">
				<xsl:attribute name="align">
					<xsl:value-of select="@align"/>
				</xsl:attribute>
			</xsl:if>
			<xsl:if test="@char">
				<xsl:attribute name="char">
					<xsl:value-of select="@char"/>
				</xsl:attribute>
			</xsl:if>
			<xsl:if test="@charoff">
				<xsl:attribute name="charoff">
					<xsl:value-of select="@charoff"/>
				</xsl:attribute>
			</xsl:if>
			<xsl:if test="@valign">
				<xsl:attribute name="valign">
					<xsl:value-of select="@valign"/>
				</xsl:attribute>
			</xsl:if>
		</xsl:element>
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="tbody">
		<tbody>
			<xsl:if test="@align">
				<xsl:attribute name="align">
					<xsl:value-of select="@align"/>
				</xsl:attribute>
			</xsl:if>
			<xsl:if test="@char">
				<xsl:attribute name="char">
					<xsl:value-of select="@char"/>
				</xsl:attribute>
			</xsl:if>
			<xsl:if test="@charoff">
				<xsl:attribute name="charoff">
					<xsl:value-of select="@charoff"/>
				</xsl:attribute>
			</xsl:if>
			<xsl:if test="@valign">
				<xsl:attribute name="valign">
					<xsl:value-of select="@valign"/>
				</xsl:attribute>
			</xsl:if>
			<xsl:apply-templates/>
		</tbody>
	</xsl:template>
</xsl:stylesheet>