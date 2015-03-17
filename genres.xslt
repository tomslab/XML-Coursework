<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:variable name="xx">
        <html>
            <body>
                <xsl:call-template name="show_title">
                </xsl:call-template>
            </body>
        </html>
    </xsl:variable>

    <xsl:template name="show_title" match="/">
        <h1>sixteen<br /><span style="color:#4876AB;">by</span>nine</h1>
        <ul class="nav main-nav nav-pills nav-stacked">
            <li role="presentation" class="active">
                <a href="/">
                    <div class="row">
                        <div class="col-md-2">
                            <span class="glyphicon glyphicon-home" aria-hidden="true"></span>
                        </div>
                        <div class="col-md-10">
                            Home
                        </div>
                    </div>
                </a>
            </li>
            <li role="presentation" class="dropdown" id="category">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-expanded="false">
                    <div class="row">
                        <div class="col-md-2">
                            <span class="glyphicon glyphicon-filter" aria-hidden="true"></span>
                        </div>
                        <div class="col-md-7">
                            Category
                        </div>
                        <div class="col-md-3">
                            <span class="caret"></span>
                        </div>
                    </div>
                </a>
            </li>
            <ul class="nav nav-pills nav-stacked" id="category-dropdown" style="display:none;">
                <xsl:for-each select="movies/film/genres/genre[not(.=preceding::*)]">
                    <xsl:sort select="."/>
                    <li role="presentation"><a href="genre.php?genre={.}"><div class="row"><div class="col-md-10 col-md-offset-2">
                        <xsl:value-of select="."/>
                    </div></div></a></li>
                </xsl:for-each>
            </ul>
            <li role="presentation"><a href="#"><div class="row">
                <div class="col-md-2">
                    <span class="glyphicon glyphicon-apple" aria-hidden="true"></span>
                </div>
                <div class="col-md-10">
                    About
                </div>
            </div></a></li>
        </ul>
    </xsl:template>

</xsl:stylesheet>