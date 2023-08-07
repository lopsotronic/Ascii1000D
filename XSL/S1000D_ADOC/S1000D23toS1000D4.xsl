<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:redirect="http://xml.apache.org/xalan/redirect"
                xmlns:xalan="http://xml.apache.org/xalan"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0"
                xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
                xmlns:dc="http://www.purl.org/dc/elements/1.1/">
                
    <xsl:template match="dmodule">
<!--         <xsl:text disable-output-escaping="yes">
&lt;!DOCTYPE dmodule [
</xsl:text> -->

<!--         <xsl:call-template name="get-set-gr-entity"/>
 --><!--         <xsl:text disable-output-escaping="yes">&lt;!ENTITY % ISOEntities PUBLIC "ISO 8879-1986//ENTITIES ISO Character Entities 20030531//EN//XML" "http://www.s1000d.org/S1000D_4-0/ent/ISOEntities"&gt;
%ISOEntities;
]&gt;
</xsl:text> -->
        <dmodule xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:dc="http://www.purl.org/dc/elements/1.1/">     
            <xsl:apply-templates select="@* | node()"/>
        </dmodule>
    </xsl:template>
    
    <xsl:template match="@xsi:noNamespaceSchemaLocation" name="noNamespaceSchemaLocation">
        <xsl:param name="ns" select="."/>
        <!-- ** TODO ** --> 
        <!-- Change: Allow using of master schemas as a configuration option -->
        <xsl:variable name="val">
            <xsl:choose>
                <xsl:when test="contains( $ns, 'descript')">
                    <xsl:text>http://www.s1000d.org/S1000D_4-0-1/xml_schema_flat/descript.xsd</xsl:text>
                </xsl:when>
                <xsl:when test="contains( $ns, 'proced')">
                    <xsl:text>http://www.s1000d.org/S1000D_4-0-1/xml_schema_flat/proced.xsd</xsl:text>
                </xsl:when>
                <xsl:when test="contains( $ns, 'ipd')">
                    <xsl:text>http://www.s1000d.org/S1000D_4-0-1/xml_schema_flat/ipd.xsd</xsl:text>
                </xsl:when>
                <xsl:when test="contains( $ns, 'fault')">
                    <xsl:text>http://www.s1000d.org/S1000D_4-0-1/xml_schema_flat/fault.xsd</xsl:text>
                </xsl:when>
                <xsl:when test="contains( $ns, 'crew')">
                    <xsl:text>http://www.s1000d.org/S1000D_4-0-1/xml_schema_flat/crew.xsd</xsl:text>
                </xsl:when>
                <xsl:when test="contains( $ns, 'schedul')">
                    <xsl:text>http://www.s1000d.org/S1000D_4-0-1/xml_schema_flat/schedul.xsd</xsl:text>
                </xsl:when>
                <xsl:when test="contains( $ns, 'wrngflds')">
                    <xsl:text>http://www.s1000d.org/S1000D_4-0-1/xml_schema_flat/wrngflds.xsd</xsl:text>
                </xsl:when>
                <xsl:when test="contains( $ns, 'wrngdata')">
                    <xsl:text>http://www.s1000d.org/S1000D_4-0-1/xml_schema_flat/wrngdata.xsd</xsl:text>
                </xsl:when>
                <xsl:when test="contains( $ns, 'brex')">
                    <xsl:text>http://www.s1000d.org/S1000D_4-0-1/xml_schema_flat/brex.xsd</xsl:text>
                </xsl:when>
                <xsl:when test="contains( $ns, 'pm')">
                    <xsl:text>http://www.s1000d.org/S1000D_4-0-1/xml_schema_flat/pm.xsd</xsl:text>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="string-length( $val ) &gt; 0">
                <xsl:attribute name="xsi:noNamespaceSchemaLocation">
                    <xsl:value-of select="$val"/>
                </xsl:attribute>
            </xsl:when>
            <xsl:otherwise>#</xsl:otherwise>
        </xsl:choose>
    </xsl:template>
	
  <xsl:template match="rdf:Description | 
                       dc:contributor | dc:creator | dc:date | dc:format | dc:identifier | 
                       dc:language | dc:publisher | dc:rights | dc:subject | dc:title | dc:type">
    <xsl:element name="{name()}">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="@xlink:actuate | @xlink:href | @xlink:show | @xlink:title | @xlink:type">
    <xsl:copy-of select="."/>
  </xsl:template>

  <xsl:template match="abbrev">
    <xsl:element name="shortName">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="accessfrom">
    <xsl:element name="accessFrom">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="accessories">
    <xsl:element name="accessoryGroup">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="accessory">
    <xsl:element name="accessory">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="accessto">
    <xsl:element name="accessTo">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="acclist">
    <xsl:element name="connectorAccessories">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="accpnlalt">
    <xsl:element name="accessPointAlt">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="accpnlid">
    <xsl:element name="accessPointIdent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="accpnlinfo">
    <xsl:element name="accessPointSpec">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="accpnllist">
    <xsl:element name="accessPointRepository">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="accpnlref">
    <xsl:element name="accessPointRefGroup">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="acctype">
    <xsl:element name="accessPointType">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="acrodef">
    <xsl:element name="acronymDefinition">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="acrw">
    <xsl:element name="crew">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="act">
    <xsl:element name="applicCrossRefTable">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="action">
    <xsl:element name="action">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="actref">
    <xsl:element name="applicCrossRefTableRef">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

<!--   <xsl:template match="add">
    TODO: Future Capability 
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log"> UNSUPPORTED: ELEMENT WAS: add,  NOW:@setoperation(add) COMMENT: Now an attribute value</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template> -->

  <xsl:template match="addresdm">
    <xsl:element name="dmRef"><xsl:apply-templates select="@* | node()"/></xsl:element>
  </xsl:template>

  <xsl:template match="address">
    <xsl:element name="address">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="address">
    <xsl:element name="businessUnitAddress">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="afi">
    <xsl:element name="faultIsolation">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="afi-proc">
    <xsl:element name="faultIsolationProcedure">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="afiref">
    <xsl:element name="faultIsolationRef">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="afr">
    <xsl:element name="faultReporting">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

<!--   <xsl:template match="age">
    TODO: Need to test
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">WARNING: Element AGE is no longer supported. Child elements converted to DMCODE structure.</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
    
    Modified to select only elements since PIs may cause attribute insert out of order
    AGE is suppressed but children processed
    <xsl:element name="dmCode">
     <xsl:apply-templates select="@*"/>
     <xsl:apply-templates select="modelic"/>
     <xsl:apply-templates select="sdc"/>
     <xsl:apply-templates select="ecscs"/>
     <xsl:apply-templates select="eidc"/>
     <xsl:apply-templates select="cidc"/> 
     <xsl:apply-templates select="discode"/>
     <xsl:apply-templates select="discodev"/>
     <xsl:apply-templates select="incode"/>
     <xsl:apply-templates select="incodev"/>
     <xsl:apply-templates select="itemloc"/>
    </xsl:element>
</xsl:template> -->

  <xsl:template match="airpwr">
    <!-- MODIFIED: Converted airpwr into a required condition only if explictally required or not required -->
    <!-- FUTURE: Text is inserted.  Allow the output to be configurable for language and project-->
    <xsl:if test="@status='yes' or @status='no'">
    <xsl:element name="reqCondNoRef">
      <xsl:element name="reqCond">
        <xsl:choose>
          <xsl:when test="@status='yes'">
            <xsl:text>The system required to have </xsl:text>
          </xsl:when>
          <xsl:when test="@status='no'">
            <xsl:text>The system prohibited from having </xsl:text>
          </xsl:when>
        </xsl:choose>
        <xsl:choose>
          <xsl:when test="@power='engine'">
            <xsl:text>an engine air supply connected.</xsl:text>
          </xsl:when>
          <xsl:when test="@power='apu'">
            <!-- this option is nonsense -->
            <xsl:text>an APU air supply connected.</xsl:text>
          </xsl:when>
          <xsl:when test="@power='internal'">
            <xsl:text>an internal air supply connected.</xsl:text>
          </xsl:when>
          <xsl:when test="@power='external'">
            <xsl:text>an external air supply connected.</xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <!-- If power is "indifferent" or "notapplic"  -->
            <xsl:text>an air supply connected.</xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:element>
    </xsl:element>
    </xsl:if>
  </xsl:template>

  <xsl:template match="altid">
    <xsl:element name="altIdent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="altids">
    <xsl:element name="altIdentGroup">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="amperage">
    <xsl:element name="amperage">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

<!--   <xsl:template match="and">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: and,  NOW:@booleanoperation(and) COMMENT: Now an attribute value</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template> -->

  <xsl:template match="answer">
    <xsl:element name="answer">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="isostep//answer">
    <xsl:element name="isolationStepAnswer">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="apn">
    <xsl:element name="altPart">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="apntext">
    <xsl:element name="altPartDescr">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="applic[ancestor::idstatus][not( ancestor::rfu )]">
    <xsl:element name="{name()}">
      <xsl:attribute name="id">
        <xsl:choose>
          <xsl:when test="@id">
            <xsl:value-of select="@id"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="concat( 'appl', 
                                          format-number( count( preceding::applic )+1, '0000' ) )"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:attribute>
      <!-- <displayText><simplePara></simplePara></displayText> -->
      <xsl:element name="displayText">
        <xsl:for-each select="./descendant::*">
          <xsl:element name="simplePara">
            <xsl:text>[</xsl:text>
            <xsl:for-each select="@*">
              <xsl:value-of select="concat( '[@', name(), '=', ., ']' )"/>
            </xsl:for-each>
            <xsl:value-of select="."/>
            <xsl:text>]</xsl:text>
          </xsl:element>
        </xsl:for-each>
      </xsl:element>
    </xsl:element>
  </xsl:template>

<!--   <xsl:template match="applic">
    TODO: Implement in a future release
    <xsl:comment>
    <xsl:text>'Applic': </xsl:text>
    <xsl:apply-templates select="@* | node()"/>
    </xsl:comment>
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">UNSUPPORTED: Element APPLIC is not supported in this release of the converter.</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template> -->

<!--   <xsl:template match="applics">
    3.0 specific
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">UNSUPPORTED: Element APPLICS is not supported in this release of the converter.</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template> -->

  <xsl:template match="asp">
    <xsl:element name="attachStoreShipPart">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="asrequir">
    <!-- MANUAL MODIFICATION -->
    <!-- Change: determine the appropriate wrapper for personnel children -->
    <xsl:element name="personnel">
    <xsl:if test="not(name(following-sibling::*[1])='asrequir') and 
                  not(name(following-sibling::*[1])='person')">

       <xsl:apply-templates select="following-sibling::*[1]" 
                            mode="wrap-reqpers"/>

       <xsl:if test="not(name(following-sibling::*[2])='asrequir') and 
                     not(name(following-sibling::*[2])='person')">

         <xsl:apply-templates select="following-sibling::*[2]" 
                              mode="wrap-reqpers"/>

         <xsl:if test="not(name(following-sibling::*[3])='asrequir') and 
                       not(name(following-sibling::*[3])='person')">

           <xsl:apply-templates select="following-sibling::*[3]" 
                                mode="wrap-reqpers"/>

           <xsl:if test="not(name(following-sibling::*[4])='asrequir') and 
                         not(name(following-sibling::*[4])='person')">

             <xsl:apply-templates select="following-sibling::*[4]" 
                                  mode="wrap-reqpers"/>

           </xsl:if>

         </xsl:if>

       </xsl:if>

    </xsl:if>

    </xsl:element>
  </xsl:template>

  <xsl:template match="assert">
   <xsl:element name="assert">
    <xsl:apply-templates select="@* | node()"/>
   </xsl:element>
  </xsl:template>

  <xsl:template match="assertion">
    <xsl:element name="assertion">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="assign">
    <xsl:element name="assign">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="assy">
    <xsl:element name="assy">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="assyinstr">
    <xsl:element name="assyInstruction">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="attenuation">
    <xsl:element name="attenuation">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="autandtp">
    <xsl:element name="authorityInfoAndTp">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="authex">
    <xsl:element name="authorityExceptions">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="avee">
    <!-- Modified to select only elements since PIs may cause attribute insert out of order -->
    <!-- AVEE is suppressed but children processed -->
    <xsl:element name="dmCode">
     <xsl:apply-templates select="@*"/>
     <xsl:apply-templates select="modelic"/>
     <xsl:apply-templates select="sdc"/>
     <xsl:apply-templates select="chapnum"/>
     <xsl:apply-templates select="section"/>
     <xsl:apply-templates select="subsect"/>
     <xsl:apply-templates select="subject"/> 
     <xsl:apply-templates select="discode"/>
     <xsl:apply-templates select="discodev"/>
     <xsl:apply-templates select="incode"/>
     <xsl:apply-templates select="incodev"/>
     <xsl:apply-templates select="itemloc"/>
    </xsl:element>
  </xsl:template>

<!--   <xsl:template match="avehcfg"/>
  <xsl:template match="avehcfg" mode="avehcfg-reqcond">
    TODO: Testing conversion of children to reqconds
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">WARNING: Element avehcfg is not supported in S1000D 4.0 and its child elements will be converted to required conditions or ignored if their @status="indiffer|na".</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>    
    <xsl:apply-templates select="@* | node()"/>
  </xsl:template> -->

  <xsl:template match="bfe">
    <xsl:element name="buyerFurnishedEquipFlag">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="bndfrom">
    <xsl:element name="boundaryFrom">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="bndto">
    <xsl:element name="boundaryTo">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="boolean">
    <xsl:element name="booleanValue">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="boundary">
    <xsl:element name="boundary">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="brex">
    <xsl:element name="brex">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="brexref">
    <xsl:element name="brexDmRef">
      <xsl:if test="descendant::modelic">
        <xsl:apply-templates select="@* | node()"/>
      </xsl:if>
      <xsl:if test="not(descendant::modelic)">
        <!-- TODO: Allow this to be set as an external option. -->
        <!-- USE Default DMC here -->
        <dmRef>
         <dmRefIdent>
           <dmCode modelIdentCode="S1000D" systemDiffCode="A" systemCode="04" subSystemCode="0" subSubSystemCode="1" assyCode="0301" disassyCode="00" disassyCodeVariant="A" infoCode="022" infoCodeVariant="A" itemLocationCode="D"/>
         </dmRefIdent>
         <dmRefAddressItems/>
        </dmRef>
      </xsl:if>
    </xsl:element>
  </xsl:template>

  <xsl:template match="button">
    <xsl:element name="pushButton">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="can">
    <xsl:element name="changeAuthorityNumber">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="capbody">
    <xsl:element name="captionBody">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="capentry">
    <xsl:element name="captionEntry">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="capline">
    <xsl:element name="captionLine">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="caprow">
    <xsl:element name="captionRow">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="captext">
    <xsl:element name="captionText">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="case">
    <xsl:element name="case">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cat">
    <xsl:element name="timeLimitCategory">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="category">
    <xsl:element name="safetyCategory">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>


  <xsl:template match="cbalt">
    <xsl:element name="circuitBreakerAlt">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cbclass">
    <xsl:element name="circuitBreakerClass">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cbdata">
    <xsl:element name="circuitBreakerDescr">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cbid">
    <xsl:element name="circuitBreakerIdent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cbinfo">
    <xsl:element name="circuitBreakerSpec">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cblist">
    <xsl:element name="circuitBreakerRepository">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cbloc">
    <xsl:element name="circuitBreakerLocation">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cblst">
    <xsl:element name="circuitBreakerDescrGroup">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cbs">
    <xsl:element name="partLocationSegment">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cbsublst">
    <xsl:element name="circuitBreakerDescrSubGroup">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="ccode">
    <xsl:element name="commentCode">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="ccontent">
    <xsl:element name="commentContent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="ccs">
    <xsl:element name="applicabilitySegment">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cct">
    <xsl:element name="condCrossRefTable">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cctref">
    <xsl:element name="condCrossRefTableRef">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cdesc">
    <xsl:element name="contactDescr">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cdescs">
    <xsl:element name="contactDescrGroup">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cdia">
    <xsl:element name="contactDiameter">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="ces">
   <!-- MANUAL MODIFICATION -->
   <!-- Change: Wrap children in appropriate containers -->
   <locationRcmdSegment>
     <xsl:for-each select="child::*">
       <xsl:if test="name(.)='srv' and position()=1">
         <xsl:text disable-output-escaping="yes">&lt;locationRcmd&gt;</xsl:text>
       </xsl:if>
       <xsl:if test="name(.)='srv' and position()!=1">
         <xsl:text disable-output-escaping="yes">&lt;/locationRcmd&gt;
