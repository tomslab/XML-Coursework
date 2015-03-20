<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:param name="talent" />

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
        <h2><i class="fa fa-film"></i>  Films</h2>
        <div class="row">
            <xsl:for-each select="movies/film">
                <xsl:sort select="releaseDate" order="descending"/>
                <xsl:choose>
                    <xsl:when test="cast/character/actor=$talent">
                        <div class="col-xs-12 col-lg-6 col-xl-4 movieList">
                            <div class="row">
                                <div class="col-xs-3 col-lg-4">
                                    <a href="movie.php?id={@id}">
                                        <img src="img/movie_assets/{titles/title}_{titles/subtitle}/{media/poster}" class="img-responsive rounded poster" alt="{title} poster" />
                                    </a>
                                </div>
                                <div class="col-xs-9 col-lg-8">
                                    <h2>
                                        <a href="movie.php?id={@id}"><xsl:value-of select="titles"/>&#160;&#40;<xsl:value-of select="releaseDate/year"/>&#41;</a>
                                    </h2>
                                    <p class="rating"><xsl:value-of select="rating"/></p>
                                    <p class="hidden-xs"><xsl:value-of select="story/plot"/></p>
                                    <xsl:for-each select="story/genres/genre">
                                        <span class="genre"><a href="genre.php?genre={.}"><xsl:value-of select="."/></a></span>
                                    </xsl:for-each>
                                </div>
                            </div>
                            <div class="visible-xs">
                                <hr style="margin-top: 10px; margin-bottom: 25px;" />
                            </div>
                        </div>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
        </div>
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