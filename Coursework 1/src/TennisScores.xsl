<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://www.w3.org/1999/xhtml">
    <xsl:template match="tournament">
        <html>
            <head>
                <link rel="stylesheet" href="tennisscores-xsl.css" type="text/css" />
                <title>BBKSport Tennis Scores</title>
            </head>
            <body>
                <h1>Tennis Scores</h1>
                <h2>
                    <xsl:value-of select="name"/>
                </h2>
                <table cellpadding="2" cellspacing="2">
                    <tr>
                        <th>Round</th>
                        <th style="text-align:left">Player</th>
                        <th>Set 1</th>
                        <th>Set 2</th>
                        <th>Set 3</th>
                        <xsl:variable name="Gender" select="name"/>
                        <xsl:if test="$Gender = 'Wimbledon Men'">
                            <th>Set 4</th>
                            <th>Set 5</th>
                        </xsl:if>
                    </tr>
                    <tr> <td> </td> </tr>
                    <tr> <td> </td> </tr>
                    <xsl:apply-templates select="match"/>
                </table>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="match">
        <xsl:variable name="rNum" select="round"/>
        <xsl:for-each select="player">
            <tr>
                    <td style="text-align:center;"><xsl:value-of select="$rNum"/></td>
                    <xsl:variable name="Outcome" select="outcome"/>
                    <xsl:choose>
                        <xsl:when test="$Outcome = 'won'">
                            <td style="font-weight: bold"><xsl:value-of select="name"/></td>
                        </xsl:when>
                        <xsl:otherwise>
                            <td style=""><xsl:value-of select="name"/></td>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:for-each select="set">
                        <td style="text-align:center">
                            <xsl:value-of select="."/>
                        </td>
                    </xsl:for-each>
            </tr>
        </xsl:for-each>
        <tr> <td> </td> </tr>
        <tr> <td> </td> </tr>
    </xsl:template>
</xsl:stylesheet>