&lt;locationRcmd&gt;</xsl:text>
       </xsl:if>
       <xsl:apply-templates select='.'/>
       <xsl:if test="not(following-sibling::*)">
         <xsl:text disable-output-escaping="yes">&lt;/locationRcmd&gt;</xsl:text>
       </xsl:if>
     </xsl:for-each>
   </locationRcmdSegment>
  </xsl:template>

  <xsl:template match="cfault">
    <xsl:element name="correlatedFault">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="challeng">
    <xsl:element name="challenge">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="challrsp">
    <xsl:element name="challengeAndResponse">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

    <!-- there are certain elements that in 3.0 allowed text, but now, no longer allow it.
         we need to make sure all those are identified, and that any text that was a child of
         one of those elements is now wrapped in a para
    -->
    <xsl:template match="text()">
        <xsl:variable name="wrapInPara">
            <xsl:call-template name="checkIfWrap" />
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="$wrapInPara = 'true'">
                <!-- what kind of para do we need to wrap it in?  
                     If inside a parent item, and item's grandparent is a
                     warning, caution, or note, then element should
                     be attentionListItemPara
                -->
                <xsl:variable name="elementName">
                    <xsl:call-template name="determineParaElementName" />
                </xsl:variable>
                <xsl:element name="{$elementName}">
                    <xsl:call-template name="handleText" />
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="handleText" />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="determineParaElementName">
        <xsl:variable name="parent">
            <xsl:value-of select="name(..)" />
        </xsl:variable>
        <!-- this is really the gramps of the parent, not the text node -->
        <xsl:variable name="ancestorWCN">
            <xsl:call-template name="checkAncestorWCN" />
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="($parent = 'item') and ($ancestorWCN = 'true')">
                <xsl:text>attentionListItemPara</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>para</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

   
    <xsl:template name="handleText">
        <xsl:value-of select="translate( ., '&#x0A;' ,' ' )"/>
    </xsl:template>

    <!-- elements that are part of paracon in 3.0  will be
         named element that are part of textElementGroup in 4.0.
    -->
    
    <xsl:template match="caution|warning">
        <xsl:call-template name="createElementWithThisName">
            <xsl:with-param name="elementName" select="name()" />
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template match="acronym|caption|emphasis|symbol|quantity">
        <xsl:call-template name="createElementAndParaWrap">
            <xsl:with-param name="elementName" select="name()" />
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template match="accpnl">
        <xsl:call-template name="createElementAndParaWrap">
            <xsl:with-param name="elementName" select="'accessPointRef'" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="acroterm">
        <xsl:call-template name="createElementAndParaWrap">
            <xsl:with-param name="elementName" select="'acronymTerm'" />
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template match="capgrp">
        <xsl:call-template name="createElementAndParaWrap">
            <xsl:with-param name="elementName" select="'captionGroup'" />
        </xsl:call-template>
    </xsl:template>

    
    <xsl:template match="cb">
        <xsl:call-template name="createElementAndParaWrap">
            <xsl:with-param name="elementName" select="'circuitBreakerRef'" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="change">
        <xsl:call-template name="createElementAndParaWrap">
            <xsl:with-param name="elementName" select="'changeInline'" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="ein">
        <xsl:call-template name="createElementAndParaWrap">
            <xsl:with-param name="elementName" select="'functionalItemRef'" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="ftnote">
        <xsl:call-template name="createElementAndParaWrap">
            <xsl:with-param name="elementName" select="'footnote'" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="ftnref">
        <xsl:call-template name="createElementAndParaWrap">
            <xsl:with-param name="elementName" select="'footnoteRef'" />
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template match="indxflag">
        <xsl:call-template name="createElementAndParaWrap">
            <xsl:with-param name="elementName" select="'indexFlag'" />
        </xsl:call-template>
    </xsl:template>

    <!-- 
        <identNumber>
            <manufacturerCode></manufacturerCode>
            <partAndSerialNumber>
                <partNumber id="x000019">PNR132423234</partNumber>
                <serialNumber serialNumberForm="range"/>
            </partAndSerialNumber>
        </identNumber>
        <partAndSerialNumber><partNumber id="x000019">PNR132423234</partNumber></partAndSerialNumber>
    -->
    <xsl:template match="identno">
        <!-- need to check if need to wrapInPara -->
        <xsl:variable name="wrapInPara">
            <xsl:call-template name="checkIfWrap" />
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="$wrapInPara = 'true'">
                <xsl:variable name="paraElementName">
                    <xsl:call-template name="determineParaElementName" />
                </xsl:variable>
                <xsl:element name="{$paraElementName}">
                    <xsl:call-template name="createIdentNumberElement" />
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="createIdentNumberElement" />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="parasigdata">
        <xsl:call-template name="createElementAndParaWrap">
            <xsl:with-param name="elementName" select="'inlineSignificantData'" />
        </xsl:call-template>
    </xsl:template>

    <!-- LOD - need to look at this. -->
    <xsl:template match="refdm">
        <xsl:variable name="wrapInPara">
            <xsl:call-template name="checkIfWrap" />
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="$wrapInPara = 'true'">
                <xsl:variable name="paraElementName">
                    <xsl:call-template name="determineParaElementName" />
                </xsl:variable>
                <xsl:element name="{$paraElementName}">
                    <xsl:call-template name="createDmRefElement" />
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="createDmRefElement" />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template name="createDmRefElement">
        <!-- MANUALLY MODIFIED -->
        <xsl:element xml:space="default" name="dmRef">
            <xsl:apply-templates select="@*"/>
            <xsl:element name="dmRefIdent">
                <!-- ** TODO ** -->
                <!-- Add: identExtension here -->
                <!-- Go straight to AVEE since PM/REFDM has DMC and normal REFDM does not -->
                <xsl:apply-templates select="descendant::avee | descendant::age "/>
                <xsl:apply-templates select="language"/>
                <xsl:apply-templates select="issno"/>
            </xsl:element>
            <xsl:element name="dmRefAddressItems">
                <xsl:apply-templates select="issdate"/>
                <xsl:apply-templates select="dmtitle"/>      
            </xsl:element>
        </xsl:element>
    </xsl:template>


    <xsl:template match="subscrpt">
        <xsl:call-template name="createElementAndParaWrap">
            <xsl:with-param name="elementName" select="'subScript'" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="supscrpt">
        <xsl:call-template name="createElementAndParaWrap">
            <xsl:with-param name="elementName" select="'superScript'" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="verbatim">
        <xsl:call-template name="createElementAndParaWrap">
            <xsl:with-param name="elementName" select="'verbatimText'" />
        </xsl:call-template>
    </xsl:template>


    <xsl:template match="xref">
        <!-- need to check if need to wrapInPara -->
        <xsl:variable name="wrapInPara">
            <xsl:call-template name="checkIfWrap" />
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="$wrapInPara = 'true'">
                <xsl:variable name="elementName">
                    <xsl:call-template name="determineParaElementName" />
                </xsl:variable>
                <xsl:element name="{$elementName}">
                    <xsl:call-template name="createInternalRefElement" />
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="createInternalRefElement" />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="zone">
        <xsl:call-template name="createElementAndParaWrap">
            <xsl:with-param name="elementName" select="'zoneRef'" />
        </xsl:call-template>
    </xsl:template>

    <!-- basically all items that were in the paracon and are now in textElementGroup
         may need to be wrapped in a para element depending on who their parent was in 
         3.0.  This template puts all this logic in a common place.  It will check the
         parent, and if the current node (this could be text) has a parent that now does NOT support mixed content
         then, the current node will be wrapped in a para element
    -->
    <xsl:template name="createElementAndParaWrap">
        <xsl:param name="elementName" />
        <xsl:variable name="wrapInPara">
            <xsl:call-template name="checkIfWrap" />
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="$wrapInPara = 'true'">
                <xsl:variable name="paraElementName">
                    <xsl:call-template name="determineParaElementName" />
                </xsl:variable>
                <xsl:element name="{$paraElementName}">
                    <xsl:call-template name="createElementWithThisName">
                        <xsl:with-param name="elementName" select="$elementName" />
                    </xsl:call-template>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="createElementWithThisName">
                    <xsl:with-param name="elementName" select="$elementName" />
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- creates an element with the name passed in, and applys the templates that
         will copy any attributes and descendant data.
    -->    
    <xsl:template name="createElementWithThisName">
        <xsl:param name="elementName" />
        <xsl:choose>
            <xsl:when test="$elementName != ''">
                <xsl:element name="{$elementName}">
                    <xsl:apply-templates select="@* | node()"/>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="{$elementName}">
                    <xsl:apply-templates select="@* | node()"/>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="createIdentNumberElement">
        <xsl:element name="identNumber">
            <xsl:apply-templates select="@*"/>
      
      <!-- WAS
      <xsl:apply-templates select="mfc"/>
      <xsl:element name="partAndSerialNumber">
        <xsl:apply-templates select="pnr"/>
        <xsl:apply-templates select="serialno"/>
      </xsl:element>
     </xsl:element>
     -->
            <!-- I'm not sure that this code for pnr and serialno is correct.  In fact, I don't
                 believe that it is.  But ignoring for now.  Will just leave as is.
            -->
            <xsl:apply-templates select='mfc'/>
            <xsl:for-each select="pnr | serialno"> 
                <!-- Since pnr and srv can be unlimited in the sequence needs to wrap if appropriately -->
                <xsl:if test="name(.)='pnr' and position()=1">
                    <xsl:text disable-output-escaping="yes">&lt;partAndSerialNumber&gt;</xsl:text>
                </xsl:if>
                <xsl:if test="name(.)='pnr' and position()!=1">
                    <xsl:text disable-output-escaping="yes">&lt;/partAndSerialNumber&gt;
&lt;partAndSerialNumber&gt;</xsl:text>
                </xsl:if>
                <xsl:apply-templates select='.'/>
                <xsl:if test="not(following-sibling::*)">
                    <xsl:text disable-output-escaping="yes">&lt;/partAndSerialNumber&gt;</xsl:text>
                </xsl:if>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>

    <xsl:template name="createInternalRefElement">
        <xsl:element name="internalRef">
            <!-- MODIFIED: Attribute handling split to avoid out of context errors for pretext and posttext messages -->
            <xsl:apply-templates select="@xrefid | @xidtype | @target | @destitle | @xlink:type | @xlink:href | @xlink:show | @xlink:actuate"/>
            <xsl:apply-templates select="@refapplic | @pretext | @postext"/>
            <xsl:apply-templates select="node()"/>
        </xsl:element>
    </xsl:template>


    <!-- 
         centralize how message logging can occur 
    -->
<!--     <xsl:template name="AddLogEntry">
        <xsl:param name="msg" />
        <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
        <xsl:value-of select="inmed-js:addLogEntry( string( $msg ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
        <xsl:message>
            <xsl:value-of select="$msg" />
            <xsl:text>log</xsl:text>
            <xsl:value-of select="$loc" />
            <xsl:value-of select="ancestor-or-self::*[1]/@xid" />
        </xsl:message>
    </xsl:template> -->

    <!-- the question here is whether the current node's parent needs to be wrapped in a para for this
         element to be valid now.  This is because prior to 4.0.1, textElemGroup data was allowed as
         child of some elements.  Now, it appears to be more constrained.
         For descript schema, item, def, and entry had mixed with paracon child
    -->
    <xsl:template name="checkIfWrap">
        <xsl:variable name="parentName">
           <xsl:value-of select="name(..)" />
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="($parentName = 'item') or ($parentName = 'def') or ($parentName = 'entry')">
                <xsl:text>true</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>false</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>



  <xsl:template match="choice">
    <xsl:element name="choice">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="closereqs">
    <xsl:element name="closeRqmts">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="closetxt">
    <xsl:element name="closeRqmts">
      <xsl:choose>
      <xsl:when test="count(child::*) != 0">
        <xsl:apply-templates select="@* | node()"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:element name="reqCondGroup">
          <xsl:element name="noConds"/>
        </xsl:element>
      </xsl:otherwise>
      </xsl:choose>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cmk">
    <xsl:element name="calibrationMarker">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cnorefs">
    <xsl:element name="noReferences">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="collared">
    <xsl:attribute name="collaredCircuitBreakerFlag">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="colspec">
    <xsl:element name="colspec">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="comment">
    <xsl:element name="comment">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="con">
    <xsl:element name="supplyRqmtRef">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

<!--   <xsl:template match="concat">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: concat,  NOW:@stringoperation(concatenate) COMMENT: Now an attribute value</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template> -->

  <xsl:template match="condit">
    <xsl:element name="caseCond">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="condition">
    <xsl:element name="cond">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="conditionlist">
    <xsl:element name="condList">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="conditiontype">
    <xsl:element name="condType">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="conditiontypelist">
    <xsl:element name="condTypeList">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="conduit">
    <xsl:element name="conduit">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="conduits">
    <xsl:element name="conduitGroup">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="conitem">
    <xsl:element name="supplyRqmtSpec">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="conitemalt">
    <xsl:element name="supplyRqmtAlt">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="conitemaltid">
    <xsl:element name="supplyRqmtAltIdent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="conitemid">
    <xsl:element name="supplyRqmtIdent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="conlist">
    <xsl:element name="supplyRqmtRepository">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="connector">
    <xsl:element name="connector">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="connectors">
    <xsl:element name="connectorGroup">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="consupply">
    <xsl:element name="supplyRef">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="consupplygrp">
    <xsl:element name="supplySetGroup">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="consupplyid">
    <xsl:element name="supplyIdent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="consupplyinfo">
    <xsl:element name="supplySpec">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="consupplylist">
    <xsl:element name="supplyRepository">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="consupplyset">
    <xsl:element name="supplySet">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="contact">
    <xsl:element name="contact">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

<!--   <xsl:template match="contactaddr">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: contactaddr,  NOW:businessUnitAddress COMMENT: Not a direct mapping, the information has been restructured -> refer to Table 1 in Transition WP</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template> -->

  <xsl:template match="contactinfo">
    <xsl:element name="contactInfo">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

<!--   <xsl:template match="contacttext">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: contacttext,  NOW:contactPerson COMMENT: Not a direct mapping, the information has been restructured -> refer to Table 1 in Transition WP</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template> -->

  <xsl:template match="container">
    <xsl:element name="container">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="content">
    <xsl:element name="content">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="contextrules">
    <xsl:element name="contextRules">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="copyright">
    <xsl:element name="copyright">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="corig">
    <xsl:element name="commentOriginator">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="crefddn">
    <xsl:element name="ddnRef">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="crefddns">
    <xsl:element name="ddnRefGroup">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="crefdm">
    <xsl:element name="dmRef">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="crefdmls">
    <xsl:element name="dmlRefGroup">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="crefdms">
    <xsl:element name="dmRefGroup">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="crefpm">
    <xsl:element name="pmRef">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="crefpms">
    <xsl:element name="pmRefGroup">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="crefs">
    <xsl:element name="commentRefs">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="crew">
    <xsl:element name="crewMemberGroup">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="crewmem">
    <xsl:element name="crewMember">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="csn">
    <xsl:element name="catalogSeqNumber">
      <xsl:apply-templates select="@*[name() != 'level']"/>
      <xsl:apply-templates select="@level"/>
      <xsl:apply-templates select="node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="csnref">
    <xsl:element name="catalogSeqNumberRef">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

<!--   <xsl:template match="cstatus">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: cstatus,  NOW:identAndStatusSection COMMENT: Parent change -> refer to Table 1 in Transition WP</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template> -->

  <xsl:template match="ctl">
    <xsl:element name="categoryOneContainerLocation">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

<!--   <xsl:template match="ctype">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: ctype,  NOW: COMMENT: Child attribute type moved to ELEMENT:commentCode as ATTRIBUTE:commentType</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template> -->

  <xsl:template match="data">
    <xsl:element name="testParameters">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="datacond">
    <xsl:element name="dataConds">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="datarest">
    <xsl:element name="dataRestrictions">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="ddn">
    <xsl:element name="ddn">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="ddnc">
    <xsl:element name="ddnCode">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

    <xsl:template match="def">
        <xsl:call-template name="createElementWithThisName">
            <xsl:with-param name="elementName" select="'listItemDefinition'" />
        </xsl:call-template>
    <!-- Handled below so now ignore to suppress default template -->
    </xsl:template>

  <!--xsl:template match="def" mode="parent-text-supress"-->
    <!-- MANUAL MODIFICATION -->
    <!-- Change: added mode to allow wrapping within definitionListItem -->
    <!--xsl:element name="listItemDefinition">
      <xsl:apply-templates select="@*"/>
      <xsl:choose>
         <xsl:when test="count(./para) = 0 and count(./note) = 0"-->
           <!-- Only text or no para content -->
           <!--xsl:element name="para">
            <xsl:apply-templates select="node()"/>
           </xsl:element>
         </xsl:when>
         <xsl:otherwise>
            <xsl:apply-templates select="node()"/>
         </xsl:otherwise>
      </xsl:choose>
    </xsl:element>
  </xsl:template-->

  <xsl:template match="term|def" mode="wcn"></xsl:template>


  <xsl:template match="default">
    <xsl:element name="default">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

<!--   <xsl:template match="defined">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: defined,  NOW:@booleanAction=)defined) COMMENT: Now an attribute value</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template> -->

  <xsl:template match="definspec">
    <xsl:element name="inspectionDefinition">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="term|def" mode="wcn">
    <xsl:apply-templates/>
  </xsl:template>

    <xsl:template match="deflist[ancestor::warning or ancestor::caution or ancestor::note]">
        <!-- 
            <attentionRandomList listItemPrefix="pf01">
                <attentionRandomListItem>
                    <attentionListItemPara><emphasis emphasisType="em01">Term</emphasis> Def</attentionListItemPara>
                </attentionRandomListItem>
            </attentionRandomList>
        -->
        <xsl:element name="attentionRandomList">
            <xsl:attribute name="listItemPrefix">pf01</xsl:attribute>
            <xsl:apply-templates select="@*"/>
            <xsl:for-each select="./term">
                <xsl:element name="attentionRandomListItem">
                    <xsl:element name="attentionListItemPara">
                        <xsl:element name="emphasis">
                            <xsl:attribute name="emphasisType">em01</xsl:attribute>
                            <xsl:apply-templates select="@*"/>
                            <xsl:apply-templates select="." mode="wcn"/>
                        </xsl:element>
                        <xsl:text> </xsl:text>
                        <xsl:apply-templates select="./following-sibling::*[1][name()='def']" mode="wcn"/>
                    </xsl:element>
                </xsl:element>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>

    <xsl:template match="deflist">
        <!-- 
            <definitionList>
                <definitionListItem>
                    <listItemTerm>UP</listItemTerm>
                    <listItemDefinition><para>-180 kts</para></listItemDefinition>
                </definitionListItem>
           </definitionList>
        -->
        <xsl:element name="definitionList">
            <xsl:apply-templates select="@*" />
            <xsl:for-each select="term">
                <xsl:element name="definitionListItem">
                    <xsl:apply-templates select="." />
                    <xsl:apply-templates select="following-sibling::def[1]" />
                </xsl:element>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>

  <xsl:template match="deftask">
    <xsl:element name="taskDefinition">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="delivlst">
    <xsl:element name="deliveryList">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="delruitem">
    <xsl:element name="detectedLruItem">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="desc">
    <xsl:element name="itemDescr">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="descacrw">
    <xsl:element name="descrCrew">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="describe">
    <!-- MANUALLY MODIFIED -->
    <!-- Changed to detect 2.2 faults structures -->
    <xsl:choose>
      <xsl:when test="ancestor::afi and not(ancestor::afi-proc)">
        <!-- SUPRESS: This is pre 2.3, and handled in fault  -->
      </xsl:when>
      <xsl:otherwise>
        <xsl:element name="faultDescr">
          <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <xsl:template match="describe" mode="pre23">
    <!-- Mode pre23 called only for pre 2.3 faults -->
    <xsl:element name="faultDescr">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="descript">
    <xsl:element name="description">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="desruitem">
    <xsl:element name="detectedSruItem">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="destruct">
    <xsl:element name="dataDestruction">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="detail-fdesc">
    <xsl:element name="detailedFaultDescr">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="detect">
    <xsl:element name="detectionInfo">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dfault">
    <xsl:element name="detectedFault">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dfl">
    <xsl:element name="descrForLocation">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dfp">
    <xsl:element name="descrForPart">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="diagnost">
    <xsl:element name="diagnosticProcess">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dialog">
    <xsl:element name="dialog">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dialog-alt">
    <xsl:element name="dialogAlt">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dialog-group">
    <xsl:element name="dialogGroup">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="disclose">
    <xsl:element name="dataDisclosure">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

<!--   <xsl:template match="disjoint">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: disjoint,  NOW:@setoperation(disjoint) COMMENT: Now an attribute value</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template> -->

  <xsl:template match="disolate">
    <xsl:element name="isolateDetectedFault">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dispaddr">
    <xsl:element name="dispatchAddress">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dispfrom">
    <xsl:element name="dispatchFrom">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="displaytext">
    <xsl:element name="displayText">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dispto">
    <xsl:element name="dispatchTo">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="distrib">
    <xsl:element name="dataDistribution">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

<!--   <xsl:template match="divide">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: divide,  NOW:@numberoperation(divide) COMMENT: Now an attribute value</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template> -->

  <xsl:template match="dmaddres">
    <!-- MANUAL MODIFICATION -->
    <!-- Change: Added dmIdent and dmAddressItems wrappers -->
    <xsl:element name="dmAddress">
      <xsl:apply-templates select="@*"/>
      <xsl:element name="dmIdent">
        <!-- ** TODO ** -->
        <!-- Add: identExtension here -->
        <xsl:apply-templates select="dmc"/>
        <xsl:choose>
          <xsl:when test="./language">
            <xsl:apply-templates select="language"/>
          </xsl:when>
          <xsl:otherwise><language countryIsoCode="EN" languageIsoCode="us"/></xsl:otherwise>
        </xsl:choose>
        <xsl:apply-templates select="issno"/>
      </xsl:element>
      <xsl:element name="dmAddressItems">
        <xsl:apply-templates select="issdate"/>
        <xsl:apply-templates select="dmtitle"/>      
      </xsl:element>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dmc">
    <!-- dmCode will be created in avee to meet various content models -->
    <xsl:apply-templates select="@* | node()"/>
  </xsl:template>

  <xsl:template match="dmcextension">
    <xsl:element name="identExtension">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dm-else-seq">
    <xsl:element name="dmElseSeq">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dmentry">
    <xsl:element name="dmEntry">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dm-if">
    <xsl:element name="dmIf">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dml">
    <xsl:element name="dml">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dmlc">
    <xsl:element name="dmlCode">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dm-loop">
    <xsl:element name="dmLoop">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dmlref">
    <xsl:element name="dmlRef">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

