<?xml version="1.0"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xslt="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">  
  <xsl:import href="xhtml-to-xslfo.xsl"/>
  <xsl:include href="cards-config.xsl"/>

  <xslt:param name="tmp" select="'/tmp'"/>

  <xsl:output method="xml"  encoding="us-ascii" indent="yes"/>
  
  <xsl:attribute-set name="description">
    <xsl:attribute name="font-size">10pt</xsl:attribute>
    <xsl:attribute name="line-height">15pt</xsl:attribute>
    <xsl:attribute name="overflow">hidden</xsl:attribute>
  </xsl:attribute-set>
  <xsl:attribute-set name="key">
    <xsl:attribute name="font-size">14pt</xsl:attribute>
    <xsl:attribute name="font-weight">bold</xsl:attribute>
    <xsl:attribute name="text-align">center</xsl:attribute>
    <xsl:attribute name="line-height">18pt</xsl:attribute>
    <xsl:attribute name="linefeed-treatment">preserve</xsl:attribute>
  </xsl:attribute-set>
  <xsl:attribute-set name="points">
    <xsl:attribute name="font-size">12pt</xsl:attribute>
    <xsl:attribute name="font-weight">bold</xsl:attribute>
    <xsl:attribute name="text-align">center</xsl:attribute>
    <xsl:attribute name="line-height">24pt</xsl:attribute>
  </xsl:attribute-set>
  <xsl:attribute-set name="summary">
    <xsl:attribute name="font-size">16pt</xsl:attribute>
    <xsl:attribute name="margin">4pt</xsl:attribute>
  </xsl:attribute-set>
  <xsl:attribute-set name="reporter">
    <xsl:attribute name="margin">4pt</xsl:attribute>
    <xsl:attribute name="font-size">10pt</xsl:attribute>
  </xsl:attribute-set>
  <xsl:attribute-set name="border">
    <xsl:attribute name="border">solid 2pt</xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:template name="attribute-set-color-orange">
    <xsl:attribute name="border-color">#ff9900</xsl:attribute>
  </xsl:template>
  <xsl:template name="attribute-set-color-green">
    <xsl:attribute name="border-color">#99cc00</xsl:attribute>
  </xsl:template>
  <xsl:template name="attribute-set-color-yellow">
    <xsl:attribute name="border-color">#fff700</xsl:attribute>
  </xsl:template>
  <xsl:template name="attribute-set-color-lightblue">
    <xsl:attribute name="border-color">#99ccff</xsl:attribute>
  </xsl:template>
  <xsl:template name="attribute-set-color-red">
    <xsl:attribute name="border-color">#ff0000</xsl:attribute>
  </xsl:template>
  <xsl:template name="attribute-set-color-lightgray">
    <xsl:attribute name="border-color">#aaaaaa</xsl:attribute>
  </xsl:template>
  <xsl:template name="attribute-set-color-default">
    <xsl:attribute name="border-color">#409C94</xsl:attribute>
  </xsl:template>



  <!-- ============== mode extractDescriptions ================ -->
  <xsl:template match="/rss/channel" mode="extractDescriptions">
    <xslt:variable
      name="descriptionXmlFileTimestamp">
      <xslt:value-of select="$tmp"/>
      <xslt:text>/descriptions.timestamp</xslt:text>
    </xslt:variable>
    <xslt:result-document method="xml" href="{$descriptionXmlFileTimestamp}">
      <body>
        dummy
      </body>
    </xslt:result-document>   
    <xslt:apply-templates select="//description" mode="#current"/>
  </xsl:template>


  <xslt:template match="description"  mode="extractDescriptions">
    <xslt:variable name="descriptionXmlFile">
      <xslt:value-of select="$tmp"/>
      <xslt:text>/description-</xslt:text>
      <xslt:value-of select="generate-id()"></xslt:value-of>
      <xslt:text>.xml</xslt:text>
    </xslt:variable>

    
    <xslt:result-document method="xml" href="{$descriptionXmlFile}">
      <body>
        <xslt:value-of select="." disable-output-escaping="yes"/>
      </body>
    </xslt:result-document>

    <!--
    <xslt:message terminate="no">
      ################################
      <xslt:value-of select="$descriptionXmlFile" disable-output-escaping="yes"/>
    </xslt:message>
    -->
