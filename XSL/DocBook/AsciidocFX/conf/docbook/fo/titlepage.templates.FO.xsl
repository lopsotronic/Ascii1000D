<xsl:template name="book.titlepage.recto">
  <fo:block>
    <fo:table inline-progression-dimension="100%" table-layout="fixed">
      <fo:table-column column-width="50%"/>
      <fo:table-column column-width="50%"/>
      <fo:table-body>
        <fo:table-row >
          <fo:table-cell number-columns-spanned="2">
            <fo:block text-align="center">
              <xsl:choose>
                <xsl:when test="bookinfo/title">
                  <xsl:apply-templates 
                         mode="book.titlepage.recto.auto.mode" 
                         select="bookinfo/title"/>
                </xsl:when>
                <xsl:when test="title">
                  <xsl:apply-templates 
                         mode="book.titlepage.recto.auto.mode" 
                         select="title"/>
                </xsl:when>
              </xsl:choose>
            </fo:block>
          </fo:table-cell>
        </fo:table-row>
        <fo:table-row>
          <fo:table-cell>
            <fo:block>
              <xsl:apply-templates 
                     mode="book.titlepage.recto.mode" 
                     select="bookinfo/corpauthor"/>
            </fo:block>
          </fo:table-cell>
          <fo:table-cell>
            <fo:block>
              <xsl:apply-templates 
                     mode="book.titlepage.recto.mode" 
                     select="bookinfo/edition"/>
            </fo:block>
          </fo:table-cell> 
        </fo:table-row >  
      </fo:table-body> 
    </fo:table>
  </fo:block>
</xsl:template>