<!--   <xsl:template match="dmltype">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: dmltype,  NOW: COMMENT: Child attribute type moved to ELEMENT:dmlCode as ATTRIBUTE:dmlType</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template> -->

  <xsl:template match="dm-node">
    <xsl:element name="dmNode">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dm-node-alt">
    <xsl:element name="dmNodeAlt">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dm-seq">
    <xsl:element name="dmSeq">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dm-then-seq">
    <xsl:element name="dmThenSeq">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dmtitle">
    <xsl:element name="dmTitle">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="docincorp">
    <xsl:element name="documentIncorporation">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="drill">
    <xsl:element name="crewDrill">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.accdopl">
    <xsl:element name="descrAccessDoorOrPanel">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.accessory">
    <xsl:element name="descrAccessory">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.accpnr">
    <xsl:element name="descrAccessoryPartNumber">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.altpnr">
    <xsl:element name="descrAltPartNumber">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.amperage">
    <xsl:element name="descrAmperage">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.assy">
    <xsl:element name="descrAssy">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.attenuation">
    <xsl:element name="descrAttenuation">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.block">
    <xsl:element name="descrBlockGroupingValue">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.ccount">
    <xsl:element name="descrContactCount">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.cdia">
    <xsl:element name="descrContactDiameter">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.circode">
    <xsl:element name="descrCircuitIdent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.clc">
    <xsl:element name="descrConnectionListClass">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.coax">
    <xsl:element name="descrCoaxialCableFlag">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.colour">
    <xsl:element name="descrWireColor">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.conduit">
    <xsl:element name="descrConduit">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.connector">
    <xsl:element name="descrConnector">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.contact">
    <xsl:element name="descrContact">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.core">
    <xsl:element name="descrNumberOfCores">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.csize">
    <xsl:element name="descrContactSize">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.econtact">
    <xsl:element name="descrElectricalContact">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.elecequip">
    <xsl:element name="descrElectricalEquip">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.emc-code">
    <xsl:element name="descrEmcCode">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.equdescref">
    <xsl:element name="descrEquipDescrRef">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.fdescref">
    <xsl:element name="descrFunctionalDescrRef">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.feedthru">
    <xsl:element name="descrFeedThru">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.fin">
    <xsl:element name="descrFinishingInfo">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.freq">
    <xsl:element name="descrFrequency">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.groupcode">
    <xsl:element name="descrGroupCode">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.harnenv">
    <xsl:element name="descrHarnessEnvironment">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.harness">
    <xsl:element name="descrHarness">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.harnid">
    <xsl:element name="descrHarnessIdent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.harnissue">
    <xsl:element name="descrHarnessVariantIssue">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.harnvar">
    <xsl:element name="descrHarnessVariantIdent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.ident-sleeve">
    <xsl:element name="descrIdentSleeve">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.illref">
    <xsl:element name="descrIllustrationRef">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.impedance">
    <xsl:element name="descrImpedance">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.instloc">
    <xsl:element name="descrInstallationLocation">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.length">
    <xsl:element name="descrLength">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.mass">
    <xsl:element name="descrMass">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.mat">
    <xsl:element name="descrMaterial">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.maxd">
    <xsl:element name="descrMaxDiameter">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.maxh">
    <xsl:element name="descrMaxHarnessSize">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.maxposition">
    <xsl:element name="descrMaxMountingPositions">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.maxt">
    <xsl:element name="descrMaxTemperature">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.mfc">
    <xsl:element name="descrManufacturerCode">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.mind">
    <xsl:element name="descrMinDiameter">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.minh">
    <xsl:element name="descrMinHarnessSize">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.mint">
    <xsl:element name="descrMinTemperature">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.module">
    <xsl:element name="descrTerminationModuleGroupingValue">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.netanacode">
    <xsl:element name="descrNetworkAnalysisCode">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.nhassy">
    <xsl:element name="descrNextHigherAssy">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.elecequip//dsc.nomenc">
    <xsl:element name="descrEquipName">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.harnes//dsc.nomenc">
    <xsl:element name="descrHarnessName">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.orientation">
    <xsl:element name="descrOrientation">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.outdia">
    <xsl:element name="descrOuterDiameter">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.outjackcol">
    <xsl:element name="descrOuterJacketColor">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.pnr">
    <xsl:element name="descrPartNumber">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.posnhassy">
    <xsl:element name="descrPositionOnNextHigherAssy">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.pre">
    <xsl:element name="descrPreparationInfo">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.protect">
    <xsl:element name="descrSurfaceProtection">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.qty">
    <xsl:element name="descrReqQuantity">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.rack">
    <xsl:element name="descrRack">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.res">
    <xsl:element name="descrResistance">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.restriction">
    <xsl:element name="descrRestriction">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.rfd">
    <xsl:element name="descrReferenceDesignator">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.routing">
    <xsl:element name="descrRouting">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.rpc">
    <xsl:element name="descrResponsiblePartnerCompany">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.sbc">
    <xsl:element name="descrSystemBreakdownCode">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.screen">
    <xsl:element name="descrScreen">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.screencount">
    <xsl:element name="descrScreenCount">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.secid">
    <xsl:element name="descrSectionIdent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.shrink-sleeve">
    <xsl:element name="descrShrinkSleeve">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.shunt">
    <xsl:element name="descrShuntGroupingValue">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.sibplugid">
    <xsl:element name="descrSiblingPlugIdent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.signal">
    <xsl:element name="descrSignalInfo">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.size">
    <xsl:element name="descrSize">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.sleeve">
    <xsl:element name="descrSleeve">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.solder-sleeve">
    <xsl:element name="descrSolderSleeve">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.statedes">
    <xsl:element name="descrElectricalStateDescr">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.stdparts">
    <xsl:element name="descrStandardPartGroup">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.sterm">
    <xsl:element name="descrSpecialTerminal">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.tminus">
    <xsl:element name="descrThermoCoupleMinus">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.tplus">
    <xsl:element name="descrThermoCouplePlus">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.triax">
    <xsl:element name="descrTriaxialCableFlag">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.trl">
    <xsl:element name="descrTransverseLink">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.twist">
    <xsl:element name="descrTwist">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.voltage">
    <xsl:element name="descrVoltage">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.vpart">
    <xsl:element name="descrDistributionPart">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.wallthk">
    <xsl:element name="descrWallThickness">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.wicircode">
    <xsl:element name="descrWireInfoCircuitIdent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.wireconcode">
    <xsl:element name="descrWireConnectionCode">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.wiregauge">
    <xsl:element name="descrWireGauge">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.wire-mat">
    <xsl:element name="descrWireMaterial">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.wireno">
    <xsl:element name="descrWireNumber">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.wireroute">
    <xsl:element name="descrWireRoute">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.wires">
    <xsl:element name="descrWire">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.wireseqno">
    <xsl:element name="descrWireSeqNumber">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.wiretype">
    <xsl:element name="descrWireType">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc.wisecid">
    <xsl:element name="descrWireInfoSectionIdent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="ecstate">
    <xsl:element name="electricalEquipState">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="eeconnection">
    <xsl:element name="electricalEquipConnection">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="efy">
    <xsl:element name="effectivity">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>


  <xsl:template match="einalt">
    <xsl:element name="functionalItemAlt">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="einid">
    <xsl:element name="functionalItemIdent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="eininfo">
    <xsl:element name="functionalItemSpec">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="einlist">
    <xsl:element name="functionalItemRepository">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="einref">
    <xsl:element name="functionalItemRefGroup">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="elecequip">
    <xsl:element name="electricalEquip">
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="rfd"/>
      <xsl:apply-templates select="pnr"/>
      <xsl:apply-templates select="altids"/>
      <xsl:apply-templates select="assyinstr"/>
      <xsl:apply-templates select="maxposition"/>
      <xsl:apply-templates select="sbc"/>
      <xsl:apply-templates select="trl"/>
      <xsl:apply-templates select="clc"/>
      <xsl:apply-templates select="elogic"/>
      <xsl:apply-templates select="rpc"/>
      <xsl:apply-templates select="nomenc"/>
      <xsl:apply-templates select="qty"/>
      <xsl:element name="installationInfo">
        <xsl:apply-templates select="instloc"/>
        <xsl:apply-templates select="sibplugid"/>
        <xsl:apply-templates select="accdopl"/>
        <xsl:apply-templates select="nhassy"/>
        <xsl:apply-templates select="posnhassy"/>
      </xsl:element>      
      <xsl:apply-templates select="equdescref"/>
      <xsl:apply-templates select="fdescref"/>
      <xsl:apply-templates select="illref"/>
      <xsl:apply-templates select="applics"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="elecequips">
    <xsl:element name="electricalEquipGroup">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="elecpotential">
    <xsl:element name="electricalPotential">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="elecpwr">
    <!-- MODIFIED: Converted elecpwer into a required condition only if explictally required or not required -->
    <!-- FUTURE: Text is inserted.  Allow the output to be configurable for language and project-->
    <xsl:if test="@status='yes' or @status='no'">
    <xsl:element name="reqCondNoRef">
      <xsl:element name="reqCond">
        <xsl:choose>
          <xsl:when test="@status='yes'">
            <xsl:text>The system required to have </xsl:text>
          </xsl:when>
          <xsl:when test="@status='no'">
            <xsl:text>The system prohibited from having </xsl:text>
          </xsl:when>
        </xsl:choose>
        <xsl:choose>
          <xsl:when test="@power='engine'">
            <xsl:text>electrical power supplied by the engine.</xsl:text>
          </xsl:when>
          <xsl:when test="@power='apu'">
            <xsl:text>electrical power supplied by the APU.</xsl:text>
          </xsl:when>
          <xsl:when test="@power='internal'">
            <xsl:text>internal electrical power supplied.</xsl:text>
          </xsl:when>
          <xsl:when test="@power='external'">
            <xsl:text>external electrical power supplied.</xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <!-- If power is "indifferent" or "notapplic"  -->
            <xsl:text>electrical power supplied.</xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:element>
    </xsl:element>
    </xsl:if>
  </xsl:template>

  <xsl:template match="elogic">
    <xsl:element name="electricalLogic">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="elseif">
    <xsl:element name="elseIf">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>
<!-- 
  <xsl:template match="empty">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: empty,  NOW:@setAction=)empty) COMMENT: Now an attribute value for set functions</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template> -->

<!--   <xsl:template match="empty">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: empty,  NOW:@stringAction=)empty) COMMENT: Now an attribute value for string functions</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template> -->

  <xsl:template match="enable">
    <xsl:element name="enabledState">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="endmattr">
    <xsl:element name="endMatter">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="enterprise">
    <xsl:element name="enterprise">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

<!--   <xsl:template match="enterprise">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: enterprise,  NOW:enterpriseSpec COMMENT: Not a direct mapping, the information has been restructured -> refer to Table 1 in Transition WP; New SUBELEMENT:businessUnit added to structure</xsl:variable>
  <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template> -->
<!-- 
  <xsl:template match="entfield">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">NO CONVERSION: Element entfield has been removed from S1000D Issue 4.0 and cannot be converted.</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template> -->

  <xsl:template match="entry">
    <!-- MANUAL MODIFICATION -->
    <!-- Change: wrapped in para do to parsing errors in Epic -->
    <xsl:element name="entry">
    <!--
       <xsl:apply-templates select="@*"/>
      <xsl:choose>
         <xsl:when test="count(./para) = 0 and count(./note) = 0">
           <xsl:element name="para">
            <xsl:apply-templates select="node()"/>
           </xsl:element>
         </xsl:when>
         <xsl:otherwise>
            <xsl:apply-templates select="node()"/>
         </xsl:otherwise>
      </xsl:choose>
     -->
      <xsl:apply-templates select="@* | node()"/>   
    </xsl:element>
  </xsl:template>

  <xsl:template match="enum">
    <xsl:element name="enumeration">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

<!--   <xsl:template match="eq">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: eq,  NOW:@booleanoperation(equal) COMMENT: Now an attribute value for Boolean operations</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template>

  <xsl:template match="eq">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: eq,  NOW:@numberoperation(equal) COMMENT: Now an attribute value for integer and float operations</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template>

  <xsl:template match="eq">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: eq,  NOW:@setoperation(equal) COMMENT: Now an attribute value for set operations</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template>

  <xsl:template match="eq">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: eq,  NOW:@stringoperation(equal) COMMENT: Now an attribute value for string operations</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template> -->

  <xsl:template match="equdescref">
    <xsl:element name="equipDescrRef">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="equip">
    <xsl:element name="equipGroup">
      <xsl:element name="equip">
        <xsl:apply-templates select="@* | node()"/>
      </xsl:element>
    </xsl:element>
  </xsl:template>

  <!-- TODO: FIX THIS -->
  <!--xsl:template match="esttime"/-->
  <xsl:template match="esttime" mode="wrap-reqpers">
    <!-- MANUAL MODIFICATION -->
    <!-- Change: added mode so this tag is only processed with person -->
   <estimatedTime>
     <xsl:attribute name="unitOfMeasure">
       <xsl:value-of select="translate(. , '0123456789., ', '')"/>
     </xsl:attribute>
     <xsl:value-of select="translate(. , 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ ', '')"/>
   </estimatedTime>


    <!--xsl:element name="estimatedTime">
      <xsl:apply-templates select="@*"/>
      <xsl:call-template name="get-set-UOM"/>
    </xsl:element-->
    
  </xsl:template>

<xsl:template match='esttime'>
   <!-- MANUAL MODIFICATION -->
   <!-- Change: discard if processing outside of reqpers -->
</xsl:template>

  <xsl:template match="etops">
    <xsl:attribute name="etopsFlag">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="evaluate">
    <xsl:element name="evaluate">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="expcont">
    <!-- 
    <exportControl>
      <exportRegistrationStmt>
      <simplePara></simplePara>
      </exportRegistrationStmt>
    </exportControl>
    -->
    <xsl:element name="exportControl">
      <xsl:element name="exportRegistrationStmt">
        <xsl:element name="simplePara">
          <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
      </xsl:element>
    </xsl:element>
  </xsl:template>

<!--   <xsl:template match="exponent">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: exponent,  NOW:@numberoperation(exponent) COMMENT: Now an attribute value</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template> -->

  <xsl:template match="expregcode">
    <xsl:element name="exportRegistrationCode">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="expression">
    <xsl:element name="expression">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="expstatement">
    <xsl:element name="exportRegistrationStmt">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="extapp">
    <xsl:element name="externalApplication">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="fastener">
    <xsl:element name="fastener">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="fault">
    <!-- MANUALLY MODIFIED -->
    <!-- Changed to detect 2.2 faults structures -->
    <xsl:choose>
      <xsl:when test="ancestor::afi and not(ancestor::afi-proc)">
        <!-- This is a pre 2.3 AFI must be followed by describe, and isoproc -->
        <xsl:element name="faultIsolationProcedure">
          <xsl:element name="fault">
            <xsl:apply-templates select="@* | node()"/>
          </xsl:element>
          <xsl:apply-templates select="following-sibling::describe[1]" mode="pre23"/>
          <xsl:apply-templates select="following-sibling::isoproc[1]" mode="pre23"/>
        </xsl:element>
      </xsl:when>
      <xsl:otherwise>
        <xsl:element name="fault">
          <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="fbasicdesc">
    <xsl:element name="faultMessageBody">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="fcondition">
    <xsl:element name="faultCond">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="fcposn">
    <!-- MODIFIED: Converted fcposn into a required condition only if explictally required -->
    <!-- FUTURE: Text is inserted.  Allow the output to be configurable for language and project-->
    <xsl:if test="@status='yes'">
    <xsl:element name="reqCondNoRef">
      <xsl:element name="reqCond">
        <xsl:choose>
          <xsl:when test="@status='yes'">
            <xsl:text>The system required to have </xsl:text>
          </xsl:when>
          <xsl:when test="@status='no'">
            <!-- nonsense option -->
            <xsl:text>The system prohibited from having </xsl:text>
          </xsl:when>
        </xsl:choose>
        <xsl:choose>
          <xsl:when test="@power='engine'">
            <!-- nonsense option -->
            <xsl:text>specific positioning of the flight controls.</xsl:text>
          </xsl:when>
          <xsl:when test="@power='apu'">
            <!-- nonsense option -->
            <xsl:text>specific positioning of the flight controls.</xsl:text>
          </xsl:when>
          <xsl:when test="@power='internal'">
            <!-- nonsense option -->
            <xsl:text>specific positioning of the flight controls.</xsl:text>
          </xsl:when>
          <xsl:when test="@power='external'">
            <!-- nonsense option -->
            <xsl:text>specific positioning of the flight controls.</xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <!-- If power is "indifferent" or "notapplic"  -->
            <xsl:text>specific positioning of the flight controls.</xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:element>
    </xsl:element>
    </xsl:if>
  </xsl:template>

  <xsl:template match="fdescref">
    <xsl:element name="functionalDescrRef">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="fec">
    <xsl:element name="sourceType">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="feedthru">
    <xsl:element name="feedThru">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="fequipment">
    <xsl:element name="faultEquip">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="figure">
    <xsl:element name="figure">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="fillin">
    <xsl:element name="userEntry">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="fin">
    <xsl:element name="finishingInfo">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="findication">
    <xsl:element name="faultMessageIndication">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="firstver">
    <xsl:element name="firstVerification">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

<!--   <xsl:template match="float">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: float,  NOW:@numberAction=)float) COMMENT: Now an attribute value</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template> -->

  <xsl:template match="foldout">
    <xsl:element name="foldout">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="frc">
    <xsl:element name="crewRefCard">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="freq">
    <xsl:element name="frequency">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="freqatt">
    <xsl:element name="frequencyAttenuation">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="freqchar">
    <xsl:element name="frequencyCharacteristics">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="from">
    <xsl:element name="limitRangeFrom">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="fromequip">
    <xsl:element name="fromEquip">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="fstqty">
    <xsl:element name="fastenerQuantity">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="fsttype">
    <xsl:element name="fastenerType">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="ftc">
    <xsl:element name="fitmentCode">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="fuel">
    <!-- MODIFIED: Converted fuel into a required condition only if explictally required or not required -->
    <!-- FUTURE: Text is inserted.  Allow the output to be configurable for language and project-->
    <xsl:if test="@status='yes' or @status='no'">
    <xsl:element name="reqCondNoRef">
      <xsl:element name="reqCond">
        <xsl:choose>
          <xsl:when test="@status='yes'">
            <xsl:text>The system required to have </xsl:text>
          </xsl:when>
          <xsl:when test="@status='no'">
            <xsl:text>The system prohibited from having </xsl:text>
          </xsl:when>
        </xsl:choose>
        <xsl:choose>
          <xsl:when test="@power='engine'">
            <!-- nonsense option -->
            <xsl:text>fuel supplied by the engine.</xsl:text>
          </xsl:when>
            <!-- nonsense option -->
          <xsl:when test="@power='apu'">
            <xsl:text>fuel supplied by the APU.</xsl:text>
          </xsl:when>
          <xsl:when test="@power='internal'">
            <xsl:text>an internal fuel supply.</xsl:text>
          </xsl:when>
          <xsl:when test="@power='external'">
            <xsl:text>an external fuel supply.</xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <!-- If power is "indifferent" or "notapplic"  -->
            <xsl:text>a fuel supply.</xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:element>
    </xsl:element>
    </xsl:if>
  </xsl:template>

<!--   <xsl:template match="ge">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: ge,  NOW:@numberoperation(greaterThanOrEqual) COMMENT: Now an attribute value for integer and float operations</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template>

  <xsl:template match="ge">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: ge,  NOW:@stringoperation(greaterThanOrEqual) COMMENT: Now an attribute value for string operations</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template>

  <xsl:template match="gem">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: gem,  NOW:@deliveredSpecificationFlag COMMENT: Now an attribute on toolAlt</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template> -->

  <xsl:template match="graphic">
    <xsl:element name="graphic">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

