<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:param name="element"/>

    <xsl:template name="content" match="/">
        <xsl:call-template name="header"/>
    </xsl:template>

    <xsl:template name="header">
        <ol class="breadcrumb">
            <li><a href="/">Home</a></li>
            <li class="active"><xsl:value-of select="$element"/></li>
        </ol>
        <div class="clearfix" style="margin-bottom: 20px;"></div>
    </xsl:template>

</xsl:stylesheet>