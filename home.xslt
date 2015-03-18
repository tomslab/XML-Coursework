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
                Sort by: <a id="filterReleaseDate" href="#">Most recent</a> / <a id="filterRating" href="#">Highest rated</a> / <a id="filterTitles" href="#">Alphabetical</a>
            </p>
        </div>
        <p>Param: <xsl:value-of select="$sortBy"/></p>
        <p>Order: <xsl:value-of select="$order"/></p>
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
                    <xsl:for-each select="story/genres/genre">
                        <span class="genre"><a href="genre.php?genre={.}"><xsl:value-of select="."/></a></span>
                    </xsl:for-each>
                    <br />
                    <span class="genre"><a href="genre.php?genre={.}"><xsl:value-of select="details/releaseDate"/></a></span>
                    <br />
                    <span class="genre"><a href="genre.php?genre={.}"><xsl:value-of select="details/rating"/></a></span>
                </p>
            </div>
            <!-- <p><xsl:value-of select="title"/>, <xsl:value-of select="productionCompany"/></p>
            <img src="{media/poster}" /> -->
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>