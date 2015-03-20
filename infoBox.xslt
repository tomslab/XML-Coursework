<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:param name="talent"/>

    <xsl:template name="content" match="/">
        <xsl:call-template name="infoBox"/>
    </xsl:template>

    <xsl:template name="infoBox">
        <xsl:for-each select="talent/person">
            <xsl:if test="concat(names/firstName,' ',names/lastName)=$talent">
                <h2><i class="fa fa-book"></i> Bio</h2>
                <img src="img/talent/{profilePicture}" class="img-responsive rounded profile" alt="{$talent}"/>
                <p><xsl:value-of select="bio"/></p>
                <div class="hidden-xs">
                    <h2><i class="fa fa-twitter"></i> Twitter</h2>
                    <a class="twitter-timeline" height="400" href="https://twitter.com/{twitter}" data-widget-id="{twitter/@widget}">Tweets by @RobertDowneyJr</a>
                </div>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>