</xslt:template>




  <!-- ============== mode default ================ -->

  <xsl:template match="/rss/channel">
    <fo:root>
      <fo:layout-master-set>
        <fo:simple-page-master master-name="one" page-height="14.8cm" page-width="21cm" margin-top="1.0cm"
            margin-bottom="1.0cm" margin-left="1.5cm" margin-right="0.5cm">
          <fo:region-body/>
          <fo:region-before extent="1.0cm"/>
          <fo:region-after extent="1.0cm"/>
        </fo:simple-page-master>
      </fo:layout-master-set>
      <xsl:apply-templates select="item"/>
    </fo:root>
  </xsl:template>


  <!-- issue number -->
  <xslt:template match="key">
    <fo:block-container
      position="absolute"
      width="64pt"
      height="48pt"
      display-align="center"
      xsl:use-attribute-sets="border"
      >
      <xslt:apply-templates select="." mode="color-choose"/>
      <fo:block xsl:use-attribute-sets="key">
        <xsl:value-of select="translate(., '-', '&#xA;')"/>
      </fo:block>
    </fo:block-container>
  </xslt:template>
  
  <xsl:template match="item">
    <fo:page-sequence master-reference="one">
      <fo:flow flow-name="xsl-region-body">
        <fo:block-container
          position="absolute"
          top="10pt"
          left="10pt"
          bottom="10pt"
          right="10pt"
          overflow="hidden"
          xsl:use-attribute-sets="border"
          >
          <xslt:apply-templates select="." mode="color-choose"/>
        
          <xslt:apply-templates select="key"/>
          <xslt:apply-templates select="summary"/>
          <xslt:apply-templates select="type"/>

          <!--
          <!- - story points - ->
          <fo:block-container position="absolute" width="48pt" height="48pt" right="0" xsl:use-attribute-sets="points border">
            <fo:block>
              <xsl:variable name="points" select="customfields/customfield[@id='customfield_10102']/customfieldvalues/customfieldvalue"/>
              <xsl:value-of select="translate($points, '.0', '')"/>
            </fo:block>
        </fo:block-container>
          -->


          <fo:block-container position="absolute" left="0pt" top="50pt" height="auto">
            
            <xslt:apply-templates select="reporter"/>
            
            <fo:block xsl:use-attribute-sets="reporter">
              <xslt:apply-templates select="issuelinks/issuelinktype"/>
            </fo:block>
            
            
            <xslt:apply-templates select="description"/>
            
          </fo:block-container>


        </fo:block-container>
      </fo:flow>
    </fo:page-sequence>
  </xsl:template>

  <xslt:template match="reporter">
      <fo:block xsl:use-attribute-sets="reporter">
        Reporter:
        <xslt:apply-templates/>,
        <xslt:apply-templates select="../assignee"/>
      </fo:block>
  </xslt:template>
  
  <xslt:template match="assignee">
      Assignee:
      <xslt:apply-templates/>
  </xslt:template>
  
  <xslt:template match="type">
    <fo:block-container
      position="absolute"
      width="96pt"
      height="48pt"
      right="0"
      display-align="center"
      xsl:use-attribute-sets="points border"
      >
      <xslt:apply-templates select="." mode="color-choose"/>
      <fo:block>
        <xslt:apply-templates></xslt:apply-templates>
      </fo:block>
    </fo:block-container>
  </xslt:template>
  
  <xslt:template match="summary">
    <fo:block-container
      position="absolute"
      left="66pt"
      height="48pt"
      right="98pt"
      overflow="hidden"
      text-align="center"
      display-align="center"
      xsl:use-attribute-sets="border"
      >
      <xslt:apply-templates select="." mode="color-choose"/>
      <fo:block xsl:use-attribute-sets="summary">
        <xslt:apply-templates></xslt:apply-templates>
      </fo:block>
    </fo:block-container>
  </xslt:template>
  
  <xslt:template match="issuelinks/issuelinktype" >
        <xslt:for-each-group select="outwardlinks[./issuelink/issuekey/@id = //key/@id] | 
                                     inwardlinks[./issuelink/issuekey/@id = //key/@id]" 
                             group-by="@description"> <!-- the filter expression suppresses all links to issues, which are not contained in the processed XML -->
                             
                <!-- grouping is necessary, because "relates to" can be an outwardlink and an inwardlink -->
                <xsl:value-of select="current-grouping-key()"/>
                <xslt:text>: </xslt:text>
                <xslt:apply-templates select="current-group()"/>
        </xslt:for-each-group>
  </xslt:template>

  <xslt:template match="outwardlinks | inwardlinks" >
         <xslt:apply-templates select="issuelink/issuekey"/>
  </xslt:template>

  <xslt:template match="issuelink/issuekey">
        <xslt:value-of select="."/>
        <xslt:text> </xslt:text>
  </xslt:template>

  <xslt:template match="description" >
    <xslt:variable name="descriptionXmlFile">
      <xslt:value-of select="$tmp"/>
      <xslt:text>/description-</xslt:text>
      <xslt:value-of select="generate-id()"></xslt:value-of>
      <xslt:text>.xml</xslt:text>
    </xslt:variable>
    <fo:block
      margin="0pt"
      font-size="10pt"
      border-width="2px 0px 0px 0px"
      padding="4pt"
      xsl:use-attribute-sets="border"
      >
      <xslt:apply-templates select="." mode="color-choose"/>

                <xslt:apply-templates select="document($descriptionXmlFile)"/>

        </fo:block>



  </xslt:template>

  <!-- ============== mode color-choose ================ -->

  <xslt:template match="key|summary|type" mode="color-choose">
    <xsl:attribute name="color">
      <xslt:apply-templates
        select="ancestor-or-self::item/project"
        mode="font-color-on-key-color-background"/>
    </xsl:attribute>
    <xsl:attribute name="border-color">
      <xslt:apply-templates
        select="ancestor-or-self::item/project"
        mode="key-color-choose"/>
    </xsl:attribute>
    <xsl:attribute name="background-color">
      <xslt:apply-templates
        select="ancestor-or-self::item/project"
        mode="key-color-choose"/>
    </xsl:attribute>
  </xslt:template>

  <xslt:template match="item|description" mode="color-choose">
    <xsl:attribute name="color">
      <xslt:apply-templates
        select="ancestor-or-self::item/project"
        mode="font-color-on-transparent-background"/>
    </xsl:attribute>
    <xsl:attribute name="border-color">
      <xslt:apply-templates
        select="ancestor-or-self::item/project"
        mode="key-color-choose"/>
    </xsl:attribute>
    <xsl:attribute name="background-color">transparent</xsl:attribute>
  </xslt:template>

  

  <!-- ========================== xhtml to fo overrides ================================ -->
  
  <xsl:template match="body">
    <xsl:apply-templates select="*|text()"/>
  </xsl:template>


</xsl:stylesheet>
