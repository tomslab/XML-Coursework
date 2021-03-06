<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:param name="sortBy"/>
    <xsl:param name="order"/>

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
            <li class="active">Home</li>
        </ol>
        <div class="clearfix" style="margin-bottom: 20px;"></div>
        <div class="col-xs-12">
            <p id="filter">
                <a id="releaseDate" href="#">Most recent</a> / <a id="rating" href="#">Highest rated</a> / <a id="titles" href="#">Alphabetical</a>
            </p>
        </div>
        <xsl:for-each select="movies/film">
            <xsl:sort select="*[name()=$sortBy]" order="{$order}"/>
            <div class="col-xs-12 col-sm-6 col-md-4 col-lg-2">
                <a href="movie.php?id={@id}">
                    <img src="{media/poster}" class="img-responsive" alt="{title} poster" />
                </a>
                <p>
                    <span class="title">
                        <strong>
                            <a href="movie.php?id={@id}">
                                <xsl:value-of select="titles"/>
                            </a>
                        </strong>
                    </span>
                    <br />
                    <xsl:for-each select="genres/genre">
                        <span class="genre"><a href="genre.php?genre={.}"><xsl:value-of select="."/></a></span>
                    </xsl:for-each>
                </p>
                <!-- <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><xsl:value-of select="title"/></h3>
                    </div>
                    <div class="panel-body">
                        <img src="{media/poster}" class="img-responsive" alt="{title} poster" />
                        <div class="panelInfo">
                            <p>Released <xsl:value-of select="releaseDate/day"/>&#160;<xsl:value-of select="releaseDate/month"/>&#160;<xsl:value-of select="releaseDate/year"/></p>
                            <xsl:choose>
                                <xsl:when test="runtime/hours!=''">
                                    <p>Runtime <xsl:value-of select="( runtime/hours * 60 ) + runtime/minutes"/> minutes</p>
                                </xsl:when>
                                <xsl:otherwise>
                                    <p class="subtle">Unknown runtime</p>
                                </xsl:otherwise>
                            </xsl:choose>
                        </div>
                    </div>
                </div> -->
            </div>
            <!-- <p><xsl:value-of select="title"/>, <xsl:value-of select="productionCompany"/></p>
            <img src="{media/poster}" /> -->
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>