<!--   <xsl:template match="gt">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: gt,  NOW:@numberoperation(greaterThan) COMMENT: Now an attribute value for integer and float operations</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template>

  <xsl:template match="gt">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: gt,  NOW:@stringoperation(greaterThan) COMMENT: Now an attribute value for string operations</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template>
 -->
  <xsl:template match="handling">
    <xsl:element name="dataHandling">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="harnenv">
    <xsl:element name="harnessEnvironment">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="harness">
    <xsl:element name="harness">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="harnesses">
    <xsl:element name="harnessGroup">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="harnid">
    <xsl:element name="harnessIdent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="harninfo">
    <xsl:element name="harnessInfo">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="harnsize">
    <xsl:element name="harnessSize">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

<!--   <xsl:template match="hazd">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: hazd,  NOW:@hazardousFlag COMMENT: Now an attribute on techData and supplySpec</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template> -->

  <xsl:template match="hotspot">
    <xsl:element name="hotspot">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="hydpwr">
    <!-- MODIFIED: Converted hydpwr into a required condition only if explictally required -->
    <!-- FUTURE: Text is inserted.  Allow the output to be configurable for language and project-->
    <xsl:if test="@status='yes' or @status='no'">
    <xsl:element name="reqCondNoRef">
      <xsl:element name="reqCond">
        <xsl:choose>
          <xsl:when test="@status='yes'">
            <xsl:text>The system required to have </xsl:text>
          </xsl:when>
          <xsl:when test="@status='no'">
            <xsl:text>The system prohibited from having </xsl:text>
          </xsl:when>
        </xsl:choose>
        <xsl:choose>
          <xsl:when test="@power='engine'">
            <!-- nonsense option -->
            <xsl:text>hydraulic power supplied by the engine.</xsl:text>
          </xsl:when>
          <xsl:when test="@power='apu'">
            <!-- nonsense option -->
            <xsl:text>hydraulic power supplied by the APU.</xsl:text>
          </xsl:when>
          <xsl:when test="@power='internal'">
=            <xsl:text>internal hydraulic power supplied.</xsl:text>
          </xsl:when>
          <xsl:when test="@power='external'">
            <xsl:text>external hydraulic power supplied.</xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <!-- If power is "indifferent" or "notapplic"  -->
            <xsl:text>hydraulic power supplied.</xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:element>
    </xsl:element>
    </xsl:if>
  </xsl:template>

  <xsl:template match="ics">
    <xsl:element name="incorporationStatus">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="ict">
    <xsl:element name="replacementCond">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="icy">
    <xsl:element name="interchangeability">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="ident-sleeve">
    <xsl:element name="identSleeve">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="ident-sleeves">
    <xsl:element name="identSleeveGroup">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

<!--   <xsl:template match="idivide">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: idivide,  NOW:@numberOperation=""integerDivide"" COMMENT: Now an attribute value</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template> -->

  <xsl:template match="idstatus">
    <xsl:element name="identAndStatusSection">
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="dmaddres|status|pmaddres|pmstatus"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="if">
    <xsl:element name="if">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="ifault">
    <xsl:element name="isolatedFault">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="illref">
    <xsl:element name="illustrationRef">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="ils">
    <xsl:element name="ilsNumber">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="impedance">
    <xsl:element name="impedance">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="incorporation">
    <xsl:element name="incorporation">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="index">
    <xsl:element name="subStringFunction">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="inform">
    <xsl:element name="restrictionInfo">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="initialize">
    <xsl:element name="initialize">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="inline">
    <xsl:element name="productConfiguration">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="inlineapplics">
    <xsl:element name="referencedApplicGroup">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="inspection">
    <xsl:element name="inspection">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="instinfo">
    <xsl:element name="installationInfo">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="instloc">
    <xsl:element name="installationLocation">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="instruct">
    <xsl:element name="restrictionInstructions">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

<!--   <xsl:template match="intersect">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: intersect,  NOW:@setOperation=""intersection"" COMMENT: Now an attribute value</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template> -->

  <xsl:template match="ipc">
    <xsl:element name="illustratedPartsCatalog">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="ipp">
    <xsl:element name="initialProvisioningProject">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="ippref">
    <xsl:element name="initialProvisioningProjectRef">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="isn">
    <xsl:element name="itemSequenceNumber">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="isoend">
    <xsl:element name="isolationProcedureEnd">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="isolate">
    <xsl:element name="isolationInfo">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="isolatep">
    <xsl:element name="isolationMainProcedure">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="isoproc">
    <!-- MANUALLY MODIFIED -->
    <!-- Changed to detect 2.2 faults structures -->
    <xsl:choose>
      <xsl:when test="ancestor::afi and not(ancestor::afi-proc)">
        <!-- SUPRESS: This is pre 2.3, and handled in fault  -->
      </xsl:when>
      <xsl:otherwise>  
        <xsl:element name="isolationProcedure">
          <xsl:apply-templates select="@* | node()"/>
          <xsl:if test="not(./closetxt)">
            <xsl:element name="closeRqmts">
              <xsl:element name="reqCondGroup">
                <xsl:element name="noConds"/>
              </xsl:element>
            </xsl:element>
          </xsl:if>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="isoproc" mode="pre23">
    <!-- Mode pre23 called only for pre 2.3 faults -->
    <xsl:element name="isolationProcedure">
      <xsl:apply-templates select="@* | node()"/>
      <xsl:if test="not(./closetxt)">
        <xsl:element name="closeRqmts">
          <xsl:element name="reqCondGroup">
            <xsl:element name="noConds"/>
          </xsl:element>
        </xsl:element>
      </xsl:if>
    </xsl:element>
  </xsl:template>

  <xsl:template match="isostep">
    <xsl:element name="isolationStep">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="issdate">
    <xsl:element name="issueDate">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="issno">
    <!-- MANUAL MODIFICATION -->
    <!-- Change: Add inwork if missing -->
    <xsl:element name="issueInfo">
      <xsl:apply-templates select="@* | node()"/>
      <xsl:if test="not(@inwork)">
         <xsl:attribute name="inWork">
            <xsl:text>00</xsl:text>
         </xsl:attribute>
      </xsl:if>
    </xsl:element>
  </xsl:template>
   
  
  
  
    <xsl:template match="item">
        <!-- the grand parent element is what element this should be -->
        <xsl:variable name="parentElement">
            <xsl:value-of select="name(..)" />
        </xsl:variable>
        <xsl:variable name="ancestorWCN">
            <xsl:call-template name="checkAncestorWCN" />
        </xsl:variable>
        <xsl:variable name="elementName">
            <xsl:choose>
                <xsl:when test="$ancestorWCN = 'false'">
                    <xsl:text>listItem</xsl:text>
                </xsl:when>
                <xsl:when test="$parentElement = 'randlist'">
                    <xsl:text>attentionRandomListItem</xsl:text>
                </xsl:when>
                <xsl:when test="$parentElement = 'seqlist'">
                    <xsl:text>attentionSequentialListItem</xsl:text>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="node()">
                <xsl:call-template name="createElementWithThisName">
                    <xsl:with-param name="elementName" select="$elementName" />
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="createElementWithThisName">
                    <xsl:with-param name="elementName" select="$elementName" />
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
  
    <xsl:template name="checkAncestorWCN">
        <xsl:choose>
            <xsl:when test="ancestor::warning or ancestor::caution or ancestor::note">
                <xsl:text>true</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>false</xsl:text>
            </xsl:otherwise> 
        </xsl:choose>
    </xsl:template>

  <xsl:template match="jacked">
    <!-- MODIFIED: Converted jacked into a required condition only if explictally required -->
    <!-- FUTURE: Text is inserted.  Allow the output to be configurable for language and project-->
    <xsl:if test="@status='yes' or @status='no'">
    <xsl:element name="reqCondNoRef">
      <xsl:element name="reqCond">
        <xsl:choose>
          <xsl:when test="@status='yes'">
            <xsl:text>The system required to be </xsl:text>
          </xsl:when>
          <xsl:when test="@status='no'">
            <xsl:text>The system prohibited from being </xsl:text>
          </xsl:when>
        </xsl:choose>
        <xsl:choose>
          <xsl:when test="@power='engine'">
            <!-- nonsense option -->
            <xsl:text>in a raised or jacked position.</xsl:text>
          </xsl:when>
          <xsl:when test="@power='apu'">
            <!-- nonsense option -->
            <xsl:text>in a raised or jacked position.</xsl:text>
          </xsl:when>
          <xsl:when test="@power='internal'">
            <xsl:text>in a raised or jacked position.</xsl:text>
          </xsl:when>
          <xsl:when test="@power='external'">
            <xsl:text>in a raised or jacked position.</xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <!-- If power is "indifferent" or "notapplic"  -->
            <xsl:text>in a raised or jacked position.</xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:element>
    </xsl:element>
    </xsl:if>
  </xsl:template>

  <xsl:template match="kwd">
    <xsl:element name="partKeyword">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="language">
    <xsl:element name="language">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

<!--   <xsl:template match="le">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: le,  NOW:@numberoperation(lessThanOrEqual) COMMENT: Now an attribute value for integer and float operations</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template>

  <xsl:template match="le">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: le,  NOW:@stringoperation(lessThanOrEqual) COMMENT: Now an attribute value for string operations</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template>
 -->
  <xsl:template match="legend">
    <xsl:element name="legend">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="length">
    <xsl:element name="length">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="lfm">
    <xsl:element name="localFabricationMaterial">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

<!--   <xsl:template match="limit">
    <xsl:element name="limit">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
    <xsl:if test="@typex='ev'">
      <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
      <xsl:variable name="log">WARNING: @typex=ev is no longed allowed, converted to @limitTypeValue=oc</xsl:variable>
      <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
    </xsl:if>
  </xsl:template> -->

  <xsl:template match="limittype">
    <xsl:element name="limitType">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="limrange">
    <xsl:element name="limitRange">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="locandrep">
    <xsl:element name="locateAndRepair">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="location">
    <xsl:element name="location">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="lrlruitem">
    <xsl:element name="locateAndRepairLruItem">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="lrsruitem">
    <xsl:element name="locateAndRepairSruItem">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="lru">
    <xsl:element name="lru">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="lruitem">
    <xsl:element name="lruItem">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

<!--   <xsl:template match="lt">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: lt,  NOW:@numberoperation(lessThan) COMMENT: Now an attribute value for integer and float operations</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template>

  <xsl:template match="lt">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: lt,  NOW:@stringoperation(lessThan) COMMENT: Now an attribute value for string operations</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template> -->

  <xsl:template match="mainfunc">
    <xsl:element name="mainProcedure">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="mass">
    <xsl:element name="mass">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="maxd">
    <xsl:element name="maxDiameter">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="maxh">
    <xsl:element name="maxHarnessSize">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="maxt">
    <xsl:element name="maxTemperature">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="media">
    <xsl:element name="pubMedia">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="mediaid">
    <xsl:element name="mediaIdent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

<!--   <xsl:template match="member">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: member,  NOW:@setoperation(member) COMMENT: Now an attribute value</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template> -->

  <xsl:template match="menu">
    <xsl:element name="menu">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="menuchoice">
    <xsl:element name="menuChoice">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="message">
    <xsl:element name="message">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="message-alt">
    <xsl:element name="messageAlt">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="mfc">
    <xsl:element name="manufacturerCode">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="mfm">
    <xsl:element name="selectOrManufacture">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="mind">
    <xsl:element name="minDiameter">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="minh">
    <xsl:element name="minHarnessSize">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="mint">
    <xsl:element name="minTemperature">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

 <!--  <xsl:template match="minus">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: minus,  NOW:@numberoperation(minus) COMMENT: Now an attribute value</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template> -->

  <xsl:template match="mod">
    <xsl:element name="modification">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

<!--   <xsl:template match="modulus">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: modulus,  NOW:@numberoperation(modulus) COMMENT: Now an attribute value</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template> -->

  <xsl:template match="monitored">
    <xsl:attribute name="monitoredFlag">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="mov">
    <xsl:element name="modelVersion">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="msgdesc">
    <xsl:element name="bitMessage">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="msg-wmlf-desc">
    <xsl:element name="basicCorrelatedFaults">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="multimedia">
    <xsl:element name="multimedia">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="multimediaobject">
    <xsl:element name="multimediaObject">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="n2d">
    <xsl:element name="genericPartDataGroup">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="n2ddata">
    <xsl:element name="genericPartData">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="nature">
    <xsl:attribute name="normativeComponentFlag">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

<!--   <xsl:template match="ne">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: ne,  NOW:@booleanoperation(notEqual) COMMENT: Now an attribute value for Boolean operations</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template>

  <xsl:template match="ne">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: ne,  NOW:@numberoperation(notEqual) COMMENT: Now an attribute value for integer and float operations</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template>

  <xsl:template match="ne">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: ne,  NOW:@setoperation(notEqual) COMMENT: Now an attribute value for set operations</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template>

  <xsl:template match="ne">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: ne,  NOW:@stringoperation(notEqual) COMMENT: Now an attribute value for string operations</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template>

  <xsl:template match="neg">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: neg,  NOW:@numberAction=)negative) COMMENT: Now an attribute value</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template>
 -->
  <xsl:template match="nhassy">
    <xsl:element name="nextHigherAssy">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="nil">
    <xsl:element name="notIllustrated">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="no">
    <xsl:element name="noAnswer">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="noassertions">
    <xsl:element name="noAssertions">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="noconds">
    <xsl:element name="noConds">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="nomdata">
    <xsl:element name="itemIdentData">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="nomen">
    <xsl:element name="name">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="nosafety">
    <xsl:element name="noSafety">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="nospares">
    <xsl:element name="noSpares">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="nosupeq">
    <xsl:element name="noSupportEquips">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="nosupply">
    <xsl:element name="noSupplies">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

<!--   <xsl:template match="not">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: not,  NOW:@booleanAction=)not) COMMENT: Now an attribute value</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template> -->

  <xsl:template match="notationrules">
    <xsl:element name="notationRuleList">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="note">
    <xsl:element name="note">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="notname">
    <xsl:element name="notationName">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="notrule">
    <xsl:element name="notationRule">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="novalue">
    <xsl:element name="noValue">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="nsn">
    <xsl:element name="natoStockNumber">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="objpath">
    <xsl:element name="objectPath">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="objrule">
    <xsl:element name="structureObjectRule">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="objuse">
    <xsl:element name="objectUse">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="objval">
    <xsl:element name="objectValue">
      <xsl:apply-templates select="@*"/>
      <!-- MODIFIED: val1 and val2 processed here -->
      <xsl:choose>
        <xsl:when test="@valtype='range'">
          <xsl:attribute name="valueAllowed">
            <xsl:value-of select="@val1"/><xsl:text>~</xsl:text><xsl:value-of select="@val2"/>
          </xsl:attribute>
        </xsl:when>
        <xsl:otherwise>
          <xsl:attribute name="valueAllowed">
            <xsl:value-of select="@val1"/>
          </xsl:attribute>
        </xsl:otherwise>      
      </xsl:choose>
      <xsl:apply-templates select="node()"/>
    </xsl:element>
  </xsl:template>
<!-- 
  <xsl:template match="obsolete">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: obsolete,  NOW:@obsoleteFlag COMMENT: Now an attribute on ELEMENT:supplySpec</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template> -->

  <xsl:template match="ofault">
    <xsl:element name="observedFault">
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="describe"/>
      <xsl:element name="contextAndIsolationInfo">
        <xsl:apply-templates select="fcontext|isolate"/>
      </xsl:element>
      <xsl:apply-templates select="remarks"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="openhour">
    <xsl:element name="hoursToOpen">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="opn">
    <xsl:element name="overLengthPartNumber">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="opndurn">
    <xsl:element name="taskDuration">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="opt">
    <xsl:element name="optionalPart">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

<!--   <xsl:template match="or">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: or,  NOW:@booleanoperation(or) COMMENT: Now an attribute value</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template>
 -->
  <xsl:template match="organizationid">
    <xsl:element name="enterpriseIdent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

<!--   <xsl:template match="organizationinfo">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: organizationinfo,  NOW:enterpriseSpec COMMENT: Content has been restructured</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template> -->

  <xsl:template match="organizationlist">
    <xsl:element name="enterpriseRepository">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="organizationref">
    <xsl:element name="enterpriseRef">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="orig">
    <!-- MANUAL MODIFICATION -->
    <!-- Change: Added enterpriseName/@enterpriseCode -->
    <xsl:element name="originator">
      <xsl:if test="normalize-space(.)">
         <xsl:attribute name="enterpriseCode"><xsl:value-of select="."/></xsl:attribute>
      </xsl:if>
      <xsl:if test="normalize-space(@origname)">
         <xsl:element name="enterpriseName"><xsl:value-of select="@origname"/></xsl:element>
      </xsl:if>
    </xsl:element>
  </xsl:template>

  <xsl:template match="osc">
    <xsl:element name="optionalSupplierCode">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="others">
    <xsl:element name="otherItems">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="outdia">
    <xsl:element name="outerDiameter">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="copyright//p">
    <xsl:element name="copyrightPara">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p">
    <xsl:element name="simplePara">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="packaging">
    <xsl:element name="packaging">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="page-loc">
    <xsl:element name="viewLocation">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="copyright/para">
    <xsl:element name="copyrightPara">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>


    <xsl:template match="para">
        <xsl:variable name="ancestorWCN">
            <xsl:call-template name="checkAncestorWCN" />
        </xsl:variable>
        <xsl:variable name="elementName">
            <xsl:call-template name="determineParaElementName" />
        </xsl:variable>
        <!-- prior to 4.0.1, an item in sequential list could have an item that has a para that has a list child.
             Now, we have two different types of sequential lists.  the regular one, still allows a list child of para
             the attentionSequentialList, however does NOT allow a list child of the attentionListItemPara, so if one is 
             found, we need to make it a sibling.  not a child.
        -->
        <xsl:choose>
            <xsl:when test="$elementName = 'attentionListItemPara'">
                <!-- does this have a list child? -->
                <xsl:choose>
                    <xsl:when test="seqlist|randlist|deflist">
                        <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
                        <xsl:variable name="log">Element is NOT allowed here any longer.</xsl:variable>
    		            <!-- put randlist as sibling to this para, everything else needs to go away. -->
                        <xsl:if test="randlist">
                            <xsl:apply-templates select="randlist" />
                        </xsl:if>
                    </xsl:when>
                    <xsl:otherwise>
		                <xsl:element name="{$elementName}">
        		            <xsl:apply-templates select="@* | node()"/>
                        </xsl:element>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="{$elementName}">
                    <xsl:apply-templates select="@* | node()"/>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

  <xsl:template match="note/para">
    <xsl:element name="notePara">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="caution/para">
    <xsl:element name="warningAndCautionPara">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="warning/para">
    <xsl:element name="warningAndCautionPara">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="para0">
    <xsl:element name="levelledPara">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="param">
    <xsl:element name="parameter">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>


  <xsl:template match="part">
    <xsl:element name="partRef">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="partid">
    <xsl:element name="partIdent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="partinfo">
    <xsl:element name="partSpec">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="partlist">
    <xsl:element name="partRepository">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="partref">
    <xsl:element name="partRefGroup">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="pas">
    <xsl:element name="partIdentSegment">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="pcs">
    <xsl:element name="unitOfIssueQualificationSegment">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="pct">
    <xsl:element name="productCrossRefTable">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="pctref">
    <xsl:element name="productCrossRefTableRef">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="perscat"/>
  <xsl:template match="perscat" mode="wrap-reqpers">
    <!-- MANUAL MODIFICATION -->
    <!-- Change: added mode so this tag is only processed with person -->
    <xsl:element name="personCategory">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="perskill"/>
  <xsl:template match="perskill" mode="wrap-reqpers">
    <xsl:element name="personSkill">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

