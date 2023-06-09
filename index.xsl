<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8"/>

  <xsl:template match="/">
    <html>
      <head>
        <title>Matadora</title>
      </head>
      <body>
        <h2><xsl:value-of select="cancion/titulo"/></h2>
        <xsl:variable name="totalEstrofas">
         <span><xsl:value-of select="count(cancion/letra/estrofa)"/></span>
        </xsl:variable>
        <xsl:apply-templates select="cancion/letra/estrofa"/>
        <div class="cantidad">
          Total estrofas: <xsl:value-of select="$totalEstrofas"/>
        </div>
        <div class="autor">Autor: <xsl:value-of select="cancion/autor"/></div>
        <div class="tipo"><xsl:value-of select="cancion/tipo"/></div>
      </body>
    </html>
  </xsl:template>
  
  <xsl:template match="estrofa">
    <div class="estrofa">
      <div class="contador">Estrofa <xsl:number level="single"/></div>
      <xsl:variable name="numVersos">
        <p><xsl:value-of select="count(verso)"/></p>
      </xsl:variable>
      <xsl:apply-templates select="verso"/>
      <div class="contador">Total versos: <xsl:value-of select="$numVersos"/></div>
    </div>
  </xsl:template>
  
  <xsl:template match="verso">
    <div class="verso"><xsl:number format="1."/> <xsl:value-of select="."/></div>
  </xsl:template>
</xsl:stylesheet>