<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:param name="talent"/>

    <xsl:template name="content" match="/">
        <xsl:call-template name="name"/>
    </xsl:template>

    <xsl:template name="name">
        <xsl:for-each select="talent/person">
            <xsl:if test="concat(names/firstName,' ',names/lastName)=$talent">
                <h1><xsl:value-of select="$talent"/></h1>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>