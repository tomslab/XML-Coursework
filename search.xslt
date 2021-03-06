<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:param name="genre" />

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
        <ol class="breadcrumb">
            <li><a href="/">Home</a></li>
            <li class="active"><xsl:value-of select="$genre"/></li>
        </ol>
        <div class="clearfix" style="margin-bottom: 20px;"></div>
        <xsl:for-each select="movies/film">
            <xsl:choose>
                <xsl:when test="genres/genre=$genre">
                    <div class="col-xs-12 col-sm-6 col-md-4 col-lg-2">
                        <a href="movie.php?id={@id}">
                            <img src="{media/poster}" class="img-responsive" alt="{title} poster" />
                        </a>
                        <p>
                            <span class="title"><strong><a href="movie.php?film={title}"><xsl:value-of select="title"/></a></strong></span>
                            <br />
                            <xsl:for-each select="genres/genre">
                                <span class="genre"><a href="genre.php?genre={.}"><xsl:value-of select="."/></a></span>
                            </xsl:for-each>
                        </p>
                    </div>
                </xsl:when>
            </xsl:choose>
        </xsl:for-each>
        <!-- <xsl:for-each select="movies/film">
            <a href="movie.html?film={title}">
                <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                    <img src="{media/poster}" class="img-responsive" alt="{title} poster" />
                    <p>
                        <strong><xsl:value-of select="title"/></strong><br />
                        <xsl:for-each select="genres/genre">
                            <span class="genre"><xsl:value-of select="."/></span>
                        </xsl:for-each>
                    </p>
                </div>
            </a>
        </xsl:for-each> -->
    </xsl:template>

</xsl:stylesheet>