<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:param name="sortBy"/>
    <xsl:param name="order"/>

    <xsl:template name="content" match="/">
        <xsl:call-template name="header"/>
        <xsl:call-template name="movie_list"/>
    </xsl:template>

    <xsl:template name="header">
        <ol class="breadcrumb">
            <li class="active">Home</li>
        </ol>
        <div class="clearfix" style="margin-bottom: 20px;"></div>
        <div class="col-xs-12">
            <p id="filter">
                Sort by: <a id="filterReleaseDate" href="#">Most recent</a> / <a id="filterRating" href="#">Highest rated</a> / <a id="filterTitles" href="#">Alphabetical</a>
            </p>
        </div>
    </xsl:template>

    <xsl:template name="movie_list">
        <xsl:for-each select="movies/film">
            <xsl:sort select="*[name()=$sortBy]" order="{$order}"/>
            <div class="col-xs-12 col-sm-6 col-md-4 col-lg-2">
                <a href="movie.php?id={@id}">
                    <xsl:choose>
                        <xsl:when test="titles/subtitle!=''">
                            <img src="img/movie_assets/{titles/title}_{titles/subtitle}/{media/poster}" class="img-responsive rounded poster" alt="{titles/title} {titles/subtitle} poster" />
                        </xsl:when>
                        <xsl:otherwise>
                            <img src="img/movie_assets/{titles/title}_/{media/poster}" class="img-responsive rounded poster" alt="{titles/title} poster" />
                        </xsl:otherwise>
                    </xsl:choose>
                </a>
                <p>
                    <span class="title">
                        <strong>
                            <a href="movie.php?id={@id}">
                                <xsl:value-of select="titles"/> <span class="label label-film pull-right"><xsl:value-of select="rating"/> </span>
                            </a>
                        </strong>
                    </span>
                    <br />
                    <xsl:for-each select="story/genres/genre">
                        <span class="genre"><a href="genre.php?genre={.}"><xsl:value-of select="."/></a></span>
                    </xsl:for-each>
                </p>
            </div>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>