<!--   <xsl:template match="comment//person">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: comment/../person,  NOW:dispatchPerson COMMENT: In comment -> refer to Table 1 in Transition WP</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template> -->

  <xsl:template match="person">
    <!-- MANUAL MODIFICATION -->
    <!-- Change: determine the appropriate wrapper for personnel children -->
    <!-- 
      <person man="xx"/>
      <perscat category="Elec"/>
      <perskill skill="sk01"/>
      <xsl:element name="esttime">1hr</xsl:element>
    -->
    <xsl:element name="person">
      <xsl:apply-templates select="@*"/>

      <xsl:if test="not(name(following-sibling::*[1])='asrequir') and 
                    not(name(following-sibling::*[1])='person')">

         <xsl:apply-templates select="following-sibling::*[1]" mode="wrap-reqpers"/>

         <xsl:if test="not(name(following-sibling::*[2])='asrequir') and 
                       not(name(following-sibling::*[2])='person')">

           <xsl:apply-templates select="following-sibling::*[2]" mode="wrap-reqpers"/>

           <xsl:if test="not(name(following-sibling::*[3])='asrequir') and 
                         not(name(following-sibling::*[3])='person')">

             <xsl:apply-templates select="following-sibling::*[3]" mode="wrap-reqpers"/>

             <xsl:if test="not(name(following-sibling::*[4])='asrequir') and 
                           not(name(following-sibling::*[4])='person')">

               <xsl:apply-templates select="following-sibling::*[4]" mode="wrap-reqpers"/>

             </xsl:if>

           </xsl:if>

         </xsl:if>

      </xsl:if>

    </xsl:element>
  </xsl:template>

  <!-- <xsl:template match="person">
    <xsl:element name="person">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template> -->
<!-- 
  <xsl:template match="plus">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: plus,  NOW:@numberoperation(plus) COMMENT: Now an attribute value</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template> -->

  <xsl:template match="pm">
    <xsl:element name="pm">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="pmaddres">
    <!-- MANUAL MODIFICATION -->
    <!-- Change: Added pmIdent and pmAddressItems wrappers -->
    <xsl:element name="pmAddress">
      <xsl:apply-templates select="@*"/>
      <xsl:element name="pmIdent">
        <xsl:apply-templates select="pmc"/>
        <xsl:choose>
          <xsl:when test="./language">
            <xsl:apply-templates select="language"/>
          </xsl:when>
          <xsl:otherwise><language countryIsoCode="EN" languageIsoCode="us"/></xsl:otherwise>
        </xsl:choose>
        <xsl:apply-templates select="issno"/>
      </xsl:element>
      <xsl:element name="pmAddressItems">
        <xsl:apply-templates select="issdate"/>
        <xsl:apply-templates select="pmtitle"/>      
      </xsl:element>
    </xsl:element>
  </xsl:template>

  <xsl:template match="pmd">
    <xsl:element name="productionMaintData">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="pmentry">
    <xsl:element name="pmEntry">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="pmstatus">
    <xsl:element name="pmStatus">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>


  <xsl:template match="pnr">
    <xsl:element name="partNumber">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>
  
  <xsl:template match="polref">
    <xsl:element name="policyStatement">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="posnhassy">
    <xsl:element name="positionOnNextHigherAssy">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="postset">
    <xsl:element name="variablePostSet">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="pre">
    <xsl:element name="preparationInfo">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="prelreqs">
    <xsl:element name="preliminaryRqmts">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="preset">
    <xsl:element name="variablePreSet">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="priority">
    <xsl:element name="commentPriority">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="procd">
    <xsl:element name="crewProcedureName">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="procdata">
    <xsl:element name="procurementData">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="proced">
    <xsl:element name="procedure">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="process">
    <xsl:element name="process">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="prodattr">
    <xsl:element name="productAttribute">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="product">
    <xsl:element name="product">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="productattributes">
    <xsl:element name="productAttributeList">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="prompt">
    <xsl:element name="prompt">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

<!--   <xsl:template match="provisioned">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: provisioned,  NOW:@provisionedFlag COMMENT: Now an attribute on circuitBreakerAlt</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template> -->

  <xsl:template match="psc">
    <xsl:element name="physicalSecurityPilferageCode">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="psp">
    <xsl:element name="preferredSparePart">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

    <xsl:template match="reftp">
        <xsl:variable name="wrapInPara">
            <xsl:call-template name="checkIfWrap" />
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="$wrapInPara = 'true'">
                <xsl:variable name="paraElementName">
                    <xsl:call-template name="determineParaElementName" />
                </xsl:variable>
                <xsl:element name="{$paraElementName}">
                    <xsl:call-template name="createExternalPubRefElement" />
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="createExternalPubRefElement" />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="createExternalPubRefElement">
        <!-- MANUAL MODIFICATION -->
        <!-- Change: Attributes are processed in externalPubRef -->
        <xsl:element name="externalPubRef">
            <xsl:apply-templates select="@* | ./techpub/@*"/>
            <xsl:element name="externalPubRefIdent">
                <xsl:element name="externalPubCode">
                    <xsl:apply-templates select="node()"/>
                </xsl:element>
            </xsl:element>
        </xsl:element>
    </xsl:template>

  <xsl:template match="reftp[./pubcode/pmc]">
    <!-- 
    <reftp>
    <pubcode><pmc><modelic></modelic><pmissuer></pmissuer><pmnumber></pmnumber><pmvolume></pmvolume></pmc></pubcode>
    </reftp>
    
    <pmRef>
      <pmRefIdent>
        <pmCode modelIdentCode="ABCDE" pmIssuer="ABCDE" pmNumber="12345" pmVolume="01"/>
        <issueInfo inWork="01" issueNumber="001"/>
        <language countryIsoCode="EN" languageIsoCode="gb"/>
      </pmRefIdent>
      <pmRefAddressItems>
        <pmTitle></pmTitle>
        <issueDate day="29" month="04" year="2009"/>
        <security securityClassification="02"/>
        <responsiblePartnerCompany></responsiblePartnerCompany>
        <pubMedia pubMediaCode="1212" pubMediaType="22342"/>
        <shortPmTitle></shortPmTitle>
      </pmRefAddressItems>
      <behavior/>
    </pmRef>

    -->
    <xsl:element name="pmRef">
      <xsl:element name="pmRefIdent">
        <xsl:apply-templates select="./pubcode[./pmc]"/>
      </xsl:element>
      <xsl:element name="pmRefAddressItems">
        <xsl:apply-templates select="./pmTitle"/>
        <xsl:apply-templates select="./issueDate"/>
      </xsl:element>
    </xsl:element>
  </xsl:template>

  <xsl:template match="pubcode[parent::reftp][./pmc]">
    <xsl:element name="pmCode">
      <xsl:attribute name="modelIdentCode">
        <xsl:value-of select="./pmc/modelic"/>
      </xsl:attribute>
      <xsl:attribute name="pmIssuer">
        <xsl:value-of select="./pmc/pmissuer"/>
      </xsl:attribute>
      <xsl:attribute name="pmNumber">
        <xsl:value-of select="./pmc/pmnumber"/>
      </xsl:attribute>
      <xsl:attribute name="pmVolume">
        <xsl:value-of select="./pmc/pmvolume"/>
      </xsl:attribute>
    </xsl:element>
  </xsl:template>

  <xsl:template match="pmaddres/pmc">
    <xsl:element name="pmCode">
      <xsl:attribute name="modelIdentCode">
        <xsl:value-of select="modelic"/>
      </xsl:attribute>
      <xsl:attribute name="pmIssuer">
        <xsl:value-of select="pmissuer"/>
      </xsl:attribute>
      <xsl:attribute name="pmNumber">
        <xsl:value-of select="pmnumber"/>
      </xsl:attribute>
      <xsl:attribute name="pmVolume">
        <xsl:value-of select="pmvolume"/>
      </xsl:attribute>
    </xsl:element>
  </xsl:template>

<!--   <xsl:template match="pubcode">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: pubcode,  NOW:pmCode COMMENT: For references to S1000D PMs -> refer to Table 1 in Transition WP</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template> -->

 <!--  <xsl:template match="pubdate">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: pubdate,  NOW:issueDate COMMENT: Parent change in two places in most of the schemas -> refer to Table 1 of Transition WP</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template> -->
<!-- 
  <xsl:template match="pubtitle">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: pubtitle,  NOW:externalPubTitle COMMENT: For ELEMENT:reftp that becomes an ELEMENT:externalPubRef -> refer to Table 1 of Transition WP</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template>

  <xsl:template match="pubtitle">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: pubtitle,  NOW:pmTitle COMMENT: For ELEMENT:reftp that becomes a ELEMENT:pmRef -> refer to Table 1 of Transition WP</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template> -->

  <xsl:template match="qa">
    <xsl:element name="qualityAssurance">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="qna">
    <xsl:element name="quantityPerNextHigherAssy">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="qty">
    <xsl:element name="reqQuantity">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="qtygrp">
    <xsl:element name="quantityGroup">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="qtytolerance">
    <xsl:element name="quantityTolerance">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="qtyvalue">
    <xsl:element name="quantityValue">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>


    <xsl:template match="randlist">
        <xsl:variable name="elementName">
            <xsl:choose>
                <xsl:when test="(name(..) = 'warning' or ancestor::*[name() = 'warning']) or (name(..) = 'caution' or ancestor::*[name() = 'caution']) or (name(..) = 'note' or ancestor::*[name() = 'note'])">
                    <xsl:text>attentionRandomList</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>randomList</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="wrapInPara">
            <xsl:call-template name="checkIfWrap" />
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="$wrapInPara = 'true'">
                <xsl:element name="para">
                    <xsl:call-template name="createRandomListElement">
                        <xsl:with-param name="elementName" select="$elementName" />
                    </xsl:call-template>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="createRandomListElement">
                    <xsl:with-param name="elementName" select="$elementName" />
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="createRandomListElement">
        <xsl:param name="elementName" />
        <xsl:element name="{$elementName}">
            <xsl:if test="not(@prefix)">
                <xsl:attribute name="listItemPrefix">pf02</xsl:attribute>        
            </xsl:if>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="seqlist">
        <xsl:variable name="elementName">
            <xsl:choose>
                <xsl:when test="(name(..) = 'warning') or (name(..) = 'caution') or (name(..) = 'note')">
                    <xsl:text>attentionSequentialList</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>sequentialList</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
               <xsl:variable name="wrapInPara">
            <xsl:call-template name="checkIfWrap" />
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="$wrapInPara = 'true'">
                <xsl:element name="para">
                    <xsl:call-template name="createElementWithThisName">
                        <xsl:with-param name="elementName" select="$elementName" />
                    </xsl:call-template>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
        <xsl:call-template name="createElementWithThisName">
            <xsl:with-param name="elementName" select="$elementName" />
        </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    

  <xsl:template match="serialno/range">
    <xsl:element name="serialNumber">
      <xsl:attribute name="serialNumberForm">
        <xsl:text>range</xsl:text>
      </xsl:attribute>
      <xsl:attribute name="serialNumberValue">
        <xsl:value-of select="@from"/><xsl:text>~</xsl:text><xsl:value-of select="@to"/>
      </xsl:attribute>
    </xsl:element>
  </xsl:template>

  <xsl:template match="rcmdqty">
    <xsl:element name="rcmdQuantity">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="recbyname">
    <xsl:element name="receiveByName">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="recbypos">
    <xsl:element name="receiveByPosition">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="receive">
    <xsl:element name="receiveValue">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="recommendation">
    <xsl:element name="rcmd">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="refcattach">
    <xsl:element name="attachmentRef">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="refextp">
    <xsl:element name="externalPubRef"><xsl:apply-templates select="@* | node()"/></xsl:element>
  </xsl:template>

  <xsl:template match="refinspec">
    <xsl:element name="inspectionType">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="refpm">
    <xsl:element name="pmRef">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="refs">
    <xsl:choose>
    <xsl:when test="parent::supply">
      <supplyRqmtRef>
        <xsl:element name="refs">
          <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
      </supplyRqmtRef>
    </xsl:when>
    <xsl:otherwise>
      <xsl:element name="refs">
        <xsl:apply-templates select="@* | node()"/>
      </xsl:element>
    </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="remark">
    <xsl:element name="simpleRemark">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

    <xsl:template match="remarks">
        <!-- MANUAL MODIFICATION -->
        <!-- Change: Added wrapped text in simplePara -->
        <xsl:element name="remarks">
            <xsl:apply-templates select="applic | p"/>
            <xsl:for-each select="./text()">
                <xsl:element name="simplePara">
                    <xsl:call-template name="handleText" />
                </xsl:element>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>

  <!-- <xsl:template match="remove"> -->
    <!-- <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable> -->
    <!-- <xsl:variable name="log">**TODO** ELEMENT WAS: remove,  NOW:@setoperation(remove) COMMENT: Now an attribute value</xsl:variable> -->
    <!-- <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/> -->
  <!-- </xsl:template> -->

  <xsl:template match="repair">
    <xsl:element name="repair">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="reqcblst">
    <xsl:element name="reqCondCircuitBreaker">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <!-- 
  <reqconds>
    <reqcond>The bicycle is outdoors</reqcond>
    <reqcondm>
      <reqcond></reqcond>
      <refdm></refdm>
    </reqcondm>
  </reqconds>

  <reqcontp>
  <reqcond>Safely discard the horn that you removed</reqcond>
  <reftp>Local Disposal Procedures</reftp></reqcontp>
  
  <reqCondGroup>
    <reqCondNoRef>
      <reqCond></reqCond>
    </reqCondNoRef>
    <reqCondDm>
      <reqCond></reqCond>
      <dmRef><dmRefIdent><dmCode .../></dmRefIdent></dmRef>
    </reqCondDm>
  </reqCondGroup>
  -->
  <xsl:template match="reqcond[not(parent::reqcondm) and not(parent::reqcontp)]">
    <xsl:element name="reqCondNoRef">
      <xsl:element name="reqCond">
        <xsl:apply-templates select="@* | node()"/>
      </xsl:element>
    </xsl:element>
  </xsl:template>

  <xsl:template match="reqcond">
    <xsl:element name="reqCond">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

    <xsl:template match="reqcondm">
        <xsl:for-each select="reqcond">
            <xsl:element name="reqCondDm">
                <!-- only want the id on the first reqconddm if more than one reqcond found -->
                <xsl:if test="parent::reqcondm/processing-instruction('preserveid') and position()=1">
                    <xsl:variable name="theid"><xsl:apply-templates select="parent::reqcondm/processing-instruction('preserveid')" /></xsl:variable>
                    <xsl:attribute name="id">
                        <xsl:value-of select="$theid" />
                    </xsl:attribute>
                </xsl:if>
                <xsl:if test="../reqcondm/applic">
                    <xsl:apply-templates select="../reqcondm/applic" />
                </xsl:if>
                <!-- reqcond -->
                <xsl:apply-templates select="." />
                <xsl:apply-templates select="following-sibling::refdm[1]" />             
            </xsl:element>
        </xsl:for-each>  
    </xsl:template>
  
    <xsl:template match="processing-instruction('preserveid')">
        <xsl:value-of select="substring-before(substring-after(., 'id=&quot;'), '&quot;')"/>
    </xsl:template>

  <xsl:template match="reqconds">
    <!-- MODIFIED: If avehcfg exist process as a reqcond -->
    <xsl:if test="..//avehcfg">
      <xsl:apply-templates select="..//avehcfg" mode="avehcfg-reqcond"/>
    </xsl:if>
    
    <xsl:element name="reqCondGroup">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

    <xsl:template match="reqcontp[./reftp]">
        <!-- 
              <reqcontp>
                  <reqcond>Safely discard the horn that you removed</reqcond>
                  <reftp>Local Disposal Procedures</reftp>
              </reqcontp>
    
             <reqCondExternalPub>
                 <reqCond></reqCond>
                  <externalPubRef><externalPubRefIdent><externalPubCode></externalPubCode></externalPubRefIdent></externalPubRef>
              </reqCondExternalPub>
           -->
        <xsl:for-each select="reqcond">
            <xsl:element name="reqCondExternalPub">
                <xsl:if test="parent::reqcontp/processing-instruction('preserveid') and position()=1">
                    <xsl:variable name="theid"><xsl:apply-templates select="parent::reqcontp/processing-instruction('preserveid')" /></xsl:variable>
                    <xsl:attribute name="id">
                        <xsl:value-of select="$theid" />
                    </xsl:attribute>
                </xsl:if>
                <xsl:if test="../reqcontp/applic">
                    <xsl:apply-templates select="../reqcontp/applic" />
                </xsl:if>
                <!-- reqcond -->
                <xsl:apply-templates select="." />
                <xsl:apply-templates select="following-sibling::reftp[1]" />
            </xsl:element>
        </xsl:for-each>  
    </xsl:template>

  <xsl:template match="reqcontp[/reftp/pubcode/pmc]">
    <!-- 
    <reqcontp>
      <reqcond></reqcond>
      <reftp>
        <pubcode><pmc><modelic></modelic><pmissuer></pmissuer><pmnumber></pmnumber><pmvolume></pmvolume></pmc></pubcode>
      </reftp>
    </reqcontp>
    
    <reqCondPm>
      <reqCond></reqCond>
      <pmRef>
        <pmRefIdent><pmCode modelIdentCode="AA" pmIssuer="INMED" pmNumber="00001"  pmVolume="01"/></pmRefIdent>
        <pmRefAddressItems><pmTitle></pmTitle></pmRefAddressItems>
      </pmRef>
    </reqCondPm>
    -->
     <xsl:for-each select="child::*">
       <xsl:if test="name(.)='reqcond' and position()=1">
         <xsl:text disable-output-escaping="yes">&lt;reqCondPm&gt;</xsl:text>
       </xsl:if>
       <xsl:if test="name(.)='reqcond' and position()!=1">
         <xsl:text disable-output-escaping="yes">&lt;/reqCondPm&gt;
&lt;reqCondPm&gt;</xsl:text>
       </xsl:if>
       <xsl:apply-templates select='.'/>
       <xsl:if test="not(following-sibling::*)">
         <xsl:text disable-output-escaping="yes">&lt;/reqCondPm&gt;</xsl:text>
       </xsl:if>
     </xsl:for-each>  
  </xsl:template>

  <xsl:template match="reqpers">
    <xsl:element name="reqPersons">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="reqsource">
    <xsl:element name="rqmtSource">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="res">
    <xsl:element name="resistance">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="response">
    <xsl:element name="{name()}">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="retrofit">
    <xsl:element name="retrofit">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="rfa">
    <xsl:element name="reasonForAmendment">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="rfd">
    <xsl:element name="referenceDesignator">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="rfs">
    <xsl:element name="reasonForSelection">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

<!--   <xsl:template match="@rfc">
    <xsl:attribute name="reasonForUpdateRefIds">
      <xsl:variable name="ct" select="count( preceding::*[@rfc] )+1"/>
      <xsl:text>rfc</xsl:text>
      <xsl:value-of select="format-number( $ct, '0000' )"/>
    </xsl:attribute>
  </xsl:template> -->

