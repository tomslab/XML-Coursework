<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:param name="title" />

	<xsl:template match="/">
		<!-- <xsl:param name="artist" select="Madness" /> -->
		<html>
			<body>
				<h2>My CD Collection</h2>
				<table border="1">
					<tr bgcolor="#9acd32">
						<th>Title</th>
						<th>Artist</th>
					</tr>
					<xsl:for-each select="hitrecords/record">
						<tr>
							<td>
								<xsl:value-of select="title"/>
							</td>
							<xsl:choose>
								<xsl:when test="artist=$title">
									<td bgcolor="#ff00ff">
										<xsl:value-of select="artist"/>
									</td>
								</xsl:when>
								<xsl:otherwise>
									<td>
										<xsl:value-of select="artist"/>
									</td>
								</xsl:otherwise>
							</xsl:choose>
						</tr>
					</xsl:for-each>
				</table>
			</body>
		</html>
	</xsl:template>

</xsl:stylesheet>