<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:param name="id" />
    <!-- <xsl:value-of select="@id"/> -->

    <xsl:variable name="xx">
        <html>
            <body>
                <xsl:call-template name="cast">
                    <xsl:with-param name="title" />
                </xsl:call-template>
            </body>
        </html>
    </xsl:variable>

    <xsl:template name="cast" match="/">
        <h3><i class="fa fa-street-view"></i>&#160;Cast<span class="subtle pull-right clickable"><i class="fa fa-caret-down"></i> See full cast</span></h3>
        <div class="row">
            <xsl:for-each select="talent/person">
                <xsl:if test="appearances/character/@film=$id">
                    <div class="col-xs-6 col-sm-4 col-md-2">
                        <img class="img-responsive rounded" src="img/talent/{profilePicture}" alt="{names}" />
                        <h4><a href="name.php?name={names}"><xsl:value-of select="names"/></a></h4>
                        <p><xsl:value-of select="appearances/character[@film=$id]"/></p>
                    </div>
                </xsl:if>
            </xsl:for-each>
        </div>
    </xsl:template>

</xsl:stylesheet>