<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:param name="title" />

  <xsl:variable name="xx">
    <html>
      <body>
        <xsl:call-template name="show_title">
          <xsl:with-param name="title" />
      </xsl:call-template>
  </body>
</html>
</xsl:variable>

<xsl:template name="show_title" match="/">
    <!-- <xsl:param name="title" select="'Madness'" /> -->
    <p>Hello</p>
    <xsl:for-each select="hitrecords/record">
        <xsl:choose>
            <xsl:when test="artist=$title">
                <p>Title: <xsl:value-of select="$title" /></p>
            </xsl:when>
            <xsl:otherwise>
                <p>No Match <xsl:value-of select="$title" /></p>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:for-each>
</xsl:template>

</xsl:stylesheet>