<!--   <xsl:template match="rfu">
    MANUAL MODIFICATION
    TODO: Need to review this
    Change: Added wrapped text in simplePara
    <xsl:element name="reasonForUpdate">
      <xsl:variable name="thisrfu" select="translate( ., '&#x0A;' ,' ' )"/>
      <xsl:if test="//*[@rfc=$thisrfu]">
        <xsl:variable name="changeel" select="//*[@rfc=$thisrfu]"/>
        <xsl:variable name="ct" select="count( preceding::*[@rfc] )+1"/>
        <xsl:attribute name="id">
          <xsl:text>rfc</xsl:text>
          <xsl:value-of select="format-number( $ct, '0000' )"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:apply-templates select="applic | p"/>
      <xsl:for-each select="./text()">
        <xsl:if test="string-length(normalize-space(.)) &gt; 0">
           <xsl:element name="simplePara"><xsl:call-template name="handleText" /></xsl:element>
        </xsl:if>
      </xsl:for-each>
    </xsl:element>
    <xsl:if test="name( following-sibling::*[1] )!='rfu'">
      Build 'reasonForUpdate'
      <xsl:if test="//content//*[@rfc]">
        <xsl:variable name="rfcs" select="//content//*[@rfc]/@rfc"/>
        <xsl:for-each select="$rfcs">
          <xsl:variable name="this" select="translate( ., '&#x0A;' ,' ' )"/>
          <xsl:choose>
            <xsl:when test="//rfu=$this"></xsl:when>
            <xsl:otherwise>
              <xsl:variable name="ct" select="count( preceding::*[@rfc] )+1"/>
              <xsl:element name="reasonForUpdate">
                <xsl:attribute name="id">
                  <xsl:text>rfc</xsl:text>
                  <xsl:value-of select="format-number( $ct, '0000' )"/>
                </xsl:attribute>
                <xsl:element name="simplePara">
                  <xsl:value-of select="." />
                </xsl:element>
              </xsl:element>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:for-each>
      </xsl:if>
    </xsl:if>
  </xsl:template> -->

  <xsl:template match="routing">
    <xsl:element name="routing">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="row">
    <xsl:element name="row">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="rpc">
    <!-- MANUAL MODIFICATION -->
    <!-- Change: Added enterpriseName/@enterpriseCode -->
    <xsl:element name="responsiblePartnerCompany">
      <xsl:if test="normalize-space(.)">
         <xsl:attribute name="enterpriseCode"><xsl:value-of select="."/></xsl:attribute>
      </xsl:if>
      <xsl:if test="normalize-space(@rpcname)">
         <xsl:element name="enterpriseName"><xsl:value-of select="@rpcname"/></xsl:element>
      </xsl:if>
    </xsl:element>
  </xsl:template>

  <xsl:template match="rplby">
    <xsl:element name="replacedBy">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="rtx">
    <xsl:element name="referTo">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="safecond">
    <xsl:element name="safetyRqmts">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="safedev">
    <!-- MODIFIED: Converted safedev into a required condition only if explictally required -->
    <!-- FUTURE: Text is inserted.  Allow the output to be configurable for language and project-->
    <xsl:if test="@status='yes' or @status='no'">
    <xsl:element name="reqCondNoRef">
      <xsl:element name="reqCond">
        <xsl:choose>
          <xsl:when test="@status='yes'">
            <xsl:text>The system required to have </xsl:text>
          </xsl:when>
          <xsl:when test="@status='no'">
            <xsl:text>The system prohibited from having </xsl:text>
          </xsl:when>
        </xsl:choose>
        <xsl:choose>
          <xsl:when test="@power='engine'">
            <!-- nonsense option -->
            <xsl:text>safety devices engaged.</xsl:text>
          </xsl:when>
          <xsl:when test="@power='apu'">
            <!-- nonsense option -->
            <xsl:text>safety devices engaged.</xsl:text>
          </xsl:when>
          <xsl:when test="@power='internal'">
            <xsl:text>internal safety devices engaged.</xsl:text>
          </xsl:when>
          <xsl:when test="@power='external'">
            <xsl:text>external safety devices engaged.</xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <!-- If power is "indifferent" or "notapplic"  -->
            <xsl:text>safety devices engaged.</xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:element>
    </xsl:element>
    </xsl:if>
  </xsl:template>

  <xsl:template match="safety">
    <xsl:element name="reqSafety">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="sbc">
    <xsl:element name="systemBreakdownCode">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="schedule">
    <xsl:element name="maintPlanning">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="screen">
    <xsl:element name="screen">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="screens">
    <xsl:element name="screenGroup">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="sdia">
    <xsl:element name="sleeveDiameter">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="security">
    <xsl:element name="security">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="secver">
    <xsl:element name="secondVerification">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="sel-list">
    <xsl:element name="listOfChoices">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="send">
    <xsl:element name="send">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>



  <xsl:template match="serialno">
  <!--
  <!ELEMENT serialno ((single | range)+)>
  <!ELEMENT single (#PCDATA)>
  <!ELEMENT range EMPTY>
  <!ATTLIST range
  from  CDATA #REQUIRED
  to  CDATA #REQUIRED
  >
    <xs:element name="serialNumber" type="serialNumberElemType"/>
    <xs:complexType name="serialNumberElemType">
        <xs:attribute ref="serialNumberForm" use="required"/>
        <xs:attribute ref="serialNumberValue" use="required"/>
    </xs:complexType>
    <xs:attribute name="serialNumberForm" type="serialNumberFormAttType"/>
    <xs:simpleType name="serialNumberFormAttType">
        <xs:restriction base="xs:NMTOKEN">
            <xs:enumeration value="single"/>
            <xs:enumeration value="range"/>
        </xs:restriction>
    </xs:simpleType>
    <xs:attribute name="serialNumberValue" type="xs:string"/>
  -->  
    <xsl:apply-templates select="@* | node()"/>
  </xsl:template>

  <xsl:template match="set">
    <xsl:element name="setValue">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <!-- <xsl:template match="set-diff"> -->
    <!-- <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable> -->
    <!-- <xsl:variable name="log">**TODO** ELEMENT WAS: set-diff,  NOW:@setoperation(setDifference) COMMENT: Now an attribute value</xsl:variable> -->
    <!-- <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/> -->
  <!-- </xsl:template> -->

  <xsl:template match="shelflife">
    <xsl:element name="shelfLife">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="shippinginfo">
    <xsl:element name="shippingInfo">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="shrink-sleeve">
    <xsl:element name="shrinkSleeve">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="shrink-sleeves">
    <xsl:element name="shrinkSleeveGroup">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="sibplugid">
    <xsl:element name="siblingPlugIdent">
      <xsl:element name="referenceDesignator">
        <xsl:apply-templates select="@* | node()"/>
      </xsl:element>
    </xsl:element>
  </xsl:template>

  <xsl:template match="sid">
    <xsl:element name="subjectIdent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="side">
    <xsl:element name="zoneSide">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="size">
    <xsl:element name="size">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

<!--   <xsl:template match="sizeof">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: sizeof,  NOW:@setAction=)sizeOf) COMMENT: Now an attribute value for set functions</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template>

  <xsl:template match="sizeof">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: sizeof,  NOW:@stringAction=)sizeOf) COMMENT: Now an attribute value for string functions</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template> -->

  <xsl:template match="skill">
    <xsl:element name="skillLevel">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="sleeve">
    <xsl:element name="sleeve">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="sleeves">
    <xsl:element name="sleeveGroup">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="smf">
    <xsl:element name="selectOrManufactureFromIdent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="smr">
    <xsl:element name="sourceMaintRecoverability">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

<!--   <xsl:template match="sns">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: sns,  NOW:funtionalPhysicalAreaRef COMMENT: Parent change -> refer to Table 1 in Transition WP</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template> -->

  <xsl:template match="solder-sleeve">
    <xsl:element name="solderSleeve">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="solder-sleeves">
    <xsl:element name="solderSleeveGroup">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="spanspec">
    <xsl:element name="spanspec">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="spare">
    <xsl:element name="spareDescr">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="spares">
    <xsl:element name="reqSpares">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="sparesli">
    <xsl:element name="spareDescrGroup">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="spc">
    <xsl:element name="sparePartClass">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

<!--   <xsl:template match="spec">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: spec,  NOW:specDocument COMMENT: Content now in attribute specDocumentNumber</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template>

  <xsl:template match="speciallbl">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: speciallbl,  NOW:@specialLabelFlag COMMENT: Now an attribute on ELEMENT:supplySpec</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template> -->

  <xsl:template match="speclist">
    <xsl:element name="specificationGroup">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="spl">
    <xsl:element name="supplierCode">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="srcdmaddres">
    <xsl:element name="sourceDmIdent">
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="dmcextension"/>
      <xsl:apply-templates select="dmc"/>
      <xsl:choose>
        <xsl:when test="./language">
          <xsl:apply-templates select="language"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:variable name="ct">
            <xsl:choose>
              <xsl:when test="//idstatus//language[1]">
                <xsl:value-of select="//idstatus//language[1]/@country"/>
              </xsl:when>
              <xsl:otherwise>US</xsl:otherwise>
            </xsl:choose>
          </xsl:variable>
          <xsl:variable name="lng">
            <xsl:choose>
              <xsl:when test="//idstatus//language[1]">
                <xsl:value-of select="//idstatus//language[1]/@language"/>
              </xsl:when>
              <xsl:otherwise>en</xsl:otherwise>
            </xsl:choose>
          </xsl:variable>
          <language countryIsoCode="{$ct}" languageIsoCode="{$lng}"/>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="issno"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="sru">
    <xsl:element name="sru">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="sruitem">
    <xsl:element name="sruItem">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="srv">
    <xsl:element name="service">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="status">
    <xsl:element name="dmStatus">
      <!-- MANUAL MODIFICATION -->
      <!-- Change: Insert issno\@type here and suppress -->
      <xsl:attribute name="issueType">
        <xsl:choose>
          <xsl:when test="//idstatus/dmaddres/issno/@type">
            <xsl:value-of select="//idstatus/dmaddres/issno/@type"/>
          </xsl:when>
          <xsl:otherwise>revised</xsl:otherwise>
        </xsl:choose>
      </xsl:attribute>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="../srcdmaddres"/>
      <xsl:apply-templates select="node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="stdparts">
    <xsl:element name="standardPartGroup">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="step">
    <xsl:element name="crewDrillStep">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="step1 | step2 | step3 | step4 | step5 | step6 | step7 | step8">
    <xsl:variable name="this" select="current()"/>
    <xsl:variable name="parent" select=".."/>
    <xsl:if test="substring( name($parent), 1, 4 )='step'">
      <xsl:choose>
        <xsl:when test="( name( $parent/node() ) = name($this) ) and
                        ( $parent/node()[1] = $this)">
          <xsl:element name="para"><xsl:comment>DTD padder (1)...(<xsl:value-of select="name(.)"/>)</xsl:comment></xsl:element>
        </xsl:when>
        <xsl:when test="name( $parent/node()[1] )='applic' and $parent/node()[2]=$this">
          <xsl:element name="para"><xsl:comment>DTD padder (2)...(<xsl:value-of select="name(.)"/>)</xsl:comment></xsl:element>
        </xsl:when>
      </xsl:choose>
    </xsl:if>
    <xsl:element name="proceduralStep">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="step1-alt | step2-alt | step3-alt | step4-alt | step5-alt | step6-alt | step7-alt | step8-alt">
    <xsl:element name="proceduralStepAlt">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

<!--   <xsl:template match="stocknbr">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: stocknbr,  NOW:stockNumber COMMENT: Attribute pnr becomes element content</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template> -->

  <xsl:template match="str">
    <xsl:element name="specialStorage">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="structrules">
    <xsl:element name="structureObjectRuleGroup">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="subdrill">
    <xsl:element name="subCrewDrill">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="subpara1">
    <xsl:element name="levelledPara">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="subpara2">
    <xsl:element name="levelledPara">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="subpara3">
    <xsl:element name="levelledPara">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="subpara4">
    <xsl:element name="levelledPara">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="subpara5">
    <xsl:element name="levelledPara">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="subpara6">
    <xsl:element name="levelledPara">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="subpara7">
    <xsl:element name="levelledPara">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

<!--   <xsl:template match="subset">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: subset,  NOW:@setoperation(subset) COMMENT: Now an attribute value</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template>

  <xsl:template match="substring">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: substring,  NOW:@stringoperation(contains) COMMENT: Now an attribute value</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template> -->

  <xsl:template match="subsys-name">
    <xsl:element name="faultySubSystem">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="sup">
    <xsl:element name="suppliedBy">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="supeqli">
    <xsl:element name="supportEquipDescrGroup">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="supequi">
    <xsl:element name="supportEquipDescr">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="supequip">
    <xsl:element name="reqSupportEquips">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="supervis">
    <xsl:element name="supervisorLevel">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="suplist">
    <xsl:element name="supplierGroup">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="supplies">
    <xsl:element name="reqSupplies">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="supply">
    <xsl:element name="supplyDescr">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="supplyli">
    <xsl:element name="supplyDescrGroup">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>


  <xsl:template match="sys-ident">
    <xsl:element name="systemIdent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="sys-loc">
    <xsl:element name="systemLocation">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="sys-name">
    <xsl:element name="systemName">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="sys-pos">
    <xsl:element name="systemPosition">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="table">
    <xsl:element name="table">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tabtitle">
    <xsl:element name="thumbTabText">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="taskcode">
    <xsl:element name="taskCategory">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="taskitem">
    <xsl:element name="taskItem">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tasklist">
    <xsl:element name="taskGroup">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tbody">
    <xsl:element name="tbody">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="techcondition">
    <xsl:element name="condIncorporation">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="techdata">
    <xsl:element name="techData">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="techrep">
    <xsl:element name="techRepository">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="techstd">
    <xsl:element name="techStandard">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="temp">
    <xsl:element name="temperature">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

    <xsl:template match="term">
        <xsl:call-template name="createElementWithThisName">
            <xsl:with-param name="elementName" select="'listItemTerm'" />
        </xsl:call-template>
    </xsl:template>

  <xsl:template match="test">
    <xsl:element name="faultIsolationTest">
      <!-- @testCode -->
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="testdesc">
    <xsl:element name="testDescr">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="testproc">
    <xsl:element name="testProcedure">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tfoot">
    <xsl:element name="tfoot">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tgroup">
    <xsl:element name="tgroup">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="thead">
    <xsl:element name="thead">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="thi">
    <xsl:element name="thresholdInterval">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="threshold">
    <xsl:element name="threshold">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="timelim">
    <xsl:element name="timeLimitInfo">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="timelimit">
    <xsl:element name="timeLimit">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

 <!--  <xsl:template match="times">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: times,  NOW:@numberoperation(times) COMMENT: Now an attribute value</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template> -->

  <xsl:template match="title">
    <xsl:element name="title">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

<!--   <xsl:template match="pm//title">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: pm//title,  NOW:pmTitle COMMENT: Not in pm</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template> -->

  <xsl:template match="to">
    <xsl:element name="limitRangeTo">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="toequip">
    <xsl:element name="toEquip">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tolerance">
    <xsl:element name="tolerance">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tool">
    <xsl:element name="toolRef">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="toolalt">
    <xsl:element name="toolAlt">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="toolid">
    <xsl:element name="toolIdent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="toolinfo">
    <xsl:element name="toolSpec">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="toollist">
    <xsl:element name="toolRepository">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="toolref">
    <xsl:element name="toolRefGroup">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="trade"/>
  <xsl:template match="trade" mode="wrap-reqpers">
    <!-- MANUAL MODIFICATION -->
    <!-- Change: added mode so this tag is only processed with person     -->
    <xsl:element name="trade">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="transport">
    <xsl:element name="transport">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="trigger">
    <xsl:element name="trigger">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="trl">
    <xsl:element name="transverseLink">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

<!--   <xsl:template match="trunc">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: trunc,  NOW:@numberAction=)truncate) COMMENT: Now an attribute value</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template> -->

  <xsl:template match="type">
    <!-- TODO: applic/type suppressed, to be implement in applic conversion -->
  </xsl:template>

  <xsl:template match="twist">
    <xsl:element name="twist">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="twists">
    <xsl:element name="twistGroup">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="uca">
    <xsl:element name="usableOnCodeAssy">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="uce">
    <xsl:element name="usableOnCodeEquip">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

<!--   <xsl:template match="union">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: union,  NOW:@setoperation(union) COMMENT: Now an attribute value</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template> -->

  <xsl:template match="unverif">
    <xsl:element name="unverified">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="uoi">
    <xsl:element name="unitOfIssue">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="usage">
    <xsl:element name="usage">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="usgcat">
    <xsl:element name="usageCategory">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="validate">
    <xsl:element name="validate">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="variable">
    <xsl:element name="variable">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="variable-declarations">
    <xsl:element name="variableDeclarations">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="variable-ref">
    <xsl:element name="variableRef">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="vas">
    <xsl:element name="subjectVariantSegment">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="voltage">
    <xsl:element name="voltage">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="vpart">
    <xsl:element name="distributionPart">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="vparts">
    <xsl:element name="distributionPartGroup">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="wallthk">
    <xsl:element name="wallThickness">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>


  <xsl:template match="water">
    <!-- MODIFIED: Converted water into a required condition only if explictally required -->
    <!-- FUTURE: Text is inserted.  Allow the output to be configurable for language and project-->
    <xsl:if test="@status='yes' or @status='no'">
    <xsl:element name="reqCondNoRef">
      <xsl:element name="reqCond">
        <xsl:choose>
          <xsl:when test="@status='yes'">
            <xsl:text>The system required to have </xsl:text>
          </xsl:when>
          <xsl:when test="@status='no'">
            <xsl:text>The system prohibited from having </xsl:text>
          </xsl:when>
        </xsl:choose>
        <xsl:choose>
          <xsl:when test="@power='engine'">
            <!-- nonsense option -->
            <xsl:text>water supplied by the engine.</xsl:text>
          </xsl:when>
          <xsl:when test="@power='apu'">
            <!-- nonsense option -->
            <xsl:text>water supplied by the APU.</xsl:text>
          </xsl:when>
          <xsl:when test="@power='internal'">
            <xsl:text>an internal water suppy.</xsl:text>
          </xsl:when>
          <xsl:when test="@power='external'">
            <xsl:text>an external water suppy.</xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <!-- If power is "indifferent" or "notapplic"  -->
            <xsl:text>a water supply.</xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:element>
    </xsl:element>
    </xsl:if>
  </xsl:template>

  <xsl:template match="wire">
    <xsl:element name="wire">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="wirecode">
    <xsl:element name="wireCode">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="wireconcode">
    <xsl:element name="wireConnectionCode">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="wireconnection">
    <xsl:element name="wireConnection">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="wiregauge">
    <xsl:element name="wireGauge">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="wireid">
    <xsl:element name="wireIdent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="wireinformation">
    <xsl:element name="wireInfo">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="wireins">
    <xsl:element name="wireInstallationCode">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="wire-mat">
    <xsl:element name="wireMaterial">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="wire-mats">
    <xsl:element name="wireMaterialGroup">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="wires">
    <xsl:element name="wireGroup">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="wmlf2desc">
    <xsl:element name="assocWarningMalfunction">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="wmlfdesc">
    <xsl:element name="warningMalfunction">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="wrngdata">
    <xsl:element name="wiringData">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="wrngflds">
    <xsl:element name="wiringFields">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

