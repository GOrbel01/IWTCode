<xsl:stylesheet version="1.0"
            xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
        <xsl:template match="FFPEOPLE">
        <html>
            <head>
            </head>
            <body>
                <h1><xsl:value-of select="docName"/></h1>
                <table cellpadding="2" cellspacing="2">
                    <tr>
                        <th>Name</th>
                        <th>Gender</th>
                        <th>Game</th>
                        <th>Materia</th>
                        <th>Ultimate Weapon</th>
                        <th>Relations</th>
                    </tr>
                    <xsl:variable name="inline-array">
                        <class sort="1">VII</class>
                        <class sort="2">VIII</class>
                        <class sort="3">IX</class>
                        <class sort="4">X</class>
                    </xsl:variable>
                    <xsl:variable name="array"
                                  select="document('')/*/xsl:variable[@name='inline-array']/*" />
                        <xsl:apply-templates select = "character">
                        <!--<xsl:apply-templates select="character">-->

                    <xsl:sort select="$array[. = current()/@game]/@sort" />
                    </xsl:apply-templates>
                </table>
            </body>
        </html>
        </xsl:template>

        <xsl:template match="character">
            <tr>
                <td>
                    <xsl:value-of select="name"/>
                </td>
                <xsl:variable name="GVar" select="gender"/>
                <xsl:choose>
                    <!--Take care of bold for the Winner-->
                    <xsl:when test="$GVar = 'Male'">
                        <td style="color: blue"><xsl:value-of select="gender"/></td>
                    </xsl:when>
                    <xsl:otherwise>
                        <td style="color: #F41FC4"><xsl:value-of select="gender"/></td>
                    </xsl:otherwise>
                </xsl:choose>
                <td>
                    <xsl:value-of select="game"/>
                </td>
                <td>
                    <xsl:apply-templates select="materialist"/>
                </td>
                <td>
                    <xsl:value-of select="ultimateweapon"/>
                </td>
                <td>
                    <xsl:apply-templates select="relations"/>
                </td>
            </tr>
        </xsl:template>

        <xsl:template match="materialist">
            <td>
                <xsl:for-each select="materia">
                    <xsl:variable name="MateriaType" select="mtype"/>
                    <xsl:choose>
                        <xsl:when test="$MateriaType='4'">
                            <tr style="color: red">
                                <xsl:variable name="mCount" select="position()"/>
                                <xsl:if test="$mCount > 1">
                                    <xsl:text> </xsl:text>
                                </xsl:if>
                                <xsl:value-of select="$mCount"/>
                                <xsl:text>.</xsl:text>
                                <xsl:value-of select="mname"/>
                            </tr>
                        </xsl:when>
                        <xsl:when test="$MateriaType='3'">
                            <tr style="color: green">
                                <xsl:variable name="mCount" select="position()"/>
                                <xsl:if test="$mCount > 1">
                                    <xsl:text> </xsl:text>
                                </xsl:if>
                                <xsl:value-of select="$mCount"/>
                                <xsl:text>.</xsl:text>
                                <xsl:value-of select="mname"/>
                            </tr>
                        </xsl:when>
                        <xsl:when test="$MateriaType='2'">
                            <tr style="color: #E7E836">
                                <xsl:variable name="mCount" select="position()"/>
                                <xsl:if test="$mCount > 1">
                                    <xsl:text> </xsl:text>
                                </xsl:if>
                                <xsl:value-of select="$mCount"/>
                                <xsl:text>.</xsl:text>
                                <xsl:value-of select="mname"/>
                            </tr>
                        </xsl:when>
                        <xsl:otherwise>
                            <tr style="color: black">
                                <xsl:variable name="mCount" select="position()"/>
                                <xsl:if test="$mCount > 1">
                                    <xsl:text> </xsl:text>
                                </xsl:if>
                                <xsl:value-of select="$mCount"/>
                                <xsl:text>.</xsl:text>
                                <xsl:value-of select="mname"/>
                            </tr>
                        </xsl:otherwise>
                    </xsl:choose>

                </xsl:for-each>
            </td>
        </xsl:template>

        <xsl:template match="relations">
            <xsl:for-each select="relation">
                <xsl:variable name="rCount" select="position()"/>
                <xsl:if test="$rCount > 1">
                    <xsl:text> </xsl:text>
                </xsl:if>
                <xsl:value-of select="$rCount"/>
                <xsl:text>.</xsl:text>
                <xsl:value-of select="."/>
            </xsl:for-each>
        </xsl:template>
</xsl:stylesheet>