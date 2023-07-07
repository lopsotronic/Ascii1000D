<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:db="http://docbook.org/ns/docbook"
                version="1.0"
                exclude-result-prefixes="db">

  <!-- pandoc seems to format docbook output like:

       <para>
         Some text
       </para>

       But this extraneous line break and indentation causes problems with
       other formatters, and is especially inconvenient when you have some
       elements which are inline with text where space is important, for
       example:

       <para>
         Some text, and <emphasis>this text is emphasized</emphasis>.
       </para>

       Normalizing the text will fix the invalid space before <para> and
       </para>, but will remove the valid space before <emphasis>!

       To solve this, the template "inline-elem-pre-space" must be called
       at the start of a transformation on an "inline" element, and the
       template "inline-elem-post-space" must be called at the end.

       This does not correctly fix all cases: if an "inline" element is not
       supposed to have space following a text node, it will incorrectly be
       preceded by a space in the output.
       
       This behaviour is toggled with the normalize.space param. -->
  <xsl:param name="normalize.space" select="0"/>

  <!-- If these characters immediately preceed an "inline" element, no space is
       added before. -->
  <xsl:variable name="pre.punctuation">(</xsl:variable>

  <!-- If these characters immediately follow an "inline" element, no space is
       added after. -->
  <xsl:variable name="post.punctuation">.!?;:"')</xsl:variable>

  <xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>

  <xsl:template match="@xml:id">
    <xsl:attribute name="id">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="db:article">
    <xsl:choose>
      <xsl:when test="db:task">
        <xsl:apply-templates/>
      </xsl:when>
      <xsl:otherwise>
        <description>
          <xsl:apply-templates/>
        </description>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="db:info"/>

  <xsl:template match="db:task">
    <procedure>
      <xsl:apply-templates/>
    </procedure>
  </xsl:template>

  <xsl:template match="db:procedure">
    <mainProcedure>
      <xsl:apply-templates/>
    </mainProcedure>
  </xsl:template>

  <xsl:template match="db:step">
    <proceduralStep>
      <xsl:apply-templates/>
    </proceduralStep>
  </xsl:template>

  <xsl:template match="db:section">
    <levelledPara>
      <xsl:apply-templates select="@xml:id"/>
      <xsl:apply-templates/>
    </levelledPara>
  </xsl:template>

  <xsl:template match="db:title">
    <title>
      <xsl:apply-templates/>
    </title>
  </xsl:template>

  <xsl:template match="db:para">
    <para>
      <xsl:apply-templates/>
    </para>
  </xsl:template>

  <xsl:template match="db:orderedlist">
    <para>
      <sequentialList>
        <xsl:apply-templates/>
      </sequentialList>
    </para>
  </xsl:template>

  <xsl:template match="db:itemizedlist">
    <para>
      <randomList>
        <xsl:apply-templates/>
      </randomList>
    </para>
  </xsl:template>

  <xsl:template match="db:listitem">
    <listItem>
      <xsl:apply-templates/>
    </listItem>
  </xsl:template>

  <xsl:template match="db:table|db:informaltable|db:formaltable">
    <table>
      <xsl:apply-templates/>
    </table>
  </xsl:template>

  <xsl:template match="db:tgroup">
    <tgroup>
      <xsl:copy-of select="@cols"/>
      <xsl:apply-templates/>
    </tgroup>
  </xsl:template>

  <xsl:template match="db:colspec">
    <colspec>
      <xsl:copy-of select="@*"/>
      <xsl:apply-templates/>
    </colspec>
  </xsl:template>

  <xsl:template match="db:thead">
    <thead>
      <xsl:apply-templates/>
    </thead>
  </xsl:template>

  <xsl:template match="db:tbody">
    <tbody>
      <xsl:apply-templates/>
    </tbody>
  </xsl:template>

  <xsl:template match="db:row">
    <row>
      <xsl:apply-templates/>
    </row>
  </xsl:template>

  <xsl:template match="db:entry">
    <entry>
      <xsl:choose>
        <xsl:when test="not(db:para)">
          <para>
            <xsl:apply-templates/>
          </para>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates/>
        </xsl:otherwise>
      </xsl:choose>
    </entry>
  </xsl:template>

  <xsl:template match="db:blockquote">
    <note>
      <xsl:choose>
        <xsl:when test="db:para">
          <xsl:apply-templates/>
        </xsl:when>
        <xsl:otherwise>
          <notePara>
            <xsl:apply-templates/>
          </notePara>
        </xsl:otherwise>
      </xsl:choose>
    </note>
  </xsl:template>

  <xsl:template match="db:blockquote/db:para">
    <notePara>
      <xsl:apply-templates/>
    </notePara>
  </xsl:template>

  <xsl:template match="db:link">
    <xsl:call-template name="inline-elem-pre-space"/>
    <internalRef internalRefId="{@linkend}"/>
    <xsl:call-template name="inline-elem-post-space"/>
  </xsl:template>

  <xsl:template match="text()">
    <xsl:choose>
      <xsl:when test="$normalize.space = 0">
        <xsl:value-of select="."/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="normalize-space()"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="inline-elem-pre-space">
    <xsl:variable name="text" select="preceding-sibling::text()[1]"/>
    <xsl:variable name="len" select="string-length($text)"/>
    <xsl:variable name="last" select="substring($text, $len, 1)"/>
    <xsl:if test="$normalize.space != 0 and $text and not(contains($pre.punctuation, $last))">
      <xsl:text> </xsl:text>
    </xsl:if>
  </xsl:template>

  <xsl:template name="inline-elem-post-space">
    <xsl:variable name="text" select="following-sibling::text()[1]"/>
    <xsl:variable name="first" select="substring($text, 1, 1)"/>
    <xsl:if test="$normalize.space != 0 and not(contains($post.punctuation, $first))">
      <xsl:text> </xsl:text>
    </xsl:if>
  </xsl:template>

  <xsl:template match="db:emphasis">
    <xsl:call-template name="inline-elem-pre-space"/>
    <emphasis>
      <xsl:if test="@role">
        <xsl:attribute name="emphasisType">
          <xsl:choose>
            <xsl:when test="@role = 'italic'">em02</xsl:when>
            <xsl:when test="@role = 'underline'">em03</xsl:when>
            <xsl:otherwise>em01</xsl:otherwise>
          </xsl:choose>
        </xsl:attribute>
      </xsl:if>
      <xsl:apply-templates/>
    </emphasis>
    <xsl:call-template name="inline-elem-post-space"/>
  </xsl:template>

  <xsl:template match="db:variablelist">
    <definitionList>
      <xsl:apply-templates/>
    </definitionList>
  </xsl:template>

  <xsl:template match="db:varlistentry">
    <definitionListItem>
      <xsl:apply-templates/>
    </definitionListItem>
  </xsl:template>

  <xsl:template match="db:term">
    <listItemTerm>
      <xsl:apply-templates/>
    </listItemTerm>
  </xsl:template>

  <xsl:template match="db:varlistentry/db:listitem">
    <listItemDefinition>
      <xsl:apply-templates/>
    </listItemDefinition>
  </xsl:template>

  <xsl:template match="db:inlinemediaobject/db:imageobject/db:imagedata">
    <symbol>
      <xsl:attribute name="infoEntityIdent">
        <xsl:value-of select="@fileref"/>
      </xsl:attribute>
    </symbol>
  </xsl:template>

  <xsl:template match="db:figure">
    <figure>
      <xsl:apply-templates/>
    </figure>
  </xsl:template>

  <xsl:template match="db:mediaobject/db:imageobject/db:imagedata">
    <graphic>
      <xsl:attribute name="infoEntityIdent">
        <xsl:value-of select="@fileref"/>
      </xsl:attribute>
    </graphic>
  </xsl:template>

</xsl:stylesheet>