<!--   <xsl:template match="xor">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: xor,  NOW:@booleanoperation(exclusiveOr) COMMENT: Now an attribute value</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template> -->

  <xsl:template match="yes">
    <xsl:element name="yesAnswer">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="yesno">
    <xsl:element name="yesNoAnswer">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="zonealt">
    <xsl:element name="zoneAlt">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="zoneid">
    <xsl:element name="zoneIdent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="zoneinfo">
    <xsl:element name="zoneSpec">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="zonelist">
    <xsl:element name="zoneRepository">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="zoneref">
    <xsl:element name="zoneRefGroup">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="zones">
    <xsl:element name="zoneGroup">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="accdopl">
    <xsl:element name="accessDoorOrPanel">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="addmod">
    <xsl:element name="additionalModification">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="authblk">
    <xsl:element name="authorityInfo">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="authrtn">
    <xsl:element name="authorization">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="block">
    <xsl:element name="blockGroupingValue">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="building">
    <xsl:element name="building">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="ccount">
    <xsl:element name="contactCount">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="chapnum">
    <xsl:attribute name="systemCode">
      <xsl:value-of select='translate(text(),"abcdefghijklmnopqrstuvwxyz-_","ABCDEFGHIJKLMNOPQRSTUVWXYZ-_")'/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="cidc">
    <!-- MODIFIED: Converted to assyCode for AGE dms -->
    <xsl:attribute name="assyCode">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="circode">
    <xsl:element name="circuitIdent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="city">
    <xsl:element name="city">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="clc">
    <xsl:element name="connectionListClass">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="clipid">
    <xsl:element name="clippingPoint">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="coax">
    <xsl:element name="coaxialCableFlag">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="colour">
    <xsl:element name="wireColor">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="contactorder">
    <xsl:element name="contactOrderValue">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="core">
    <xsl:element name="numberOfCores">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="country">
    <xsl:element name="country">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="csize">
    <xsl:element name="contactSize">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="ctitle">
    <xsl:element name="commentTitle">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="ddnfilen">
    <xsl:element name="dispatchFileName">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dept">
    <xsl:element name="department">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="description">
    <xsl:element name="descr">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="discode">
    <xsl:attribute name="disassyCode">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="discodev">
    <xsl:attribute name="disassyCodeVariant">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="displayname">
    <xsl:element name="displayName">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>
<!-- 
  <xsl:template match="division">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: division,  NOW:businessUnitName COMMENT: Part of new businessUnit in technical repository -> refer to Table 1 in Transition WP</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template> -->

  <xsl:template match="division">
    <xsl:element name="division">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

<!--   <xsl:template match="diyear">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: diyear,  NOW:@yearOfDataIssue COMMENT: Now an attribute on commentCode, ddnCode, dmlCode</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template> -->

  <xsl:template match="dmcoricn">
    <xsl:element name="entityControlNumber">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dmecode">
    <xsl:attribute name="extensionCode">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="dmeproducer">
    <xsl:attribute name="extensionProducer">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>
<!-- 
  <xsl:template match="dmsize">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">NO CONVERSION: Element dmsize has been removed from S1000D Issue 4.0 and cannot be converted.</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template> -->

  <xsl:template match="dscr">
    <xsl:element name="descr">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="ecscs">
    <!-- MODIFIED: Converted to systemCode for AGE dms -->
    <xsl:attribute name="systemCode">
      <xsl:value-of select='translate(text(),"abcdefghijklmnopqrstuvwxyz-_","ABCDEFGHIJKLMNOPQRSTUVWXYZ-_")'/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="eidc">
    <!-- MODIFIED: Converted to subSystemCode/subsubSystemCode for AGE dms -->
    <xsl:attribute name="subSystemCode">
      <xsl:value-of select="substring(.,1,1)"/>
    </xsl:attribute>
    <xsl:attribute name="subSubSystemCode">
      <xsl:value-of select="substring(.,2)"/>
    </xsl:attribute>
  </xsl:template>

<!--   <xsl:template match="email">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: email,  NOW:email COMMENT: </xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template> -->

  <xsl:template match="emc-code">
    <xsl:element name="emcCode">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="ent-name">
    <xsl:element name="enterpriseName">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

<!--   <xsl:template match="ent-unit">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: ent-unit,  NOW:businessUnitName COMMENT: Part of new businessUnit in technical repository</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template>

  <xsl:template match="ent-unit">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: ent-unit,  NOW:enterpriseUnit COMMENT: In Comment and DDN</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template>
 -->
  <xsl:template match="exmod">
    <xsl:element name="excludedModification">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

<!--   <xsl:template match="fax">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: fax,  NOW:faxNumber COMMENT: </xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template> -->

  <xsl:template match="fcontext">
    <xsl:element name="faultContext">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="fdesc">
    <xsl:element name="descr">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="fic">
    <xsl:element name="functionalItemCode">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="firstname">
    <xsl:element name="firstName">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="fldname">
    <xsl:element name="fieldName">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="groupcode">
    <xsl:element name="groupCode">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="harnissue">
    <xsl:element name="harnessVariantIssue">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="harnvar">
    <xsl:element name="harnessVariantIdent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="help.info">
    <xsl:element name="helpInfo">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="incode">
    <xsl:attribute name="infoCode">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="incodev">
    <xsl:attribute name="infoCodeVariant">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="index-len">
    <xsl:element name="subStringLength">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="index-value">
    <xsl:element name="subStringPosition">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="infoname">
    <xsl:element name="infoName">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="integer">
    <xsl:element name="integerValue">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

<!--   <xsl:template match="internet">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: internet,  NOW:internet COMMENT: </xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template> -->

  <xsl:template match="itemloc">
    <xsl:attribute name="itemLocationCode">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="jobtitle">
    <xsl:element name="jobTitle">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="lastname">
    <xsl:element name="lastName">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="mat">
    <xsl:element name="material">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="maxposition">
    <xsl:element name="maxMountingPositions">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="model">
    <!-- TODO: applic/model suppressed, to be implement in applic conversion -->
  </xsl:template>

  <xsl:template match="modelic">
    <!-- TODO: Verify that upper is required for DMC, should provide as an option to allow detection of the error -->
    <!-- MODIFIED: added translate function to convert to upper case -->
    <xsl:attribute name="modelIdentCode">
      <xsl:value-of select='translate(text(),"abcdefghijklmnopqrstuvwxyz-_","ABCDEFGHIJKLMNOPQRSTUVWXYZ-_")'/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="modtitle">
    <xsl:element name="modificationTitle">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="module">
    <xsl:element name="terminationModuleGroupingValue">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="n2dvalue">
    <xsl:element name="genericPartDataValue">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

<!--   <xsl:template match="name">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: name,  NOW:name COMMENT: applicCrossRefTable and condCrossRefTable</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template> -->

  <xsl:template match="netanacode">
    <xsl:element name="networkAnalysisCode">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="elecequip//nomenc">
    <xsl:element name="equipName">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="harninfo//nomenc">
    <xsl:element name="harnessName">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="notes">
    <xsl:element name="authorityNotes">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="orientation">
    <xsl:element name="orientation">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="outjackcol">
    <xsl:element name="outerJacketColor">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="pconnorder">
    <xsl:element name="potentialConnectionsOrder">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <!-- <xsl:template match="phone"> -->
    <!-- <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable> -->
    <!-- <xsl:variable name="log">**TODO** ELEMENT WAS: phone,  NOW:phoneNumber COMMENT: </xsl:variable> -->
    <!-- <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/> -->
  <!-- </xsl:template> -->

  <xsl:template match="pmissuer">
    <xsl:attribute name="pmIssuer">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="pmnumber">
    <xsl:attribute name="pmNumber">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="pmtitle">
    <xsl:element name="pmTitle">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="pmvolume">
    <xsl:attribute name="pmVolume">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="pobox">
    <xsl:element name="postOfficeBox">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="postcode">
    <xsl:element name="postalZipCode">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="protect">
    <xsl:element name="surfaceProtection">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="province">
    <xsl:element name="province">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="question">
    <xsl:element name="isolationStepQuestion">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="qui">
    <xsl:element name="quantityPerUnit">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="rack">
    <xsl:element name="rack">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="real">
    <xsl:element name="realValue">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="reason">
    <xsl:element name="diagnosticsReason">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="recname">
    <xsl:element name="returnedValueName">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="recposition">
    <xsl:element name="returnedValuePosition">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="recvid">
    <xsl:attribute name="receiverIdent">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="restriction">
    <xsl:element name="restriction">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="room">
    <xsl:element name="room">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="sampling">
    <xsl:element name="sampling">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="screencount">
    <xsl:element name="screenCount">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="screenorder">
    <xsl:element name="screenOrder">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="sdc">
    <xsl:attribute name="systemDiffCode">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="secid">
    <xsl:element name="sectionIdent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="section">
    <xsl:attribute name="subSystemCode">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="sendid">
    <xsl:attribute name="senderIdent">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="sendname">
    <xsl:element name="sendName">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="seqnum">
    <xsl:attribute name="seqNumber">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="shunt">
    <xsl:element name="shuntGroupingValue">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="signal">
    <xsl:element name="signalInfo">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="serialno/single">
    <xsl:element name="serialNumber">
      <xsl:attribute name="serialNumberForm">
        <xsl:text>single</xsl:text>
      </xsl:attribute>
      <xsl:attribute name="serialNumberValue">
        <xsl:value-of select="text()"/>
      </xsl:attribute>
    </xsl:element>
  </xsl:template>

  <xsl:template match="specconn">
    <xsl:element name="specialConnection">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="state">
    <xsl:element name="state">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="statedes">
    <xsl:element name="electricalStateDescr">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="sterm">
    <xsl:element name="specialTerminal">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="street">
    <xsl:element name="street">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="string">
    <xsl:element name="stringValue">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="subject">
    <xsl:attribute name="assyCode">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>


  <xsl:template match="subsect">
    <xsl:attribute name="subSubSystemCode">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

<!--   <xsl:template match="supeqvc">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: supeqvc,  NOW: COMMENT: </xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template> -->


  <xsl:template match="task">
    <!-- MODIFIED: Converted to new required taskDescr -->
    <xsl:element name="task">
      <xsl:apply-templates select="@*"/>
      <xsl:element name="taskDescr">
        <xsl:apply-templates select="node()"/>
      </xsl:element>
    </xsl:element>
  </xsl:template>

  <xsl:template match="techname">
    <xsl:element name="techName">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="techpub">
    <!-- MODIFIED: Techpub handled in reftp -->
    <xsl:apply-templates select="node()"/>
  </xsl:template>

  <xsl:template match="testnomen">
    <xsl:element name="testName">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="text">
    <xsl:element name="paraBasic">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="pmentry/title">
    <xsl:element name="pmEntryTitle">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tminus">
    <xsl:element name="thermoCoupleMinus">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tpbase">
    <xsl:element name="techPubBase">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tplus">
    <xsl:element name="thermoCouplePlus">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="triax">
    <xsl:element name="triaxialCableFlag">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="val">
    <xsl:element name="instructionIdent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="value">
    <xsl:element name="thresholdValue">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="wireno">
    <xsl:element name="wireNumber">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="wireroute">
    <xsl:element name="wireRoute">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="wireseqno">
    <xsl:element name="wireSeqNumber">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="wiretype">
    <xsl:element name="wireType">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="zip">
    <xsl:element name="postalZipCode">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>


  <!--**********************************
              BEGIN ATTRIBUTES
      **********************************-->
  <xsl:template match="@accpnlnbr">
    <xsl:attribute name="accessPointNumber">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@accpnltype">
    <xsl:attribute name="accessPointTypeValue">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@acrotype">
    <xsl:attribute name="acronymType">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@actidref">
    <xsl:attribute name="applicPropertyIdent">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@actreftype">
    <xsl:attribute name="applicPropertyType">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@actvalue">
    <xsl:attribute name="applicPropertyValue">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@actvalues">
    <xsl:attribute name="applicPropertyValues">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@airworthlim">
    <xsl:attribute name="worthinessLimit">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@align">
    <xsl:attribute name="align">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="caption/@align">
    <xsl:attribute name="alignCaption">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="capgrp/@align">
    <xsl:attribute name="alignCaption">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="capentry/@align">
    <xsl:attribute name="alignCaptionEntry">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@alternate">
    <xsl:attribute name="toolAltFlag">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@altnbr">
    <xsl:attribute name="altNumber">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@answer">
    <xsl:attribute name="answerToEntry">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@application">
    <xsl:attribute name="application">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@applicconf">
    <xsl:attribute name="applicConfiguration">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@approval">
    <xsl:attribute name="approval">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@apsid">
    <xsl:attribute name="applicationStructureIdent">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@apsname">
    <xsl:attribute name="applicationStructureName">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@asp">
    <xsl:attribute name="attachStoreShipPartCode">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@authdoc">
    <xsl:attribute name="authorityDocument">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@authname">
    <xsl:attribute name="authorityName">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@authno">
    <xsl:attribute name="authorizationIdent">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@autoplay">
    <xsl:attribute name="autoPlay">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@boardno">
    <xsl:attribute name="infoEntityIdent">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@cancel-caption">
    <xsl:attribute name="cancelCaption">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@cat">
    <xsl:attribute name="timeLimitCategoryValue">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@categ">
    <xsl:attribute name="faultPartCategory">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@category">
    <xsl:attribute name="personCategoryCode">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@catletter">
    <xsl:attribute name="safetyCategoryValue">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@caveat">
    <xsl:attribute name="caveat">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@cbaction">
    <xsl:attribute name="circuitBreakerAction">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@cbnbr">
    <xsl:attribute name="circuitBreakerNumber">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@cbtype">
    <xsl:attribute name="circuitBreakerType">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@cconnect">
    <xsl:attribute name="connectedFlag">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@change">
    <xsl:attribute name="changeType">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@char">
    <xsl:attribute name="char">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@charoff">
    <xsl:attribute name="charoff">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@check">
    <xsl:attribute name="independentCheck">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@checksum">
    <xsl:attribute name="checkSum">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@chginfo">
    <xsl:attribute name="changeInfo">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@choicetype">
    <xsl:attribute name="choiceType">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@class">
    <xsl:attribute name="securityClassification">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@closeup">
    <xsl:attribute name="closeupDuration">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="media/@code">
    <xsl:attribute name="pubMediaCode">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="taskcode/@code">
    <xsl:attribute name="taskCategoryCode">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="test/@code">
    <xsl:attribute name="testCode">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@col">
    <xsl:attribute name="mountColumn">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@colname">
    <xsl:attribute name="colname">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@colnum">
    <xsl:attribute name="colnum">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@colour">
    <xsl:attribute name="color">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@cols">
    <xsl:attribute name="cols">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@colsep">
    <xsl:attribute name="colsep">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@colwidth">
    <xsl:attribute name="colwidth">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@commcls">
    <xsl:attribute name="commercialClassification">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@condition">
    <xsl:attribute name="limitCond">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@conditionidref">
    <xsl:attribute name="condRefId">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@condtyperef">
    <xsl:attribute name="condTypeRefId">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@config">
    <xsl:attribute name="productConfigurationFlag">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@connbr">
    <xsl:attribute name="supplyRqmtNumber">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@conntype">
    <xsl:attribute name="connectionType">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@consupplyref">
    <xsl:attribute name="supplyNumber">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@consupplyreftype">
    <xsl:attribute name="supplyNumberType">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@context">
    <xsl:attribute name="rulesContext">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@contextid">
    <xsl:attribute name="contextIdent">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@controls">
    <xsl:attribute name="showPluginControls">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@coords">
    <xsl:attribute name="objectCoordinates">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@country">
    <xsl:attribute name="countryIsoCode">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@cprio">
    <xsl:attribute name="commentPriorityCode">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@crewmem">
    <xsl:attribute name="crewMemberType">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@csn">
    <xsl:attribute name="catalogSeqNumberValue">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@ctype">
    <xsl:attribute name="contactType">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@day">
    <xsl:attribute name="day">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@default">
    <xsl:attribute name="menuChoiceDefaultFlag">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@descript">
    <xsl:attribute name="objectDescr">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@description">
    <xsl:attribute name="variableDescr">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@destitle">
    <xsl:attribute name="targetTitle">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@direction">
    <xsl:attribute name="listDirection">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@displayclass">
    <xsl:attribute name="applicDisplayClass">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@dotline">
    <xsl:attribute name="separatorStyle">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@drilltyp">
    <xsl:attribute name="drillType">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@duration">
    <xsl:attribute name="runTimeDuration">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@einnbr">
    <xsl:attribute name="functionalItemNumber">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@eintype">
    <xsl:attribute name="functionalItemType">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@emph">
    <xsl:attribute name="emphasisType">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@equipstate">
    <xsl:attribute name="equipState">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@errormsg">
    <xsl:attribute name="errorMessage">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@expgovauth">
    <xsl:attribute name="governmentAuthority">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@expregcodetype">
    <xsl:attribute name="exportRegulationCodeType">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@expregtype">
    <xsl:attribute name="exportRegulationType">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@exprole">
    <xsl:attribute name="exportRole">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@extend">
    <xsl:attribute name="fileExtension">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@fcode">
    <xsl:attribute name="faultCode">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@feccode">
    <xsl:attribute name="sourceTypeCode">
      <xsl:if test="string-length(.)=1">
        <xsl:text>stc0</xsl:text>
      </xsl:if>
      <xsl:if test="string-length(.)=2">
        <xsl:text>stc</xsl:text>
      </xsl:if>
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@fid">
    <xsl:attribute name="fileIdent">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@fieldsize">
    <xsl:attribute name="dataEntryFieldLength">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@flow">
    <xsl:attribute name="menuChoiceFlow">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@frame">
    <xsl:attribute name="frame">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="data/@from">
    <xsl:attribute name="from">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

<!--   <xsl:template match="@from">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: from,  NOW:serialNumberValue COMMENT: Attributes from and to of range now merged into attribute serialNumberValue of serialNumber.</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template> -->

  <xsl:template match="@ftnmark">
    <xsl:attribute name="footnoteMark">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@ftype">
    <xsl:attribute name="faultType">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@fullscrn">
    <xsl:attribute name="fullScreen">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@function">
    <xsl:attribute name="contactFunction">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@gaugetype">
    <xsl:attribute name="wireGaugeType">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@hand">
    <xsl:attribute name="zoneSideValue">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@height">
    <xsl:attribute name="height">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="caption/@height">
    <xsl:attribute name="captionHeight">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="multimediaobject/@height">
    <xsl:attribute name="multimediaObjectHeight">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@highvibration">
    <xsl:attribute name="highVibrationFlag">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@hing">
    <xsl:attribute name="hingedFastenerFlag">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@holeid">
    <xsl:attribute name="holeIdent">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@hydraulic">
    <xsl:attribute name="hydraulicFlag">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@id">
    <xsl:attribute name="id">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@ident">
    <xsl:attribute name="contactIdent">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@identifier">
    <xsl:attribute name="timeLimitIdent">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@inc">
    <xsl:attribute name="replacementCode">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@incorpstatus">
    <xsl:attribute name="incorporationStatus">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@ind">
    <xsl:attribute name="indenture">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@initstate">
    <xsl:attribute name="initialStateFlag">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@insptype">
    <xsl:attribute name="inspectionTypeCategory">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@instid">
    <xsl:attribute name="installationIdent">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@instloctyp">
    <xsl:attribute name="installationLocationType">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@inwork">
    <xsl:attribute name="inWork">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@ippn">
    <xsl:attribute name="initialProvisioningProjectNumber">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@ips">
    <xsl:attribute name="initialProvisioningProjectNumberSubject">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@isn">
    <xsl:attribute name="itemSeqNumberValue">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@issno">
    <xsl:attribute name="issueNumber">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@item">
    <xsl:attribute name="catalogItemNumber">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@itemnbr">
    <xsl:attribute name="supplyRqmtNumber">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

<!--   <xsl:template match="mediaid/@label">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: mediaid/@label,  NOW:label COMMENT: In DDN mediaid> (3.0) / mediaIdent> (4.0) -> refer to Table 2 in Transition WP</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template>

  <xsl:template match="step/@label">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: step/@label,  NOW:stepLabel COMMENT: In crew DM step (3.0) / crewDrillStep (4.0) -> refer to Table 2 in Transition WP</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template> -->

  <xsl:template match="@language">
    <xsl:attribute name="languageIsoCode">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="perskill/@level">
    <xsl:attribute name="skillLevelCode">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

