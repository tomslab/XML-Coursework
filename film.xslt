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
                <div style="background-image: url('img/movie_assets/{titles/title}_{titles/subtitle}/{media/hero}'); background-size: cover; background-position: center 30%;">
                    <div class="jumbotron">
                        <div class="row">
                            <div class="hidden-xs col-sm-4 col-md-3 col-lg-2">
                                <img src="img/movie_assets/{titles/title}_{titles/subtitle}/{media/poster}" class="img-responsive rounded poster" alt="{title} poster" />
                                <button type="button" id="trailer-button" class="btn btn-primary btn-block" onClick="watchTrailer()">Watch trailer</button>
                                <button type="button" id="soundtrack-button" class="btn btn-info btn-block" onClick="playSoundtrack()">Play soundtrack</button>
                            </div>
                            <div class="col-xs-12 col-sm-8 col-md-9 col-lg-10">
                                <div class="row">
                                    <div class="col-xs-12 col-sm-12 col-md-7 col-lg-8">
                                        <h1>
                                            <xsl:value-of select="titles/title"/>
                                            <xsl:choose>
                                                <xsl:when test="titles/subtitle!=''">
                                                    &#160;<span class="light">(&#160;<xsl:value-of select="titles/subtitle"/>&#160;)</span>
                                                </xsl:when>
                                            </xsl:choose>
                                        </h1>
                                        <p>
                                            <xsl:for-each select="story/genres/genre">
                                                <span class="movie-genre"><a href="genre.php?genre={.}"><xsl:value-of select="."/></a></span>
                                            </xsl:for-each>
                                        </p>
                                        <p class="rating"><xsl:value-of select="rating"/></p>
                                        <p><span style="border:1px solid white; padding:0px 4px 2px 2px; margin-right: 6px;"><xsl:value-of select="details/certificate"/></span><xsl:value-of select="(details/runtime/hours)"/>hr <xsl:value-of select="(details/runtime/minutes)"/>min</p>

                                        <p><i class="fa fa-trophy"></i>&#160;<xsl:value-of select="count(awards/award[contains(@win, 'true')])" />&#160;awards&#160;<span class="subtle">(&#160;<xsl:value-of select="count(awards/award[contains(@win, 'false')])" />&#160;nominations&#160;)</span></p>

                                        <p>Director<br /><xsl:value-of select="crew/director"/></p>
                                        <div class="row">
                                            <div class="col-xs-12 col-sm-12 col-md-8">
                                                <p>Plot<br /><xsl:value-of select="story/plot"/></p>
                                            </div>
                                        </div>

                                    </div>

                                    <div class="col-xs-12 col-sm-12 col-md-5 col-lg-4">

                                        <div id="soundtrack">
                                            <h3>Soundtrack <span class="subtle">&#40;login required&#41;</span></h3>
                                            <iframe src="https://embed.spotify.com/?uri=spotify%3Aalbum%{media/soundtrack}&#38;theme=white" width="100%" height="400" frameborder="0" allowtransparency="true"></iframe>
                                        </div>

                                    </div>
                                </div>

                                <button id="trailer-mobile-button" style="margin-top: 20px;" type="button" class="btn btn-primary btn-lg btn-block visible-xs" onClick="watchTrailer()">Watch trailer</button>
                                <button id="soundtrack-mobile-button" style="margin: 20px 0;" type="button" class="btn btn-info btn-lg btn-block visible-xs" onClick="playSoundtrackMobile()">Play soundtrack</button>

                                <div id="trailer">
                                    <div class="embed-responsive embed-responsive-16by9">
                                        <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/{media/trailer}?wmode=transparent&#38;showinfo=0&#38;iv_load_policy=3&#38;rel=0&#38;vq=hd1080&#38;theme=light"></iframe>
                                    </div>
                                </div>

                                <div id="soundtrack-mobile">
                                    <h3>Soundtrack <span class="subtle">&#40;login required&#41;</span></h3>
                                    <iframe src="https://embed.spotify.com/?uri=spotify%3Aalbum%{media/soundtrack}&#38;theme=white" width="100%" height="500" frameborder="0" allowtransparency="true"></iframe>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>

                <article>

                    <div id="storyline" class="col-xs-12 col-sm-4">
                        <h3>Storyline</h3>
                        <p><xsl:value-of select="story/storyline"/></p>
                    </div>

                    <div id="details" class="col-xs-12 col-sm-8">
                        <h3>Details</h3>
                        <div class="row">
                            <div class="col-sm-4">
                                <h5>Release</h5>
                                <p>
                                    Released&#160;<span class="blue"><xsl:value-of select="releaseDate/day"/>&#160;<xsl:value-of select="releaseDate/month"/>&#160;<xsl:value-of select="releaseDate/year"/></span>
                                    <br />
                                    Available in&#160;
                                    <span class="blue">
                                        <xsl:for-each select="details/languages/language">
                                            <span class="writtenList"><xsl:value-of select="."/></span>
                                        </xsl:for-each>
                                    </span>
                                </p>
                                <h5>Company Credits</h5>
                                <p>
                                    Production Co.&#160;
                                    <span class="blue">
                                        <xsl:for-each select="details/companyCredits/productionCompany">
                                            <span class="writtenList"><xsl:value-of select="."/></span>
                                        </xsl:for-each>
                                    </span>
                                </p>
                            </div>
                            <div class="col-sm-4">
                                <h5>Box Office</h5>
                                <p>
                                    Budget&#160;<span class="blue"><xsl:value-of select="details/boxOffice/@currency"/><xsl:value-of select="details/boxOffice/budget"/></span>
                                    <xsl:if test="details/boxOffice/budget/@estimated='true'">
                                        &#160;<span class="subtle">(estimated)</span>
                                    </xsl:if>
                                    <br />
                                    Opening Weekend&#160;<span class="blue"><xsl:value-of select="details/boxOffice/@currency"/><xsl:value-of select="details/boxOffice/openingWeekend"/></span>
                                    &#160;<span class="subtle">(<xsl:value-of select="details/boxOffice/openingWeekend/@country"/>)</span>
                                    <br />
                                    Gross&#160;<span class="blue"><xsl:value-of select="details/boxOffice/@currency"/><xsl:value-of select="details/boxOffice/gross"/></span>
                                    &#160;<span class="subtle">(<xsl:value-of select="details/boxOffice/gross/@country"/>&#160;&#124;&#160;<xsl:value-of select="details/boxOffice/gross/@date"/>)</span>
                                </p>
                            </div>
                            <div class="col-sm-4">
                                <h5>Awards</h5>
                                <xsl:for-each select="awards/award">
                                    <p>
                                        <xsl:value-of select="@organisation"/><br />
                                        <span class="blue"><xsl:value-of select="@nomination"/></span>
                                        <span class="subtle">
                                            <xsl:if test="@win='true'">
                                                (Won)
                                            </xsl:if>
                                            <xsl:if test="@win='false'">
                                                (Nominated)
                                            </xsl:if>
                                        </span>
                                    </p>
                                </xsl:for-each>
                            </div>
                        </div>
                    </div>

                    <div class="clearfix"></div>

                    <div id="cast" class="col-xs-12">
                    </div>

                    <div class="clearfix"></div>

                    <div id="media" class="col-xs-12">
                        <h3>Media</h3>

                        <!-- <div class="media-container">
                            <div><div class="media-box rounded" style="background: url('img/movie_assets/Avengers_Assemble/media1.jpg');"></div></div>
                            <div><div class="media-box rounded" style="background: url('img/movie_assets/Avengers_Assemble/media2.jpg');"></div></div>
                            <div><div class="media-box rounded" style="background: url('img/movie_assets/Avengers_Assemble/media3.jpg');"></div></div>
                            <div><div class="media-box rounded" style="background: url('img/movie_assets/Avengers_Assemble/media4.jpg');"></div></div>
                            <div><div class="media-box rounded" style="background: url('img/movie_assets/Avengers_Assemble/media5.jpg');"></div></div>
                            <div><div class="media-box rounded" style="background: url('img/movie_assets/Avengers_Assemble/media6.jpg');"></div></div>
                            <div><div class="media-box rounded" style="background: url('img/movie_assets/Avengers_Assemble/media7.jpg');"></div></div>
                            <div><div class="media-box rounded" style="background: url('img/movie_assets/Avengers_Assemble/media8.jpg');"></div></div>
                        </div> -->

                    </div>

                    <div class="clearfix"></div>

                    <div id="reviews" class="col-xs-12 col-sm-6">
                        <h3>Reviews</h3>
                        <xsl:for-each select="reviews/review">
                            <p><xsl:value-of select="."/><br />
                            <span class="blue"><xsl:value-of select="@author"/></span> &#124; <span class="blue"><xsl:value-of select="@organisation"/></span></p>
                        </xsl:for-each>
                    </div>

                    <div class="clearfix"></div>

                </article>

            </xsl:if>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>