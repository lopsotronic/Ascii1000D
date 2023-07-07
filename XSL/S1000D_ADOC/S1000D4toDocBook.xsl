<?xml version="1.0"?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:d="http://docbook.org/ns/docbook"
  xmlns:mml="http://www.w3.org/1998/Math/MathML"
  xmlns:xlink="http://www.w3.org/1999/xlink"
  exclude-result-prefixes="mml xlink"
  version="1.0">

  <!-- Make dmTitle/techName the title and dmTitle/infoName the subtitle,
       instead of using them together in the form of "techName - infoName" -->
  <xsl:param name="info.name.is.subtitle">0</xsl:param>

  <!-- Use docbook task/procedure elements. The alternative representation will
       use orderedlists for steps -->
  <xsl:param name="use.procedure">0</xsl:param>

  <!-- Include individual data module info section.

       Added mainly for pandoc, which seems to use the LAST set of info
       elements for the output documents main info rather than the info
       element on the top-level element. Setting this to 0 will only
       include the info (author, date) from the publication module. -->
  <xsl:param name="include.dmodule.info">1</xsl:param>

  <!-- Control whether each element uses db.titlereq.info (1) or
       db.titleforbidden.info (0) format.

       Added mainly for pandoc which seems to select the LAST title in an info
       element at any level as the title for the output document, rather than
       the top-level one. Setting this to 0 for pmentry and dmodule provides
       a workaround. -->
  <xsl:param name="pm.db.titlereq.info">1</xsl:param>
  <xsl:param name="pmentry.db.titlereq.info">0</xsl:param>
  <xsl:param name="dmodule.db.titlereq.info">0</xsl:param>

  <!-- Create sections for certain elements instead of using bridgehead. -->
  <xsl:param name="extra.sections">1</xsl:param>

  <!-- Map S1000D publication structures to DocBook ones -->
  <xsl:param name="pm.is">d:book</xsl:param>
  <xsl:param name="pmentry.is">d:part</xsl:param>
  <!-- <part> element cannot be nested, so if you have sub-pmEntry elements,
       you'll need to set these parameters differently. -->
  <xsl:param name="sub.pmentry.is"/>
  <xsl:param name="dmodule.is">d:article</xsl:param>

  <!-- Use pmEntry as another subdivision. When set to 0, all data modules are
       displayed on the same level. If there is only one pmEntry this may be
       used to avoid having an extra level. -->
  <xsl:param name="use.pmentry">1</xsl:param>

  <!-- How to generate link text.

       s1000d   Generate S1000D link text (Fig 1, Table 1, Para 1, etc.).

       title    Use the target element's <title> as the link text. If the
                target has no title, S1000D link text is used instead.
  -->
  <xsl:param name="link.text">title</xsl:param>

  <!-- Detect if a referenced data module is included in a publication. If it
       is not, don't present the dmRef as a (broken) link. Slow for large
       publications. -->
  <xsl:param name="smart.dmref">0</xsl:param>

  <!-- Include the References table. -->
  <xsl:param name="include.refs">0</xsl:param>

  <!-- Generate unique (for the whole publication) IDs for elements in data
       modules with IDs. The ID is prefixed by the data module identifier. -->
  <xsl:param name="use.unique.id">1</xsl:param>

  <!-- Display graphics in CALS tables as separate mediaobjects -->
  <xsl:param name="separate.table.graphics">0</xsl:param>

  <!-- Extra metadata -->
  <xsl:param name="include.date">1</xsl:param>
  <xsl:param name="include.publisher">1</xsl:param>
  <xsl:param name="include.author">1</xsl:param>
  <xsl:param name="include.dmc">1</xsl:param>
  <xsl:param name="include.issue.info">1</xsl:param>

  <!-- Spell out acronyms the first time they are used (acronymDefinition) -->
  <xsl:param name="spell.out.acronyms">1</xsl:param>
  <!-- Determines how acronyms are spelled out in the narrative if
       $spell.out.acronyms = 1.

       When $acronym.term.first = 1, the acronym term is followed by the
       definition in parentheses. Example: XML (Extensible Markup Language)

       When $acronym.term.first = 0, the acronym definition is followed by the
       term in parentheses. Example: Extensible Markup Language (XML) -->
  <xsl:param name="acronym.term.first">1</xsl:param>

  <!-- Include @role corresponding to @emphasisType. -->
  <xsl:param name="include.emphasis.role">0</xsl:param>

  <!-- Include the preliminary and close requirements sections. -->
  <xsl:param name="include.rqmts">1</xsl:param>

  <!-- Include requirements tables even if they are empty. -->
  <xsl:param name="include.empty.rqmts">0</xsl:param>

  <!-- Include S1000D default headings as bridgeheads. -->
  <xsl:param name="include.bridgeheads">1</xsl:param>

  <xsl:variable name="all.dmodules" select="//dmodule"/>

  <xsl:output method="xml"/>

  <xsl:template match="acronym">
    <xsl:choose>
      <xsl:when test="$spell.out.acronyms = 0">
        <xsl:apply-templates select="acronymTerm"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:choose>
          <xsl:when test="$acronym.term.first = 0">
            <xsl:apply-templates select="acronymDefinition"/>
            <xsl:text> (</xsl:text>
            <xsl:apply-templates select="acronymTerm"/>
            <xsl:text>)</xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <xsl:apply-templates select="acronymTerm"/>
            <xsl:text> (</xsl:text>
            <xsl:apply-templates select="acronymDefinition"/>
            <xsl:text>)</xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="acronymTerm">
    <acronym>
      <xsl:apply-templates/>
    </acronym>
  </xsl:template>

  <xsl:template match="acronymDefinition">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="commonInfo">
    <xsl:choose>
      <xsl:when test="$extra.sections = 0">
        <xsl:if test="$include.bridgeheads != 0">
          <d:bridgehead>Common information</d:bridgehead>
        </xsl:if>
        <d:tasksummary>
          <xsl:apply-templates/>
        </d:tasksummary>
      </xsl:when>
      <xsl:otherwise>
        <d:section>
          <d:title>Common information</d:title>
          <d:tasksummary>
            <xsl:apply-templates/>
          </d:tasksummary>
        </d:section>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="commonInfoDescrPara">
    <d:formalpara>
      <xsl:apply-templates/>
    </d:formalpara>
  </xsl:template>

  <xsl:template match="dmodule">
    <xsl:element name="{$dmodule.is}">
      <xsl:call-template name="force.unique.id.attr"/>
      <xsl:apply-templates select="*"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dmodule/content">
    <xsl:if test="$include.refs != 0">
      <xsl:call-template name="refs">
        <xsl:with-param name="refs" select="refs"/>
      </xsl:call-template>
    </xsl:if>
    <xsl:apply-templates select="*"/>
  </xsl:template>

  <xsl:template match="dmIdent|dmRefIdent">
    <xsl:if test="identExtension">
      <xsl:apply-templates select="identExtension"/>
      <xsl:text>-</xsl:text>
    </xsl:if>
    <xsl:apply-templates select="dmCode"/>
  </xsl:template>

  <xsl:template match="identExtension">
    <xsl:value-of select="@extensionProducer"/>
    <xsl:text>-</xsl:text>
    <xsl:value-of select="@extensionCode"/>
  </xsl:template>

  <xsl:template match="dmCode">
    <xsl:value-of select="@modelIdentCode"/>
    <xsl:text>-</xsl:text>
    <xsl:value-of select="@systemDiffCode"/>
    <xsl:text>-</xsl:text>
    <xsl:value-of select="@systemCode"/>
    <xsl:text>-</xsl:text>
    <xsl:value-of select="@subSystemCode"/>
    <xsl:value-of select="@subSubSystemCode"/>
    <xsl:text>-</xsl:text>
    <xsl:value-of select="@assyCode"/>
    <xsl:text>-</xsl:text>
    <xsl:value-of select="@disassyCode"/>
    <xsl:value-of select="@disassyCodeVariant"/>
    <xsl:text>-</xsl:text>
    <xsl:value-of select="@infoCode"/>
    <xsl:value-of select="@infoCodeVariant"/>
    <xsl:text>-</xsl:text>
    <xsl:value-of select="@itemLocationCode"/>
  </xsl:template>

  <xsl:template match="issueInfo">
    <xsl:value-of select="@issueNumber"/>
    <xsl:text>-</xsl:text>
    <xsl:value-of select="@inWork"/>
  </xsl:template>

  <xsl:template match="language">
    <xsl:value-of select="@languageIsoCode"/>
    <xsl:text>-</xsl:text>
    <xsl:value-of select="@countryIsoCode"/>
  </xsl:template>

  <xsl:template name="get.dmodule.id">
    <xsl:param name="dm.ref.code"/>
    <xsl:choose>
      <xsl:when test="$smart.dmref = 0">
        <xsl:text>ID_</xsl:text>
        <xsl:value-of select="$dm.ref.code"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:for-each select="$all.dmodules">
          <xsl:variable name="dm.code">
            <xsl:call-template name="get.dmcode"/>
          </xsl:variable>
          <xsl:if test="$dm.ref.code = $dm.code">
            <xsl:call-template name="unique.id"/>
          </xsl:if>
        </xsl:for-each>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="dmRef">
    <xsl:param name="dmref.link.text" select="$link.text"/>
    <xsl:variable name="dm.ref.code">
      <xsl:apply-templates select="dmRefIdent/dmCode"/>
    </xsl:variable>
    <xsl:variable name="id">
      <xsl:call-template name="get.dmodule.id">
        <xsl:with-param name="dm.ref.code" select="$dm.ref.code"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="$id">
        <d:link linkend="{$id}">
          <xsl:choose>
            <xsl:when test="$dmref.link.text = 'title' and dmRefAddressItems/dmTitle">
              <xsl:apply-templates select="dmRefAddressItems/dmTitle"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:apply-templates select="dmRefIdent"/>
            </xsl:otherwise>
          </xsl:choose>
        </d:link>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates select="dmRefIdent"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="dmRefIdent">
    <xsl:apply-templates select="dmCode"/>
  </xsl:template>

  <xsl:template match="dmTitle">
    <xsl:apply-templates select="techName"/>
    <xsl:if test="infoName">
      <xsl:text> - </xsl:text>
      <xsl:apply-templates select="infoName"/>
    </xsl:if>
  </xsl:template>

  <xsl:template match="emphasis">
    <d:emphasis>
      <xsl:if test="$include.emphasis.role != 0">
        <xsl:attribute name="role">
          <xsl:choose>
            <xsl:when test="@emphasisType = 'em02'">italic</xsl:when>
            <xsl:when test="@emphasisType = 'em03'">underline</xsl:when>
            <xsl:when test="@emphasisType = 'em04'">overline</xsl:when>
            <xsl:when test="@emphasisType = 'em05'">strikethrough</xsl:when>
            <xsl:otherwise>bold</xsl:otherwise>
          </xsl:choose>
        </xsl:attribute>
      </xsl:if>
      <xsl:apply-templates/>
    </d:emphasis>
  </xsl:template>

  <xsl:template match="externalPubRef">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="externalPubRef[@xlink:href]">
    <d:link>
      <xsl:copy-of select="@xlink:href"/>
      <xsl:apply-templates/>
    </d:link>
  </xsl:template>

  <xsl:template match="externalPubRefIdent">
    <xsl:choose>
      <xsl:when test="externalPubTitle">
        <xsl:apply-templates select="externalPubTitle"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates select="externalPubCode"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="externalPubCode">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="externalPubTitle">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="figure">
    <d:figure>
      <xsl:call-template name="unique.id.attr"/>
      <xsl:apply-templates/>
    </d:figure>
  </xsl:template>

  <xsl:template name="image.object">
    <d:imageobject>
      <d:imagedata fileref="{unparsed-entity-uri(@infoEntityIdent)}">
        <xsl:if test="@reproductionWidth">
          <xsl:attribute name="width">
            <xsl:value-of select="@reproductionWidth"/>
          </xsl:attribute>
        </xsl:if>
        <xsl:if test="@reproductionScale">
          <xsl:attribute name="scale">
            <xsl:value-of select="@reproductionScale"/>
          </xsl:attribute>
        </xsl:if>
      </d:imagedata>
    </d:imageobject>
  </xsl:template>

  <xsl:template match="graphic">
    <d:mediaobject>
      <xsl:call-template name="image.object"/>
    </d:mediaobject>
  </xsl:template>

  <xsl:template match="symbol">
    <d:inlinemediaobject>
      <xsl:call-template name="image.object"/>
    </d:inlinemediaobject>
  </xsl:template>

  <xsl:template match="figureAlts">
    <xsl:apply-templates select="figure"/>
  </xsl:template>

  <xsl:template match="footnote">
    <d:footnote>
      <xsl:apply-templates select="*"/>
    </d:footnote>
  </xsl:template>

  <xsl:template name="unique.id">
    <xsl:param name="id" select="@id"/>
    <xsl:choose>
      <xsl:when test="$use.unique.id = 0">
        <xsl:value-of select="$id"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>ID_</xsl:text>
        <xsl:apply-templates select="ancestor-or-self::dmodule/identAndStatusSection/dmAddress/dmIdent"/>
        <xsl:if test="$id">
          <xsl:text>_</xsl:text>
          <xsl:value-of select="$id"/>
        </xsl:if>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="unique.id.attr">
    <xsl:if test="@id">
      <xsl:attribute name="xml:id">
        <xsl:call-template name="unique.id"/>
      </xsl:attribute>
    </xsl:if>
  </xsl:template>

  <xsl:template name="force.unique.id.attr">
    <xsl:attribute name="xml:id">
      <xsl:call-template name="unique.id"/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="identAndStatusSection">
    <xsl:if test="$include.dmodule.info = 0 or $dmodule.db.titlereq.info = 0">
      <xsl:apply-templates select="dmAddress/dmAddressItems/dmTitle" mode="idstatus"/>
    </xsl:if>
    <xsl:if test="$include.dmodule.info != 0">
      <d:info>
        <xsl:apply-templates select="dmAddress/dmIdent" mode="idstatus"/>
        <xsl:if test="$dmodule.db.titlereq.info != 0">
          <xsl:apply-templates select="dmAddress/dmAddressItems/dmTitle" mode="idstatus"/>
        </xsl:if>
        <xsl:if test="$include.date != 0">
          <xsl:apply-templates select="dmAddress/dmAddressItems/issueDate" mode="idstatus"/>
        </xsl:if>
        <xsl:apply-templates select="dmStatus" mode="idstatus"/>
      </d:info>
    </xsl:if>
  </xsl:template>

  <xsl:template match="*" mode="idstatus">
    <xsl:apply-templates select="*" mode="idstatus"/>
  </xsl:template>

  <xsl:template match="dmTitle" mode="idstatus">
    <xsl:choose>
      <xsl:when test="$info.name.is.subtitle = 0">
        <d:title>
          <xsl:apply-templates select="."/>
        </d:title>
      </xsl:when>
      <xsl:otherwise>
        <d:title>
          <xsl:apply-templates select="techName"/>
        </d:title>
        <d:subtitle>
          <xsl:apply-templates select="infoName"/>
        </d:subtitle>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="issueDate" mode="idstatus">
    <d:date>
      <xsl:apply-templates select="."/>
    </d:date>
  </xsl:template>

