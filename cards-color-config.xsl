<?xml version="1.0"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xslt="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">

  <!-- ============== mode key-color-choose ================ -->
  <xslt:template match="project" mode="key-color-choose">
    <xslt:choose>
      <!-- orange -->
      <xslt:when test="./@key = 'F6ZM'">#ff9900</xslt:when>
      <!-- green -->
      <xslt:when test="./@key = 'F6MOD'">#99cc00</xslt:when>
      <!-- yellow -->
      <xslt:when test="./@key = 'F6KON'">#fff700</xslt:when>
      <!-- blue -->
      <xslt:when test="./@key = 'F6D'">#99ccff</xslt:when>
      <!-- red -->
      <xslt:when test="./@key = 'SP'">#ff0000</xslt:when>
      <!-- gray -->
      <xslt:otherwise>#aaaaaa</xslt:otherwise>
    </xslt:choose>
  </xslt:template>

  <!-- ============== mode font-color-on-key-color-background ================ -->
  <xslt:template match="project" mode="font-color-on-key-color-background">
    <xslt:choose>
      <!-- orange BG -->
      <xslt:when test="./@key = 'F6ZM'">#ffffff</xslt:when>
      <!-- green BG -->
      <xslt:when test="./@key = 'F6MOD'">#ffffff</xslt:when>
      <!-- yellow BG -->
      <xslt:when test="./@key = 'F6KON'">#666666</xslt:when>
      <!-- blue BG -->
      <xslt:when test="./@key = 'F6D'">#ffffff</xslt:when>
      <!-- red BG -->
      <xslt:when test="./@key = 'SP'">#ffffff</xslt:when>
      <!-- gray BG -->
      <xslt:otherwise>#000000</xslt:otherwise>
    </xslt:choose>
  </xslt:template>

  <xslt:template match="project" mode="font-color-on-transparent-background">#000000</xslt:template>





</xsl:stylesheet>