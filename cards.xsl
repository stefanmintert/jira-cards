<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format">
  <xsl:import href="xhtml-to-xslfo.xsl"/>

  <xsl:output method="xml" indent="yes"/>
  <xsl:attribute-set name="key">
    <xsl:attribute name="font-size">18pt</xsl:attribute>
    <xsl:attribute name="font-weight">bold</xsl:attribute>
    <xsl:attribute name="text-align">center</xsl:attribute>
    <xsl:attribute name="line-height">18pt</xsl:attribute>
    <xsl:attribute name="linefeed-treatment">preserve</xsl:attribute>
  </xsl:attribute-set>
  <xsl:attribute-set name="points">
    <xsl:attribute name="font-size">36pt</xsl:attribute>
    <xsl:attribute name="font-weight">bold</xsl:attribute>
    <xsl:attribute name="text-align">center</xsl:attribute>
    <xsl:attribute name="line-height">56pt</xsl:attribute>
  </xsl:attribute-set>
  <xsl:attribute-set name="summary">
    <xsl:attribute name="font-size">16pt</xsl:attribute>
    <xsl:attribute name="margin">4pt</xsl:attribute>
  </xsl:attribute-set>
  <xsl:attribute-set name="reporter">
    <xsl:attribute name="margin">4pt</xsl:attribute>
  </xsl:attribute-set>
  <xsl:attribute-set name="border">
    <xsl:attribute name="border">solid 2pt #409C94</xsl:attribute>
  </xsl:attribute-set>
  <xsl:template match="/rss/channel">
    <fo:root>
      <fo:layout-master-set>
        <fo:simple-page-master master-name="one" page-height="10.7cm" page-width="21cm" margin-top="1.0cm"
            margin-bottom="1.0cm" margin-left="1.0cm" margin-right="1.0cm">
          <fo:region-body/>
          <fo:region-before extent="1.0cm"/>
          <fo:region-after extent="1.0cm"/>
        </fo:simple-page-master>
      </fo:layout-master-set>
      <xsl:apply-templates select="item"/>
    </fo:root>
  </xsl:template>

  <xsl:template match="item">
    <fo:page-sequence master-reference="one">
      <fo:flow flow-name="xsl-region-body">
        <fo:block-container position="absolute" top="10pt" left="10pt" bottom="10pt" right="10pt" xsl:use-attribute-sets="border">

          <!-- issue number -->
          <fo:block-container position="absolute" width="60pt" height="48pt" xsl:use-attribute-sets="border" display-align="center">
            <fo:block xsl:use-attribute-sets="key">
              <xsl:variable name="key" select="key"/>
              <xsl:value-of select="translate($key, '-', '&#xA;')"/>
            </fo:block>
          </fo:block-container>

          <!-- summary in center -->
          <fo:block-container position="absolute" left="62pt" height="48pt" right="50pt" xsl:use-attribute-sets="border">
            <fo:block xsl:use-attribute-sets="summary">
              <xsl:value-of select="summary"/>
            </fo:block>
          </fo:block-container>

          <!-- story points -->
          <fo:block-container position="absolute" width="48pt" height="48pt" right="0" xsl:use-attribute-sets="points border">
            <fo:block>
              <xsl:variable name="points" select="customfields/customfield[@id='customfield_10102']/customfieldvalues/customfieldvalue"/>
              <xsl:value-of select="translate($points, '.0', '')"/>
            </fo:block>
          </fo:block-container>

          <!-- reporter and assignee -->
          <fo:block-container position="absolute" top="50pt" height="20pt">
            <fo:block xsl:use-attribute-sets="reporter">
              Reporter:
              <xsl:value-of select="reporter"/>,
              Assignee:
              <xsl:value-of select="assignee"/>
            </fo:block>
          </fo:block-container>

          <!-- description -->
          <fo:block-container position="absolute" top="80pt" left="0pt" height="142pt" right="0pt" xsl:use-attribute-sets="border">
            <fo:block margin="4pt">
              <xsl:apply-templates select="description"/>
            </fo:block>
          </fo:block-container>

        </fo:block-container>
      </fo:flow>
    </fo:page-sequence>
  </xsl:template>

</xsl:stylesheet>
