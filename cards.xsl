<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:svg="http://www.w3.org/2000/svg">
  <xsl:import href="xhtml-to-xslfo.xsl"/>

  <xsl:output method="xml" indent="yes"/>
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
      <fo:flow font-size="10pt" line-height="10pt" flow-name="xsl-region-body">
        <fo:block-container position="absolute" top="10pt" left="10pt" bottom="10pt" right="10pt"
                            xsl:use-attribute-sets="border">
          <fo:block-container position="absolute" width="60pt" height="20pt"
                              xsl:use-attribute-sets="border">
            <fo:block text-align="center" vertical-align="middle" height="20pt" line-height="20pt" font-weight="bold">
              <xsl:value-of select="key"/>
            </fo:block>
          </fo:block-container>
          <fo:block-container position="absolute" width="60pt" height="20pt" right="0"
                              xsl:use-attribute-sets="border">
            <fo:block text-align="center" vertical-align="middle" height="20pt" line-height="20pt" font-weight="bold">
              <xsl:value-of
                      select="customfields/customfield[@id='customfield_10102']/customfieldvalues/customfieldvalue"/>
            </fo:block>
          </fo:block-container>
          <fo:block-container position="absolute" left="60pt" height="20pt" right="60pt"
                              xsl:use-attribute-sets="border">
            <fo:block text-align="center" vertical-align="middle" height="20pt" line-height="20pt" font-weight="bold">
              <xsl:value-of select="summary"/>
            </fo:block>
          </fo:block-container>
          <fo:block-container position="absolute" top="24pt" left="10pt" height="160pt" right="10pt"
                              xsl:use-attribute-sets="border">
            <fo:block>
              <xsl:apply-templates select="description"/>
            </fo:block>
          </fo:block-container>

        </fo:block-container>
      </fo:flow>
    </fo:page-sequence>
  </xsl:template>

</xsl:stylesheet>