<!--   <xsl:template match="originator" mode="idstatus">
    <d:author>
      <xsl:apply-templates select="."/>
    </d:author>
  </xsl:template> -->

  <xsl:template match="responsiblePartnerCompany" mode="idstatus">
    <xsl:if test="$include.publisher != 0">
      <d:publisher>
        <xsl:apply-templates select="*" mode="idstatus"/>
      </d:publisher>
    </xsl:if>
  </xsl:template>

  <xsl:template match="responsiblePartnerCompany/enterpriseName" mode="idstatus">
    <d:publishername>
      <xsl:apply-templates select="."/>
    </d:publishername>
  </xsl:template>

<!--   <xsl:template match="originator" mode="idstatus">
    <xsl:if test="$include.author != 0">
      <d:author>
        <xsl:apply-templates select="*" mode="idstatus"/>
      </d:author>
    </xsl:if>
  </xsl:template> -->

  <xsl:template match="originator/enterpriseName" mode="idstatus">
    <d:orgname>
      <xsl:apply-templates select="."/>
    </d:orgname>
  </xsl:template>

  <xsl:template match="brexDmRef" mode="idstatus"/>

  <xsl:template match="dmIdent" mode="idstatus">
    <xsl:if test="$include.dmc != 0">
      <xsl:apply-templates select="dmCode" mode="idstatus"/>
    </xsl:if>
    <xsl:if test="$include.issue.info != 0">
      <xsl:apply-templates select="issueInfo" mode="idstatus"/>
    </xsl:if>
  </xsl:template>

  <xsl:template match="dmCode" mode="idstatus">
    <d:biblioid class="other" otherclass="S1000D">
      <xsl:apply-templates select="."/>
    </d:biblioid>
  </xsl:template>

  <xsl:template match="issueInfo" mode="idstatus">
    <d:issuenum>
      <xsl:apply-templates select="."/>
    </d:issuenum>
  </xsl:template>

  <xsl:template match="applic" mode="idstatus"/>

  <xsl:template match="internalRef">
    <xsl:variable name="target.id" select="@internalRefId"/>
    <xsl:variable name="target" select="ancestor::dmodule//*[@id = $target.id]"/>
    <xsl:variable name="target.type" select="@internalRefTargetType"/>
    <xsl:variable name="target.uid">
      <xsl:call-template name="unique.id">
        <xsl:with-param name="id" select="$target.id"/>
      </xsl:call-template>
    </xsl:variable>
    <d:link>
      <xsl:attribute name="linkend">
        <xsl:value-of select="$target.uid"/>
      </xsl:attribute>
      <xsl:choose>
        <xsl:when test="$link.text = 'title' and $target/title">
          <xsl:apply-templates select="$target/title/node()"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates select="$target" mode="internal-ref"/>
        </xsl:otherwise>
      </xsl:choose>
    </d:link>
  </xsl:template>

  <xsl:template match="table" mode="prefix">
    <xsl:text>Table</xsl:text>
  </xsl:template>

  <xsl:template match="table" mode="number">
    <xsl:number level="any" from="dmodule"/>
  </xsl:template>

  <xsl:template match="figure|figureAlts" mode="prefix">
    <xsl:text>Fig</xsl:text>
  </xsl:template>

  <xsl:template match="figure|figureAlts" mode="number">
    <xsl:number count="figure|figureAlts" level="any" from="dmodule"/>
  </xsl:template>

  <xsl:template match="proceduralStep|crewDrillStep" mode="prefix">
    <xsl:text>Step</xsl:text>
  </xsl:template>

  <xsl:template match="proceduralStep|crewDrillStep" mode="number">
    <xsl:number level="multiple" from="dmodule"/>
  </xsl:template>

  <xsl:template match="levelledPara" mode="prefix">
    <xsl:text>Para</xsl:text>
  </xsl:template>

  <xsl:template match="levelledPara" mode="number">
    <xsl:number level="multiple" from="dmodule"/>
  </xsl:template>

  <xsl:template match="*" mode="internal-ref">
    <xsl:apply-templates select="." mode="prefix"/>
    <xsl:text> </xsl:text>
    <xsl:apply-templates select="." mode="number"/>
  </xsl:template>

  <xsl:template match="supportEquipDescr|supplyDescr|spareDescr" mode="internal-ref">
    <xsl:apply-templates select="(shortName|name)[1]"/>
  </xsl:template>

  <xsl:template match="issueDate">
    <xsl:value-of select="@year"/>
    <xsl:text>-</xsl:text>
    <xsl:value-of select="@month"/>
    <xsl:text>-</xsl:text>
    <xsl:value-of select="@day"/>
  </xsl:template>

  <xsl:template match="levelledPara">
    <d:section>
      <xsl:call-template name="unique.id.attr"/>
      <xsl:apply-templates/>
    </d:section>
  </xsl:template>

  <xsl:template match="randomList">
    <d:itemizedlist>
      <xsl:apply-templates/>
    </d:itemizedlist>
  </xsl:template>

  <xsl:template match="sequentialList">
    <d:orderedlist>
      <xsl:apply-templates/>
    </d:orderedlist>
  </xsl:template>

  <xsl:template match="listItem">
    <d:listitem>
      <xsl:call-template name="unique.id.attr"/>
      <xsl:apply-templates/>
    </d:listitem>
  </xsl:template>

  <xsl:template match="definitionList">
    <d:variablelist>
      <xsl:apply-templates/>
    </d:variablelist>
  </xsl:template>

  <xsl:template match="definitionListItem">
    <d:varlistentry>
      <xsl:apply-templates/>
    </d:varlistentry>
  </xsl:template>

  <xsl:template match="listItemTerm">
    <d:term>
      <xsl:apply-templates/>
    </d:term>
  </xsl:template>

  <xsl:template match="listItemDefinition">
    <d:listitem>
      <xsl:apply-templates/>
    </d:listitem>
  </xsl:template>

  <xsl:template match="mml:*">
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="note">
    <d:note>
      <xsl:apply-templates/>
    </d:note>
  </xsl:template>

  <xsl:template match="notePara">
    <d:para>
      <xsl:apply-templates/>
    </d:para>
  </xsl:template>

  <xsl:template match="para">
    <d:para>
      <xsl:apply-templates/>
    </d:para>
  </xsl:template>

  <xsl:template match="procedure">
    <d:task>
      <xsl:apply-templates select="commonInfo"/>
      <xsl:if test="$include.rqmts != 0">
        <xsl:apply-templates select="preliminaryRqmts"/>
      </xsl:if>
      <xsl:apply-templates select="mainProcedure"/>
      <xsl:if test="$include.rqmts != 0">
        <xsl:apply-templates select="closeRqmts"/>
      </xsl:if>
    </d:task>
  </xsl:template>

  <xsl:template match="preliminaryRqmts">
    <xsl:choose>
      <xsl:when test="$extra.sections = 0">
        <xsl:if test="$include.bridgeheads != 0">
          <d:bridgehead>Preliminary requirements</d:bridgehead>
        </xsl:if>
        <d:taskprerequisites>
          <xsl:apply-templates/>
        </d:taskprerequisites>
      </xsl:when>
      <xsl:otherwise>
        <d:section>
          <d:title>Preliminary requirements</d:title>
          <d:taskprerequisites>
            <xsl:apply-templates/>
          </d:taskprerequisites>
        </d:section>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="reqCondGroup">
    <xsl:if test="$include.empty.rqmts = 1 or not(noConds)">
      <d:table>
        <d:title>Required conditions</d:title>
        <d:tgroup cols="2">
          <d:thead>
            <d:row>
              <d:entry>
                <d:para>Action/Condition</d:para>
              </d:entry>
              <d:entry>
                <d:para>Data module/Technical publication</d:para>
              </d:entry>
            </d:row>
          </d:thead>
          <d:tbody>
            <xsl:apply-templates/>
          </d:tbody>
        </d:tgroup>
      </d:table>
    </xsl:if>
  </xsl:template>

  <xsl:template match="noConds">
    <d:row>
      <d:entry>
        <d:para>None</d:para>
      </d:entry>
      <d:entry>
        <d:para/>
      </d:entry>
    </d:row>
  </xsl:template>

  <xsl:template match="reqCondNoRef">
    <d:row>
      <d:entry>
        <xsl:apply-templates/>
      </d:entry>
      <d:entry>
        <d:para/>
      </d:entry>
    </d:row>
  </xsl:template>

  <xsl:template match="reqCond">
    <d:para>
      <xsl:apply-templates/>
    </d:para>
  </xsl:template>

  <xsl:template match="reqCondDm">
    <d:row>
      <d:entry>
        <xsl:apply-templates select="reqCond"/>
      </d:entry>
      <d:entry>
        <d:para>
          <xsl:apply-templates select="dmRef"/>
        </d:para>
      </d:entry>
    </d:row>
  </xsl:template>

  <xsl:template match="reqSupportEquips|reqSupplies|reqSpares">
    <xsl:if test="$include.empty.rqmts != 0 or not(noSupportEquips|noSupplies|noSpares)">
      <xsl:variable name="title">
        <xsl:choose>
          <xsl:when test="self::reqSupportEquips">Support equipment</xsl:when>
          <xsl:when test="self::reqSupplies">Consumables, materials, and expendables</xsl:when>
          <xsl:when test="self::reqSpares">Spares</xsl:when>
        </xsl:choose>
      </xsl:variable>
      <xsl:if test="$include.bridgeheads != 0">
        <d:bridgehead>
          <xsl:value-of select="$title"/>
        </d:bridgehead>
      </xsl:if>
      <d:table>
        <d:title>
          <xsl:value-of select="$title"/>
        </d:title>
        <d:tgroup cols="5">
          <d:thead>
            <d:row>
              <d:entry>
                <d:para>Name/Alternate name</d:para>
              </d:entry>
              <d:entry>
                <d:para>Part number</d:para>
              </d:entry>
              <d:entry>
                <d:para>MFC</d:para>
              </d:entry>
              <d:entry>
                <d:para>Quantity</d:para>
              </d:entry>
              <d:entry>
                <d:para>Remark</d:para>
              </d:entry>
            </d:row>
          </d:thead>
          <d:tbody>
            <xsl:apply-templates/>
          </d:tbody>
        </d:tgroup>
      </d:table>
    </xsl:if>
  </xsl:template>

  <xsl:template match="noSupportEquips|noSupplies|noSpares">
    <d:row>
      <d:entry>
        <d:para>None</d:para>
      </d:entry>
      <d:entry>
        <d:para/>
      </d:entry>
      <d:entry>
        <d:para/>
      </d:entry>
      <d:entry>
        <d:para/>
      </d:entry>
    </d:row>
  </xsl:template>

  <xsl:template match="supportEquipDescr">
    <d:row>
      <d:entry>
        <d:para>
          <xsl:call-template name="unique.id.attr"/>
          <xsl:choose>
            <xsl:when test="name">
              <xsl:apply-templates select="name"/>
            </xsl:when>
            <xsl:when test="shortName">
              <xsl:apply-templates select="shortName"/>
            </xsl:when>
          </xsl:choose>
        </d:para>
      </d:entry>
      <d:entry>
        <d:para>
          <xsl:apply-templates select="identNumber/partAndSerialNumber/partNumber"/>
        </d:para>
      </d:entry>
      <d:entry>
        <d:para>
          <xsl:apply-templates select="identNumber/manufacturerCode"/>
        </d:para>
      </d:entry>
      <d:entry>
        <d:para>
          <xsl:apply-templates select="reqQuantity"/>
        </d:para>
      </d:entry>
      <d:entry>
        <d:para>
          <xsl:apply-templates select="remark"/>
        </d:para>
      </d:entry>
    </d:row>
  </xsl:template>

  <xsl:template match="supplyDescr">
    <d:row>
      <d:entry>
        <d:para>
          <xsl:call-template name="unique.id.attr"/>
          <xsl:choose>
            <xsl:when test="name">
              <xsl:apply-templates select="name"/>
            </xsl:when>
            <xsl:when test="shortName">
              <xsl:apply-templates select="shortName"/>
            </xsl:when>
          </xsl:choose>
        </d:para>
      </d:entry>
      <d:entry>
        <d:para>
          <xsl:apply-templates select="identNumber/partNumber"/>
        </d:para>
      </d:entry>
      <d:entry>
        <d:para>
          <xsl:apply-templates select="identNumber/manufacturerCode"/>
        </d:para>
      </d:entry>
      <d:entry>
        <d:para>
          <xsl:apply-templates select="reqQuantity"/>
        </d:para>
      </d:entry>
      <d:entry>
        <d:para>
          <xsl:apply-templates select="remark"/>
        </d:para>
      </d:entry>
    </d:row>
  </xsl:template>
  
    <xsl:template match="spareDescr">
    <d:row>
      <d:entry>
        <d:para>
          <xsl:call-template name="unique.id.attr"/>
          <xsl:choose>
            <xsl:when test="name">
              <xsl:apply-templates select="name"/>
            </xsl:when>
            <xsl:when test="shortName">
              <xsl:apply-templates select="shortName"/>
            </xsl:when>
          </xsl:choose>
        </d:para>
      </d:entry>
      <d:entry>
        <d:para>
          <xsl:apply-templates select="identNumber/partAndSerialNumber/partNumber"/>
        </d:para>
      </d:entry>
      <d:entry>
        <d:para>
          <xsl:apply-templates select="identNumber/manufacturerCode"/>
        </d:para>
      </d:entry>
      <d:entry>
        <d:para>
          <xsl:apply-templates select="reqQuantity"/>
        </d:para>
      </d:entry>
      <d:entry>
        <d:para>
          <xsl:apply-templates select="remark"/>
        </d:para>
      </d:entry>
    </d:row>
  </xsl:template>

  <xsl:template match="mainProcedure">
    <xsl:choose>
      <xsl:when test="$extra.sections = 0">
        <xsl:if test="$include.bridgeheads != 0">
          <d:bridgehead>Procedure</d:bridgehead>
        </xsl:if>
        <xsl:call-template name="main.procedure"/>
      </xsl:when>
      <xsl:otherwise>
        <d:section>
          <d:title>Procedure</d:title>
          <xsl:call-template name="main.procedure"/>
        </d:section>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
    <xsl:template match="crewDrill">
    <xsl:choose>
      <xsl:when test="$extra.sections = 0">
        <xsl:if test="$include.bridgeheads != 0">
          <d:bridgehead>Procedure</d:bridgehead>
        </xsl:if>
        <xsl:call-template name="main.procedure"/>
      </xsl:when>
      <xsl:otherwise>
        <d:section>
          <d:title>Procedure</d:title>
          <xsl:call-template name="main.procedure"/>
        </d:section>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

    <xsl:template match="subCrewDrill">
    <xsl:choose>
      <xsl:when test="$extra.sections = 0">
        <xsl:if test="$include.bridgeheads != 0">
          <d:bridgehead>Procedure</d:bridgehead>
        </xsl:if>
        <xsl:call-template name="main.procedure"/>
      </xsl:when>
      <xsl:otherwise>
        <d:section>
          <d:title>Procedure</d:title>
          <xsl:call-template name="main.procedure"/>
        </d:section>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>  
  
  <xsl:template name="main.procedure">
    <xsl:choose>
      <xsl:when test="$use.procedure = 1">
        <d:procedure>
          <xsl:apply-templates/>
        </d:procedure>
      </xsl:when>
      <xsl:otherwise>
        <d:orderedlist>
          <xsl:apply-templates/>
        </d:orderedlist>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="proceduralStep|crewDrillStep">
    <xsl:choose>
      <xsl:when test="$use.procedure = 1">
        <d:step>
          <xsl:call-template name="unique.id.attr"/>
          <xsl:apply-templates select="*[not(self::proceduralStep|crewDrillStep)]"/>
          <xsl:if test="proceduralStep|crewDrillStep">
            <d:substeps>
              <xsl:apply-templates select="proceduralStep|crewDrillStep"/>
            </d:substeps>
          </xsl:if>
        </d:step>
      </xsl:when>
      <xsl:otherwise>
        <d:listitem>
          <xsl:call-template name="unique.id.attr"/>
          <xsl:apply-templates select="*[not(self::proceduralStep|crewDrillStep)]"/>
          <xsl:if test="proceduralStep|crewDrillStep">
            <d:orderedlist>
              <xsl:apply-templates select="proceduralStep|crewDrillStep"/>
            </d:orderedlist>
          </xsl:if>
        </d:listitem>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

   <xsl:template match="challrsp | challengeAndResponse">
    <xsl:element name="table">
      <col class="challeng"/>
      <col class="response"/>
      <tbody>
      <tr>
      <td class="challeng"><xsl:apply-templates select="challeng | challenge"/></td>
      <td class="response"><xsl:apply-templates select="response"/></td>
      </tr>
      </tbody>
    </xsl:element>
  </xsl:template>
  
  <xsl:template match="closeRqmts">
    <xsl:choose>
      <xsl:when test="$extra.sections = 0">
        <xsl:if test="$include.bridgeheads != 0">
          <d:bridgehead>Requirements after job completion</d:bridgehead>
        </xsl:if>
        <xsl:apply-templates select="*"/>
      </xsl:when>
      <xsl:otherwise>
        <d:section>
          <d:title>Requirements after job completion</d:title>
          <d:taskrelated>
            <xsl:apply-templates select="*"/>
          </d:taskrelated>
        </d:section>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="get.dmcode">
    <xsl:apply-templates select="ancestor-or-self::dmodule/identAndStatusSection/dmAddress/dmIdent/dmCode"/>
  </xsl:template>

  <xsl:template match="pm">
    <xsl:element name="{$pm.is}">
      <xsl:apply-templates select="*"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="pm/identAndStatusSection">
    <xsl:if test="$pm.db.titlereq.info = 0">
      <xsl:apply-templates select="pmAddress/pmAddressItems/pmTitle" mode="idstatus"/>
    </xsl:if>
    <d:info>
      <xsl:if test="$pm.db.titlereq.info != 0">
        <xsl:apply-templates select="pmAddress/pmAddressItems/pmTitle" mode="idstatus"/>
      </xsl:if>
      <xsl:apply-templates select="pmAddress/pmAddressItems/issueDate" mode="idstatus"/>
      <xsl:apply-templates select="pmStatus" mode="idstatus"/>
    </d:info>
  </xsl:template>

  <xsl:template match="pmTitle" mode="idstatus">
    <d:title>
      <xsl:apply-templates select="."/>
    </d:title>
  </xsl:template>

  <xsl:template match="pmEntry">
    <xsl:choose>
      <!-- Don't add a level if pmEntry is ignored, or it is a child pmEntry
           but no value for the sub.pmentry.is parameter was set (pmentry.is
           default is <part> which cannot be nested). -->
      <xsl:when test="$use.pmentry = 0 or (parent::pmEntry and not ($sub.pmentry.is))">
        <xsl:apply-templates select="pmEntry|dmRef"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:variable name="name">
          <xsl:choose>
            <xsl:when test="parent::pmEntry and $sub.pmentry.is">
              <xsl:value-of select="$sub.pmentry.is"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="$pmentry.is"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:variable>
        <xsl:element name="{$name}">
          <xsl:choose>
            <xsl:when test="$pmentry.db.titlereq.info = 0">
              <xsl:apply-templates select="pmEntryTitle"/>
            </xsl:when>
            <xsl:otherwise>
              <d:info>
                <xsl:apply-templates select="pmEntryTitle"/>
              </d:info>
            </xsl:otherwise>
          </xsl:choose>
          <xsl:apply-templates select="pmEntry|dmRef|dmodule"/>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="pmEntryTitle">
    <d:title>
      <xsl:apply-templates/>
    </d:title>
  </xsl:template>

  <xsl:template match="pmEntry/dmRef">
    <xsl:variable name="dm.ref.code">
      <xsl:apply-templates select="dmRefIdent/dmCode"/>
    </xsl:variable>
    <xsl:for-each select="$all.dmodules">
      <xsl:variable name="dm.code">
        <xsl:call-template name="get.dmcode"/>
      </xsl:variable>
      <xsl:if test="$dm.ref.code = $dm.code">
        <xsl:apply-templates select="."/>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="publication">
    <xsl:apply-templates select="pm"/>
  </xsl:template>

  <xsl:template match="referencedApplicGroup"/>

  <xsl:template match="refs"/>

  <xsl:template name="refs">
    <xsl:param name="refs"/>
    <xsl:choose>
      <xsl:when test="$extra.sections = 0">
        <xsl:if test="$include.bridgeheads != 0">
          <d:bridgehead>References</d:bridgehead>
        </xsl:if>
        <xsl:call-template name="refs.table">
          <xsl:with-param name="refs" select="$refs"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <d:section>
          <d:title>References</d:title>
          <xsl:call-template name="refs.table">
            <xsl:with-param name="refs" select="$refs"/>
          </xsl:call-template>
        </d:section>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="refs.table">
    <xsl:param name="refs"/>
    <d:table>
      <d:title>References</d:title>
      <d:tgroup cols="2">
        <d:thead>
          <d:row>
            <d:entry>Data module/Technical publication</d:entry>
            <d:entry>Title</d:entry>
          </d:row>
        </d:thead>
        <d:tbody>
          <xsl:if test="not($refs)">
            <d:row>
              <d:entry>None</d:entry>
              <d:entry/>
            </d:row>
          </xsl:if>
          <xsl:apply-templates select="$refs/*" mode="refs"/>
        </d:tbody>
      </d:tgroup>
    </d:table>
  </xsl:template>

  <xsl:template match="dmRef" mode="refs">
    <d:row>
      <d:entry>
        <xsl:apply-templates select=".">
          <xsl:with-param name="dmref.link.text">s1000d</xsl:with-param>
        </xsl:apply-templates>
      </d:entry>
      <d:entry>
        <xsl:apply-templates select="dmRefAddressItems/dmTitle"/>
      </d:entry>
    </d:row>
  </xsl:template>

  <xsl:template match="pmRef" mode="refs"/>

  <xsl:template match="externalPubRef" mode="refs"/>

  <xsl:template match="originator|responsiblePartnerCompany">
    <xsl:apply-templates select="enterpriseName"/>
  </xsl:template>

  <xsl:template name="cals.attributes">
    <xsl:copy-of select="@pgwide|@orient|@frame|@rowsep|@colsep|@align|@valign|@namest|@nameend|@cols"/>
  </xsl:template>

  <xsl:template match="table">
    <xsl:choose>
      <xsl:when test="ancestor::levelledPara">
        <d:table>
          <xsl:call-template name="unique.id.attr"/>
          <xsl:call-template name="cals.attributes"/>
          <xsl:apply-templates/>
        </d:table>
      </xsl:when>
      <xsl:otherwise>
        <d:simplesect>
          <d:title/>
          <d:table>
            <xsl:call-template name="unique.id.attr"/>
            <xsl:call-template name="cals.attributes"/>
            <xsl:apply-templates/>
          </d:table>
        </d:simplesect>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="table[not(title)]">
    <d:informaltable>
      <xsl:call-template name="unique.id.attr"/>
      <xsl:call-template name="cals.attributes"/>
      <xsl:apply-templates/>
    </d:informaltable>
  </xsl:template>

  <xsl:template match="tgroup">
    <d:tgroup>
      <xsl:call-template name="cals.attributes"/>
      <xsl:apply-templates/>
    </d:tgroup>
  </xsl:template>

  <xsl:template match="colspec">
    <d:colspec>
      <xsl:call-template name="cals.attributes"/>
    </d:colspec>
  </xsl:template>

  <xsl:template match="thead">
    <d:thead>
      <xsl:call-template name="cals.attributes"/>
      <xsl:apply-templates/>
    </d:thead>
  </xsl:template>

  <xsl:template match="tbody">
    <d:tbody>
      <xsl:call-template name="cals.attributes"/>
      <xsl:apply-templates/>
    </d:tbody>
  </xsl:template>

  <xsl:template match="row">
    <d:row>
      <xsl:call-template name="cals.attributes"/>
      <xsl:apply-templates/>
    </d:row>
  </xsl:template>

  <xsl:template match="entry">
    <d:entry>
      <xsl:call-template name="cals.attributes"/>
      <xsl:apply-templates/>
    </d:entry>
  </xsl:template>

  <xsl:template match="title">
    <d:title>
      <xsl:apply-templates/>
    </d:title>
  </xsl:template>

  <xsl:template match="verbatimText">
    <d:literal>
      <xsl:apply-templates/>
    </d:literal>
  </xsl:template>

  <xsl:template match="verbatimText[@verbatimStyle = 'vs11']">
    <d:programlisting>
      <xsl:apply-templates/>
    </d:programlisting>
  </xsl:template>

  <xsl:template match="verbatimText[@verbatimStyle = 'vs23']">
    <d:screen>
      <xsl:apply-templates/>
    </d:screen>
  </xsl:template>

  <xsl:template match="verbatimText[@verbatimStyle = 'vs24']">
    <d:programlisting>
      <xsl:apply-templates/>
    </d:programlisting>
  </xsl:template>

  <xsl:template match="caution">
    <d:caution>
      <xsl:apply-templates/>
    </d:caution>
  </xsl:template>

  <xsl:template match="warning">
    <d:warning>
      <xsl:apply-templates/>
    </d:warning>
  </xsl:template>

  <xsl:template match="warningAndCautionPara">
    <d:para>
      <xsl:apply-templates/>
    </d:para>
  </xsl:template>

  <xsl:template match="quantity">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="quantity/text()">
    <xsl:value-of select="normalize-space()"/>
  </xsl:template>

  <xsl:template match="quantityGroup">
    <xsl:choose>
      <xsl:when test="@quantityGroupType='minimum'">from </xsl:when>
      <xsl:when test="@quantityGroupType='maximum'"> to </xsl:when>
    </xsl:choose>
    <xsl:for-each select="quantityValue">
      <xsl:if test="position() != 1">
        <xsl:text> </xsl:text>
      </xsl:if>
      <xsl:apply-templates select="."/>
    </xsl:for-each>
    <xsl:if test="quantityValue and quantityTolerance">
      <xsl:text> </xsl:text>
    </xsl:if>
    <xsl:for-each select="quantityTolerance">
      <xsl:if test="position() != 1">
        <xsl:text> </xsl:text>
      </xsl:if>
      <xsl:apply-templates select="."/>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="quantityValue">
    <xsl:value-of select="."/>
    <xsl:apply-templates select="@quantityUnitOfMeasure"/>
  </xsl:template>

  <xsl:template match="quantityTolerance">
    <xsl:call-template name="quantity.tolerance.type"/>
    <xsl:value-of select="."/>
    <xsl:apply-templates select="@quantityUnitOfMeasure"/>
  </xsl:template>

  <xsl:template name="quantity.tolerance.type">
    <xsl:param name="type" select="@quantityToleranceType"/>
    <xsl:choose>
      <xsl:when test="$type = 'plus'">+</xsl:when>
      <xsl:when test="$type = 'minus'">-</xsl:when>
      <xsl:otherwise>± </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="@quantityUnitOfMeasure">
    <xsl:choose>
      <xsl:when test=". = '%'">%</xsl:when>
      <xsl:when test=". = 'cm2'"> cm<d:superscript>2</d:superscript></xsl:when>
      <xsl:when test=". = 'cm3'"> cm<d:superscript>3</d:superscript></xsl:when>
      <xsl:when test=". = 'dega'">°</xsl:when>
      <xsl:when test=". = 'degC'"> °C</xsl:when>
      <xsl:when test=". = 'degF'"> °F</xsl:when>
      <xsl:when test=". = 'ft2'"> ft<d:superscript>2</d:superscript></xsl:when>
      <xsl:when test=". = 'ft3'"> ft<d:superscript>3</d:superscript></xsl:when>
      <xsl:when test=". = 'in2'"> in<d:superscript>2</d:superscript></xsl:when>
      <xsl:when test=". = 'in3'"> in<d:superscript>3</d:superscript></xsl:when>
      <xsl:when test=". = 'km2'"> km<d:superscript>2</d:superscript></xsl:when>
      <xsl:when test=". = 'km3'"> km<d:superscript>3</d:superscript></xsl:when>
      <xsl:when test=". = 'm2'"> m<d:superscript>2</d:superscript></xsl:when>
      <xsl:when test=". = 'm3'"> m<d:superscript>3</d:superscript></xsl:when>
      <xsl:otherwise>
        <xsl:text> </xsl:text>
        <xsl:value-of select="."/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>