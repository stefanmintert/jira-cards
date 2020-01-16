<?xml version="1.0"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xslt="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">

  <!-- ============== mode key-color-choose ================ -->
  <xslt:template match="project" mode="key-color-choose">
    <xslt:choose>
      <!-- orange -->
      <xslt:when test="./@key = 'AAAA'">#ff9900</xslt:when>
      <!-- green -->
      <xslt:when test="./@key = 'BBBB'">#99cc00</xslt:when>
      <!-- yellow -->
      <xslt:when test="./@key = 'CCCC'">#fff700</xslt:when>
      <!-- blue -->
      <xslt:when test="./@key = 'DDDD'">#99ccff</xslt:when>
      <!-- red -->
      <xslt:when test="./@key = 'EEEE'">#ff0000</xslt:when>
      <!-- violet -->
      <xslt:when test="./@key = 'FFFF'">#7f00ff</xslt:when>
      <!-- gray -->
      <xslt:otherwise>#aaaaaa</xslt:otherwise>
    </xslt:choose>
  </xslt:template>

  <!-- ============== mode font-color-on-key-color-background ================ -->
  <xslt:template match="project" mode="font-color-on-key-color-background">
    <xslt:choose>
      <!-- orange BG -->
      <xslt:when test="./@key = 'AAAA'">#ffffff</xslt:when>
      <!-- green BG -->
      <xslt:when test="./@key = 'BBBB'">#ffffff</xslt:when>
      <!-- yellow BG -->
      <xslt:when test="./@key = 'CCCC'">#666666</xslt:when>
      <!-- blue BG -->
      <xslt:when test="./@key = 'DDDD'">#ffffff</xslt:when>
      <!-- red BG -->
      <xslt:when test="./@key = 'EEEE'">#ffffff</xslt:when>
      <!-- violet BG -->
      <xslt:when test="./@key = 'FFFF'">#ffffff</xslt:when>
      <!-- gray BG -->
      <xslt:otherwise>#000000</xslt:otherwise>
    </xslt:choose>
  </xslt:template>

  <xslt:template match="project" mode="font-color-on-transparent-background">#000000</xslt:template>





</xsl:stylesheet>