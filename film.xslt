<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:param name="id" />
    <!-- <xsl:value-of select="@id"/> -->

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
        <xsl:for-each select="movies/film">
            <xsl:if test="@id=$id">
                <ol class="breadcrumb">
                    <li><a href="/">Home</a></li>
                    <li class="active"><xsl:value-of select="titles/title"/>&#160;<xsl:value-of select="titles/subtitle"/></li>
                </ol>
                <div class="jumbotron" style="background-image: url('{media/hero}'); background-size: cover; background-position: center 30%;">
                    <h1>
                        <xsl:value-of select="titles/title"/>
                        <xsl:choose>
                            <xsl:when test="titles/subtitle!=''">
                                &#160;<span class="light">(&#160;<xsl:value-of select="titles/subtitle"/>&#160;)</span>
                            </xsl:when>
                        </xsl:choose>
                    </h1>
                    <p>
                        <xsl:for-each select="genres/genre">
                            <span class="movie-genre"><a href="genre.html?genre={.}"><xsl:value-of select="."/></a></span>
                        </xsl:for-each>
                    </p>
                    <p id="ratingCalc" style="display: none;"><xsl:value-of select="( rating div 2 )"/></p>
                    <p id="ratingContainer"></p>
                    <p>Certificate<br /><xsl:value-of select="certificate"/></p>
                    <p>Director<br /><xsl:value-of select="crew/director"/></p>
                </div>

                <div class="col-xs-12">
                    <h3>Plot</h3>
                    <p><xsl:value-of select="plot"/></p>
                </div>

                <div id="crew" class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                    <h3>Crew</h3>
                    <p>Director <xsl:value-of select="crew/director"/></p>
                    <xsl:for-each select="crew/writers/writer">
                        <p>Writer <xsl:value-of select="."/></p>
                    </xsl:for-each>
                </div>

                <div id="cast" class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                    <h3>Cast</h3>
                    <xsl:for-each select="cast/character">
                        <p><xsl:value-of select="actor"/>, <xsl:value-of select="name"/></p>
                    </xsl:for-each>
                </div>

                <div id="trailer" class="col-xs-12 col-sm-6 col-md-4 col-lg-6">
                    <div class="embed-responsive embed-responsive-16by9">
                        <iframe class="embed-responsive-item" src="{media/trailer}"></iframe>
                    </div>
                </div>


            </xsl:if>
            <div class="clearfix"></div>
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