<!--   <xsl:template match="@level">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">NO CONVERSION: Attribute level has been removed from S1000D Issue 4.0 and cannot be converted.</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template> -->

  <xsl:template match="@lge">
    <xsl:attribute name="languageCode">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@local">
    <xsl:attribute name="locallySuppliedFlag">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@location">
    <xsl:attribute name="mediaLocation">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@man">
    <xsl:attribute name="man">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@mandatory">
    <xsl:attribute name="mandatory">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

<!--   <xsl:template match="@mark">
    <xsl:attribute name="changeMark">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template> -->
<!-- 
  <xsl:template match="@memorize">
    <xsl:attribute name="memorizeStepsFlag">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template> -->

  <xsl:template match="@mfc">
    <xsl:attribute name="manufacturerCodeValue">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@minus">
    <xsl:attribute name="toleranceLow">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@modtype">
    <xsl:attribute name="modificationType">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@month">
    <xsl:attribute name="month">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@morerows">
    <xsl:attribute name="morerows">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@mov">
    <xsl:attribute name="modelVersionValue">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@multimediaclass">
    <xsl:attribute name="multimediaType">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@n2did">
    <xsl:attribute name="genericPartDataName">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@name">
    <xsl:attribute name="altName">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

<!--   <xsl:template match="variable/@name">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: variable/@name,  NOW:variableName COMMENT: For variable in process DM and for variable-ref in appliccrossreftable, checklist, comment, container, ddn, dml, pm, process, scormcontentpackage (3.0) / variable> and variableRef> (4.0) -> refer to Table 2 in Transition WP</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template>

  <xsl:template match="variable-ref/@name">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: variable-ref/@name,  NOW:variableName COMMENT: For variable> in process DM and for variable-ref> in appliccrossreftable, checklist, comment, container, ddn, dml, pm, process, scormcontentpackage (3.0) / variable> and variableRef> (4.0) -> refer to Table 2 in Transition WP</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template> -->

  <xsl:template match="@nameend">
    <xsl:attribute name="nameend">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@namest">
    <xsl:attribute name="namest">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@nature">
    <xsl:attribute name="materialCategory">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@ncb">
    <xsl:attribute name="natoCodificationBureau">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@nin3to9">
    <xsl:attribute name="natoItemIdentNumberCore">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@notappl">
    <xsl:attribute name="allowedNotationFlag">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@nsc">
    <xsl:attribute name="natoSupplyClass">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@nsn">
    <xsl:element name="fullNatoStockNumber">
      <xsl:value-of select="."/>      
    </xsl:element>
  </xsl:template>

  <xsl:template match="@objappl">
    <xsl:attribute name="allowedObjectFlag">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@operator">
    <xsl:attribute name="andOr">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@ordered">
    <xsl:attribute name="orderedStepsFlag">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@orient">
    <xsl:attribute name="orient">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@originator">
    <xsl:attribute name="itemOriginator">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

<!--   <xsl:template match="originator/@origname">
    MANUAL MODIFICATION
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: originator/@origname,  NOW:enterpriseName COMMENT: OMITTED Now an element in ELEMENT:originator (4.0)</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template> -->

  <xsl:template match="@paramid">
    <xsl:attribute name="parameterIdent">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@paramname">
    <xsl:attribute name="parameterName">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@paramvalue">
    <xsl:attribute name="parameterValue">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@pattern">
    <xsl:attribute name="valuePattern">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@pgwide">
    <xsl:attribute name="pgwide">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@plus">
    <xsl:attribute name="toleranceHigh">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>
<!-- 
  <xsl:template match="@pnr">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: pnr,  NOW:partNumberValue COMMENT: Attribute under ELEMENT:partIdent and ELEMENT:partRef (techrep)</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template>

  <xsl:template match="@pnr">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: pnr,  NOW:stockNumber COMMENT: Now an element under ELEMENT:itemIdentData (techrep)</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template> -->

  <xsl:template match="@pos">
    <xsl:attribute name="mountPosition">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@position">
    <xsl:attribute name="textDisplayPosition">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

<!--   <xsl:template match="@posttext">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">NO CONVERSION: Attribute posttext has been removed from S1000D Issue 4.0 and cannot be converted.</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template>

  <xsl:template match="@power">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: power,  NOW: COMMENT: Should be coded as a required condition</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template> -->

  <xsl:template match="@precision">
    <xsl:attribute name="valuePrecision">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="randlist/@prefix">
    <xsl:attribute name="listItemPrefix">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="person/@prefix">
    <xsl:attribute name="personPrefix">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@prelreqs">
    <xsl:attribute name="startupDuration">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

<!--   <xsl:template match="@pretext">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">NO CONVERSION: Attribute pretext has been removed from S1000D Issue 4.0 and cannot be converted.</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template> -->

  <xsl:template match="@print-form">
    <xsl:attribute name="humanReadableForm">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@probfac">
    <xsl:attribute name="faultProbability">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@proced">
    <xsl:attribute name="procedureDuration">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@psdtype">
    <xsl:attribute name="significantParaDataType">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@pubcodsy">
    <xsl:attribute name="pubCodingScheme">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@qtygrptype">
    <xsl:attribute name="quantityGroupType">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@qtytoltype">
    <xsl:attribute name="quantityToleranceType">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@qtytype">
    <xsl:attribute name="quantityType">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@qtyuom">
    <xsl:attribute name="quantityUnitOfMeasure">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@reducem">
    <xsl:attribute name="reducedMaint">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@ref1">
    <xsl:attribute name="indexLevelOne">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@ref2">
    <xsl:attribute name="indexLevelTwo">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@ref3">
    <xsl:attribute name="indexLevelThree">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@ref4">
    <xsl:attribute name="indexLevelFour">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@refapplic">
    <xsl:attribute name="applicRefId">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@refapplics">
    <xsl:attribute name="applicRefIds">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@refcsn">
    <xsl:attribute name="catalogSeqNumberValue">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@refid">
    <xsl:attribute name="nextActionRefId">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@refipp">
    <xsl:attribute name="initialProvisioningProjectValue">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@refisn">
    <xsl:attribute name="itemSeqNumberValue">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@refrpc">
    <xsl:attribute name="responsiblePartnerCompanyCode">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@reftype">
    <xsl:attribute name="refType">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@release">
    <xsl:attribute name="releaseEvent">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@reprohgt">
    <xsl:attribute name="reproductionHeight">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@reproscl">
    <xsl:attribute name="reproductionScale">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@reprowid">
    <xsl:attribute name="reproductionWidth">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@reqsource">
    <xsl:attribute name="sourceOfRqmt">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@reset-caption">
    <xsl:attribute name="resetCaption">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@response">
    <xsl:attribute name="actionResponsibility">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@rotate">
    <xsl:attribute name="rotate">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@row">
    <xsl:attribute name="mountRow">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

<!--   <xsl:template match="@rowsep">
    <xsl:attribute name="rowsep">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template> -->

<!--   <xsl:template match="@rpcname">
    MANUAL MODIFICATION
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: rpcname,  NOW:enterpriseName COMMENT: OMITTED, Now an element under ELEMENT:responsiblePartnerCompany</xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template> -->

  <xsl:template match="@rsptype">
    <xsl:attribute name="responseType">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@scope">
    <xsl:attribute name="variableScope">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@scrlevel">
    <xsl:attribute name="screenLevel">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@scrstyle">
    <xsl:attribute name="screenStyle">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@scrtype">
    <xsl:attribute name="screenType">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@select">
    <xsl:attribute name="choiceSelection">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@separator">
    <xsl:attribute name="dialogSeparator">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@seqatt">
    <xsl:attribute name="attachmentNumber">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@seqnum">
    <xsl:attribute name="taskSeqNumber">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@skill">
    <xsl:attribute name="skillLevelCode">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@skilltype">
    <xsl:attribute name="skillType">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@sleevemat">
    <xsl:attribute name="sleeveMaterial">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@sourcenbr">
    <xsl:attribute name="sourceIdent">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@spanname">
    <xsl:attribute name="spanname">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@spcnbr">
    <xsl:attribute name="sparePartClassCode">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@specific">
    <xsl:attribute name="specific">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

<!--   <xsl:template match="@status">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: status,  NOW: COMMENT: </xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template> -->

  <xsl:template match="@subcateg">
    <xsl:attribute name="subCategory">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@submit-caption">
    <xsl:attribute name="submitCaption">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@sup.lev">
    <xsl:attribute name="supervisorLevelCode">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@sysid">
    <xsl:attribute name="systemIdentCode">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@tabstyle">
    <xsl:attribute name="tabstyle">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@target">
    <xsl:attribute name="referredFragment">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@taskcode">
    <xsl:attribute name="taskCode">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@taskid">
    <xsl:attribute name="taskIdent">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@taskname">
    <xsl:attribute name="taskName">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@termpnr">
    <xsl:attribute name="contactPartNumber">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@tgstyle">
    <xsl:attribute name="tgstyle">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@tholdtype">
    <xsl:attribute name="thresholdType">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@title">
    <xsl:attribute name="hotspotTitle">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

<!--   <xsl:template match="@to">
    <xsl:variable name="loc"><xsl:call-template name="get-element-trail"/></xsl:variable>
    <xsl:variable name="log">**TODO** ELEMENT WAS: to,  NOW:serialNumberValue COMMENT: Attributes from and to of range now merged into attribute serialNumberValue of serialNumber.  </xsl:variable>
    <xsl:value-of select="inmed-js:addLogEntry( string( $log ), string( 'log' ), string( $loc ), string( ancestor-or-self::*[1]/@xid ) )"/>
  </xsl:template> -->

  <xsl:template match="data/@to">
    <xsl:attribute name="to">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@tocentry">
    <xsl:attribute name="tocentry">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@toctype">
    <xsl:attribute name="tableOfContentType">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@toolnbr">
    <xsl:attribute name="toolNumber">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@twsttype">
    <xsl:attribute name="twistingType">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="accpnlref/@type">
    <xsl:attribute name="accessPointRefType">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="caption/@type">
    <xsl:attribute name="captionType">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="caution/@type">
    <xsl:attribute name="cautionType">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="ctype/@type">
    <xsl:attribute name="commentType">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="detect/@type">
    <xsl:attribute name="detectionType">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="dmentry/@type">
    <xsl:attribute name="dmEntryType">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="dmltype/@type">
    <xsl:attribute name="dmlType">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="organizationref/@type">
    <xsl:attribute name="enterpriseRefType">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="einref/@type">
    <xsl:attribute name="functionalItemRefType">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="hotspot/@type">
    <xsl:attribute name="hotspotType">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="issno/@type">
    <!-- MANUAL MODIFICATION -->
    <!-- Change: Now handle in dmStatus -->
  </xsl:template>

  <xsl:template match="limittype/@type">
    <xsl:attribute name="limitUnitType">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="schedule/@type">
    <xsl:attribute name="maintPlanningType">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="note/@type">
    <xsl:attribute name="noteType">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="media/@type">
    <xsl:attribute name="pubMediaType">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="spec/@type">
    <xsl:attribute name="specDocumentType">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="conitemalt/@type">
    <xsl:attribute name="supplyRqmtType">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="test/@type">
    <xsl:attribute name="testType">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="toolref/@type">
    <xsl:attribute name="toolRefType">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="firstver/@type">
    <xsl:attribute name="verificationType">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="secver/@type">
    <xsl:attribute name="verificationType">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="warning/@type">
    <xsl:attribute name="warningType">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="zoneref/@type">
    <xsl:attribute name="zoneRefType">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@typex">
    <xsl:attribute name="limitTypeValue">
      <xsl:choose>
        <!-- MODIFIED: TODO: converted "ev" to "co" since EV is not longer allowed. -->
        <xsl:when test="normalize-space(.)='ev'">
          <xsl:text>oc</xsl:text>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="."/>         
        </xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="threshold/@uom">
    <xsl:attribute name="thresholdUnitOfMeasure">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="thresholdInterval/@uom">
    <xsl:attribute name="thresholdUnitOfMeasure">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@uom">
    <xsl:attribute name="unitOfMeasure">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@usgnbr">
    <xsl:attribute name="usageCategoryCode">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@val1">
    <!-- MODIFIED: val1 suppressed and processed in objval -->
  </xsl:template>

  <xsl:template match="@val2">
    <!-- MODIFIED: val1 suppressed and processed in objval -->
  </xsl:template>

  <xsl:template match="@valign">
    <xsl:attribute name="valign">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@valtype">
    <xsl:attribute name="valueForm">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="ftc/@value">
    <xsl:attribute name="fitmentCodeValue">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="rfs/@value">
    <xsl:attribute name="reasonForSelectionValue">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="smf/@value">
    <xsl:attribute name="selectOrManufactureValue">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@valuetype">
    <xsl:attribute name="valueType">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@vendor">
    <xsl:attribute name="vendorFlag">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@visibility">
    <xsl:attribute name="visibility">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@vital">
    <xsl:attribute name="vitalWarningFlag">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@volume">
    <xsl:attribute name="volumeNumber">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@vstyle">
    <xsl:attribute name="verbatimStyle">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@wexdir">
    <xsl:attribute name="wireInstallationDirection">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@width">
    <xsl:attribute name="width">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="caption/@width">
    <xsl:attribute name="captionWidth">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="multimediaobject/@width">
    <xsl:attribute name="multimediaObjectWidth">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@wirelngtyp">
    <xsl:attribute name="wireLengthType">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@wirestate">
    <xsl:attribute name="wireState">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@xidtype">
    <xsl:attribute name="internalRefTargetType">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@xrefid">
    <xsl:attribute name="internalRefId">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@year">
    <xsl:attribute name="year">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@zonenbr">
    <xsl:attribute name="zoneNumber">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@zonetype">
    <xsl:attribute name="zoneType">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>
  
  <xsl:template match="@xid">
    <xsl:attribute name="{name()}"><xsl:value-of select="."/></xsl:attribute>
  </xsl:template>
  
<!--   <xsl:template name="get-set-gr-entity">
  
    <xsl:variable name="reSet" select="inmed-js:resetNotArr()"/>

    <xsl:variable name="pics" select="//*[@boardno]/@boardno"/>

    <xsl:for-each select="xalan:distinct( $pics )">
      <xsl:variable name="boardno" select="."/>
      <xsl:variable name="fileuri" select="unparsed-entity-uri($boardno)"/>
      <xsl:variable name="basename">
        <xsl:call-template name="get-basename">
          <xsl:with-param name="str" select="$fileuri"/>
        </xsl:call-template>
      </xsl:variable>
      
      <!ENTITY  ICN-S1000DBIKE-AAA-D000000-0-U8025-00536-A-04-1 
                SYSTEM 
                "ICN-S1000DBIKE-AAA-D000000-0-U8025-00536-A-04-1.CGM" 
                NDATA cgm
                >
     
      <xsl:variable name="fileref" select="$basename"/>
      <xsl:variable name="notation">
        <xsl:choose>

          <xsl:when test="contains( $fileref, '.gif' ) or
                          contains( $fileref, '.GIF' )">
            <xsl:text>gif</xsl:text>
          </xsl:when>

          <xsl:when test="contains( $fileref, '.jpg' ) or
                          contains( $fileref, '.jpeg' ) or
                          contains( $fileref, '.JPEG' ) or
                          contains( $fileref, '.JPG' )">
            <xsl:text>jpeg</xsl:text>
          </xsl:when>

          <xsl:when test="contains( $fileref, '.png' ) or
                          contains( $fileref, '.PNG' )">
            <xsl:text>png</xsl:text>
          </xsl:when>

          <xsl:when test="contains( $fileref, '.cgm' ) or
                          contains( $fileref, '.CGM' )">
            <xsl:text>cgm</xsl:text>
          </xsl:when>

          <xsl:when test="contains( $fileref, '.pdf' ) or
                          contains( $fileref, '.PDF' )">
            <xsl:text>pdf</xsl:text>
          </xsl:when>

          <xsl:when test="contains( $fileref, '.fax' ) or
                          contains( $fileref, '.FAX' )">
            <xsl:text>fax</xsl:text>
          </xsl:when>

          <xsl:when test="contains( $fileref, '.tif' ) or
                          contains( $fileref, '.TIF' ) or
                          contains( $fileref, '.tiff' ) or
                          contains( $fileref, '.TIFF' )">
            <xsl:text>tiff</xsl:text>
          </xsl:when>

          <xsl:otherwise>cgm</xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
      <xsl:variable name="setNotation" select="inmed-js:addToNotationsAr( string( $notation ) )"/>

      <xsl:if test="string-length( $boardno ) &gt; 0">
        <xsl:text disable-output-escaping="yes">&lt;!ENTITY </xsl:text>
        <xsl:value-of select="$boardno"/>
        <xsl:text> SYSTEM "</xsl:text>
        <xsl:value-of select="$fileref"/>
        <xsl:text>" NDATA </xsl:text>
        <xsl:value-of select="$notation"/>
        <xsl:text disable-output-escaping="yes">&gt;
</xsl:text>
      </xsl:if>
    </xsl:for-each>
    
    <xsl:value-of disable-output-escaping="yes" select="inmed-js:getArrayRetNotation()"/>

  </xsl:template> -->

  <xsl:template name="get-basename">
    <xsl:param name="str"/>
    <xsl:choose>

      <xsl:when test="contains( $str, '/' )">
        <xsl:variable name="this-str" select="substring-after( $str, '/' )"/>
        <xsl:call-template name="get-basename">
          <xsl:with-param name="str" select="$this-str"/>
        </xsl:call-template>
      </xsl:when>

      <xsl:otherwise>
        <xsl:value-of select="$str"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <xsl:template name="get-set-UOM">
    <!-- <estimatedTime unitOfMeasure="d">12</estimatedTime> -->
    <xsl:param name="str" select="."/>
    <xsl:param name="nstr" select="."/>
    <xsl:variable name="strn" select="translate( $nstr, ',' ,'.' )"/>
    <xsl:choose>
      <xsl:when test="string-length( $nstr ) &lt; 1">
        <xsl:value-of select="$str"/>
      </xsl:when>
      <xsl:when test="number( normalize-space( $strn ) )">
        <xsl:choose>
          <xsl:when test="$nstr=$str">
            <xsl:value-of select="$nstr"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:attribute name="unitOfMeasure">
              <xsl:value-of select="normalize-space( substring( $str, 
                                                                number( string-length( $str ) - string-length( $nstr ) ) ) )"/>
            </xsl:attribute>
            <xsl:value-of select="normalize-space( $nstr )"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="get-set-UOM">
          <xsl:with-param name="str" select="$str"/>
          <xsl:with-param name="nstr" 
                          select="normalize-space( substring( $nstr, 1, number( string-length( $nstr ) - 1 ) ) )"/>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <xsl:template name="get-element-trail">
    <xsl:for-each select="ancestor::*">
      <!-- <xsl:sort select="." lang="EN" data-type="text" order="descending" case-order="lower-first"/> -->
      <xsl:variable name="this" select="name(.)"/>
      <xsl:value-of select="name()" />
      <xsl:choose>
        <xsl:when test="@id">[@id='<xsl:value-of select="@id"/>']</xsl:when>
        <xsl:when test="count( preceding-sibling::*[name()=$this] ) &gt; 0 or
                        count( following-sibling::*[name()=$this] )">
          <xsl:text>[</xsl:text><xsl:value-of select="count( preceding-sibling::*[name()=$this] )+1"/><xsl:text>]</xsl:text>
        </xsl:when>
      </xsl:choose>
      <xsl:text>/</xsl:text>
    </xsl:for-each>
    <xsl:if test="not(self::*)"><xsl:text>@</xsl:text></xsl:if>
    <xsl:value-of select="name(.)"/>
  </xsl:template>

</xsl:stylesheet>