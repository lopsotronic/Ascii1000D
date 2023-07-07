<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:exslt="http://exslt.org/common" extension-element-prefixes="exslt exslt-math exslt-sets" xmlns:exslt-sets="http://exslt.org/sets" xmlns:exslt-math="http://exslt.org/math">
  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
  <xsl:param name="screenWidth" select="768"/>
  <xsl:param name="screenHeight" select="1024"/>
  <xsl:param name="paddingPercentage" select="35"/>
  <xsl:variable name="totalTemplates" select="count(//xsl:template)"/>
  <xsl:variable name="templateGridColumns" select="ceiling(exslt-math:sqrt($totalTemplates))"/>
  <xsl:variable name="templateGridRows" select="ceiling($totalTemplates div $templateGridColumns)"/>
  <xsl:variable name="templateWidth" select="round($screenWidth div $templateGridColumns)"/>
  <xsl:variable name="templateHeight" select="round($screenHeight div $templateGridRows)"/>
  <xsl:variable name="actualTemplateWidth" select="((100 - $paddingPercentage ) div  100) * $templateWidth"/>
  <xsl:variable name="actualTemplateHeight" select="((100 - $paddingPercentage ) div  100) * $templateHeight"/>
  <xsl:template match="/">
    <svg xmlns="http://www.w3.org/2000/svg" width="{$screenWidth}" height="{$screenHeight}">
      <g id="templates" viewbox="0 0 {$screenWidth} {$screenHeight}">
        <xsl:for-each select="/xsl:stylesheet/xsl:template">
          <xsl:apply-templates mode="layout" select=".">
            <xsl:with-param name="templateNumber" select="position()"/>
          </xsl:apply-templates>
        </xsl:for-each>
        <xsl:for-each select="/xsl:stylesheet/xsl:template">
          <xsl:apply-templates mode="layout" select=".">
            <xsl:with-param name="templateNumber" select="position()"/>
            <xsl:with-param name="drawn" select='"yes"'/>
          </xsl:apply-templates>
        </xsl:for-each>
      </g>
    </svg>
  </xsl:template>
  <xsl:template match="xsl:template" mode="layout">
    <xsl:param name="templateNumber"/>
    <xsl:param name="drawn" select='"no"'/>
    <xsl:variable name="columnCoordinate">
      <xsl:choose>
        <xsl:when test="$templateNumber mod $templateGridColumns = 0">
          <xsl:value-of select="$templateGridColumns"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$templateNumber mod $templateGridColumns"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="rowCoordinate" select="ceiling($templateNumber div $templateGridColumns)"/>
    <xsl:variable name="x" select="($paddingPercentage div 200) * $actualTemplateWidth * (2 * $columnCoordinate - 1) + (($columnCoordinate - 1)  * $actualTemplateWidth)"/>
    <xsl:variable name="y" select="($paddingPercentage div 200) * $actualTemplateHeight * (2 * $rowCoordinate - 1) + (($rowCoordinate - 1)  *$actualTemplateHeight)"/>
    <xsl:choose>
      <xsl:when test='$drawn = "yes"'>
        <xsl:apply-templates select="." mode="links">
          <xsl:with-param name="x" select="$x"/>
          <xsl:with-param name="y" select="$y"/>
        </xsl:apply-templates>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates select="." mode="draw">
          <xsl:with-param name="x" select="$x"/>
          <xsl:with-param name="y" select="$y"/>
        </xsl:apply-templates>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template match="xsl:template" mode="draw">
    <xsl:param name="x"/>
    <xsl:param name="y"/>
    <rect xmlns="http://www.w3.org/2000/svg" x="{$x}" y="{$y}" fill="white" width="{$actualTemplateWidth}" height="{$actualTemplateHeight}" stroke="black" stroke-width="2"/>
    <text xmlns="http://www.w3.org/2000/svg" x="{$x+10}" y="{$y+10}" textLength="{$actualTemplateWidth}" fill="red">
      <xsl:value-of select="@match"/>
    </text>
    <text xmlns="http://www.w3.org/2000/svg" x="{$x + 10}" y="{$y + 10 + ($actualTemplateHeight div 6)}" textLength="{$actualTemplateWidth}" fill="green">
      <xsl:value-of select="@mode"/>
    </text>
    <text xmlns="http://www.w3.org/2000/svg" x="{$x + 1}" y="{$y + 10 + ($actualTemplateHeight div 3)}" textLength="{$actualTemplateWidth}" fill="blue" font-weight="bold">
      <xsl:value-of select="@name"/>
    </text>
  </xsl:template>
  <xsl:template match="xsl:template" mode="links">
    <xsl:param name="x"/>
    <xsl:param name="y"/>
    <xsl:for-each select="exslt-sets:distinct(.//xsl:call-template/@name)">
      <xsl:variable name="sentParams">
        <xsl:choose>
          <xsl:when test="../xsl:with-param">(<xsl:for-each select="../xsl:with-param">
              <xsl:value-of select="@name"/>
              <xsl:text>,</xsl:text>
            </xsl:for-each>)</xsl:when>
          <xsl:otherwise/>
        </xsl:choose>
      </xsl:variable>
      <xsl:variable name="targetName">
        <xsl:value-of select="."/>
      </xsl:variable>
      <xsl:for-each select="//xsl:template">
        <xsl:if test="@name = $targetName">
          <xsl:call-template name="drawLines">
            <xsl:with-param name="x" select="$x"/>
            <xsl:with-param name="y" select="$y"/>
            <xsl:with-param name="sentParams" select="$sentParams"/>
            <xsl:with-param name="drawColor" select="'red'"/>
          </xsl:call-template>
        </xsl:if>
      </xsl:for-each>
    </xsl:for-each>
    <xsl:for-each select=".//xsl:apply-templates[@mode]">
      <xsl:variable name="sentParams">(<xsl:for-each select="xsl:with-param">
          <xsl:value-of select="@name"/>
          <xsl:text>,</xsl:text>
        </xsl:for-each>)</xsl:variable>
      <xsl:variable name="pushMode">
        <xsl:value-of select="@mode"/>
      </xsl:variable>
      <xsl:for-each select="//xsl:template">
        <xsl:if test="@mode = $pushMode">
          <xsl:call-template name="drawLines">
            <xsl:with-param name="drawColor" select="'cyan'"/>
            <xsl:with-param name="x" select="$x"/>
            <xsl:with-param name="y" select="$y"/>
          </xsl:call-template>
        </xsl:if>
      </xsl:for-each>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="drawLines">
    <xsl:param name="x"/>
    <xsl:param name="y"/>
    <xsl:param name="drawColor"/>
    <xsl:param name="sentParams"/>
    <xsl:variable name="cCoord">
      <xsl:choose>
        <xsl:when test="position() mod $templateGridColumns = 0">
          <xsl:value-of select="$templateGridColumns"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="position() mod $templateGridColumns"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="rCoord" select="ceiling(position() div $templateGridColumns)"/>
    <xsl:variable name="aTW" select="((100 - $paddingPercentage ) div  100) * $templateWidth"/>
    <xsl:variable name="aTH" select="((100 - $paddingPercentage ) div  100) * $templateHeight"/>
    <xsl:variable name="targetX" select="($paddingPercentage div 200) * $aTW * (2 * $cCoord - 1) + (($cCoord - 1)  * $aTW)"/>
    <xsl:variable name="targetY" select="($paddingPercentage div 200) * $aTH * (2 * $rCoord - 1) + (($rCoord - 1)  * $aTH)"/>
    <xsl:variable name="centerX" select="$x + ($actualTemplateWidth div 2)"/>
    <xsl:variable name="centerY" select="$y + 10 + ($actualTemplateHeight div 3)"/>
    <xsl:variable name="lineDistance" select="exslt-math:sqrt(  exslt-math:power(exslt-math:abs($centerX - $targetX),2) + exslt-math:power(exslt-math:abs($centerY - $targetY),2)  )"/>
    <xsl:choose>
      <xsl:when test="ancestor::xsl:choose | ancestor::xsl:if">
        <line xmlns="http://www.w3.org/2000/svg" x1="{$centerX}" y1="{$centerY}" x2="{$targetX}" y2="{$targetY}" stroke-width="1" stroke-dasharray="3, 3, 5" stroke="{$drawColor}" fill="{$drawColor}"/>
      </xsl:when>
      <xsl:otherwise>
        <line xmlns="http://www.w3.org/2000/svg" x1="{$centerX}" y1="{$centerY}" x2="{$targetX}" y2="{$targetY}" stroke-width="1" stroke="{$drawColor}" fill="{$drawColor}"/>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="$centerX > $targetX">
        <defs>
          <path xmlns="http://www.w3.org/2000/svg" d="M {$targetX} {$targetY} L {$centerX} {$centerY} " stroke-width="1" stroke="orange" fill="orange" id="path{round($centerX)}{round($centerY)}{round($targetX)}{round($targetY)}"/>
        </defs>
      </xsl:when>
      <xsl:otherwise>
        <defs>
          <path xmlns="http://www.w3.org/2000/svg" d="M {$centerX} {$centerY} L {$targetX} {$targetY}" stroke-width="1" stroke="orange" fill="orange" id="path{round($centerX)}{round($centerY)}{round($targetX)}{round($targetY)}"/>
        </defs>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="normalize-space($sentParams)">
      <text font-family="Verdana" textLength="{$lineDistance}" fill="black" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" lengthAdjust="spacingAndGlyphs">
        <xsl:choose>
          <xsl:when test="$centerX > $targetX">
            <textPath xlink:href="#path{round($centerX)}{round($centerY)}{round($targetX)}{round($targetY)}" startOffset="10%">
              <xsl:value-of select="$sentParams"/>
            </textPath>
          </xsl:when>
          <xsl:otherwise>
            <textPath xlink:href="#path{round($centerX)}{round($centerY)}{round($targetX)}{round($targetY)}" startOffset="0%" spacing="auto">
              <xsl:value-of select="$sentParams"/>
            </textPath>
          </xsl:otherwise>
        </xsl:choose>
      </text>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>