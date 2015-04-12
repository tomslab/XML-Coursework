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
                    <div class="jumbotron" style="background: rgba(0,0,0,0.3);">
                        <div class="row">
                            <div class="hidden-xs col-sm-2">
                                <img src="img/movie_assets/{titles/title}_{titles/subtitle}/{media/poster}" class="img-responsive rounded poster" alt="{title} poster" />
                                <button type="button" class="btn btn-primary btn-block" onClick="watchTrailer()">Watch trailer</button>
                            </div>
                            <div class="col-xs-12 col-sm-10">
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
                                <p>Director<br /><xsl:value-of select="crew/director"/></p>
                                <div class="row">
                                    <div class="col-xs-12 col-sm-6">
                                        <p>Plot<br /><xsl:value-of select="story/plot"/></p>
                                    </div>
                                </div>
                                <button style="margin-top: 20px;" type="button" class="btn btn-primary btn-lg btn-block visible-xs" onClick="watchTrailer()">Watch trailer</button>
                            </div>
                        </div>
                    </div>
                </div>

                <article>

                    <div id="trailer" class="col-xs-12">
                        <h3><i class="fa fa-desktop"></i>&#160;Trailer<span class="subtle pull-right clickable" onClick="watchTrailer()"><i class="fa fa-times"></i> Close</span></h3>
                        <div class="embed-responsive embed-responsive-16by9">
                            <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/{media/trailer}?wmode=transparent&#38;showinfo=0&#38;iv_load_policy=3&#38;rel=0&#38;vq=HD1080"></iframe>
                        </div>
                    </div>

                    <div id="cast" class="col-xs-12">
                    </div>

                    <div id="storyline" class="col-xs-12 col-sm-6">
                        <h3>Storyline</h3>
                        <p><xsl:value-of select="story/storyline"/></p>
                    </div>

                    <div id="reviews" class="col-xs-12 col-sm-6">
                        <h3>Reviews</h3>
                        <xsl:for-each select="reviews/review">
                            <p><xsl:value-of select="."/><br />
                            <span class="blue"><xsl:value-of select="@author"/></span> &#124; <span class="blue"><xsl:value-of select="@organisation"/></span></p>
                        </xsl:for-each>
                    </div>

                    <div class="clearfix"></div>

                    <div class="col-xs-12 col-md-3">
                        <div id="movieLeft">

                            <h2><i class="fa fa-film"></i>&#160;Information</h2>
                            <img src="img/movie_assets/{titles/title}_{titles/subtitle}/{media/poster}" class="img-responsive rounded poster" alt="{title} poster" />
                            <div class="row">
                                <div class="col-xs-2">
                                    <p><i class="fa fa-clock-o"></i></p>
                                </div>
                                <div class="col-xs-10">
                                    <p>Duration&#160;<xsl:value-of select="(details/runtime/hours * 60) + details/runtime/minutes"/>&#160;minutes</p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-2">
                                    <p><i class="fa fa-video-camera"></i></p>
                                </div>
                                <div class="col-xs-10">
                                    <p><xsl:for-each select="details/companyCredits/productionCompany">
                                        <span class="writtenList"><xsl:value-of select="."/></span>
                                    </xsl:for-each></p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-2">
                                    <p><i class="fa fa-trophy"></i></p>
                                </div>
                                <div class="col-xs-10">
                                    <p>x awards</p>
                                </div>
                            </div>
                            <div class="row">
                                <div id="soundtrack" class="col-xs-12">
                                    <h3>Soundtrack <span class="subtle">&#40;login required&#41;</span></h3>
                                    <iframe src="https://embed.spotify.com/?uri=spotify%3Aalbum%{media/soundtrack}&#38;theme=white" width="100%" height="500" frameborder="0" allowtransparency="true"></iframe>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div id="movieRight" class="col-xs-12 col-md-9">
                        <div class="row">
                            <div class="col-xs-12 col-sm-6">
                                <h3>Storyline</h3>
                                <p><xsl:value-of select="story/storyline"/></p>
                            </div>
                        </div>
                        <h2><i class="fa fa-desktop"></i>&#160;Trailer</h2>
                        <div class="embed-responsive embed-responsive-16by9">
                            <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/{media/trailer}?wmode=transparent&#38;showinfo=0&#38;iv_load_policy=3&#38;rel=0&#38;vq=HD1080"></iframe>
                        </div>

                        <div class="col-xs-12" style="padding-bottom: 100px; background: rgb(253, 253, 192);">
                            <h3>Plot</h3>
                            <p><xsl:value-of select="story/plot"/></p>
                        </div>

                        <div id="crew" class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                            <h3>Crew</h3>
                            <p>Director <xsl:value-of select="crew/director"/></p>
                            <xsl:for-each select="crew/writers/writer">
                                <p>Writer <xsl:value-of select="."/></p>
                            </xsl:for-each>
                        </div>

                        <div id="cast" class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                            <h3>Cast</h3>
                            <xsl:for-each select="cast/character">
                                <div class="row" style="margin-bottom: 20px;">
                                   <div class="col-xs-3">
                                      <div style="background: url(img/talent/robert_downey_jr.jpg); background-size: cover;" class="circle">
                                      </div>
                                  </div>
                                  <div class="col-xs-9">
                                      <p><a href="name.php?name={actor}"><xsl:value-of select="actor"/></a></p>
                                      <p><xsl:value-of select="name"/></p>
                                  </div>
                              </div>
                          </xsl:for-each>
                      </div>

                  </div>

              </article>

                <!-- <div id="trailer" class="col-xs-12 col-sm-6 col-md-4 col-lg-6">
                    <div class="embed-responsive embed-responsive-16by9">
                        <iframe class="embed-responsive-item" src="{media/trailer}"></iframe>
                    </div>
                </div> -->

            </xsl:if>
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