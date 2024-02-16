<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    
    <xsl:output method="html" encoding="UTF-8"/>
    
    <xsl:template match="/">
        <html>
            <style>
                th, td {
                padding: 7px;
                }
                .ms_V2{
                background-color: #add8e6;
                vertical-align:top;
                }
                .ms_B{
                background-color: #87cefa;
                vertical-align:top;
                }
                .ms_G{
                background-color: #87ceeb;
                vertical-align:top;
                }
                .ms_X2{
                background-color: #87ceeb;
                vertical-align:top;
                }
            </style>
            <head>
                <title>Alignement</title>
            </head>
            <body>
                <table  style="width:100%">
                    <tr>
                        <th>§</th>
                        <th>V2</th>
                        <th>B</th>
                        <th>G</th>
                        <th>X2</th>
                    </tr>
                    <xsl:apply-templates/>
                </table>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="teiHeader"/>
    
    <xsl:template match="div[@type='alignment']">
        <tr>
            <td>
                <!--<xsl:value-of select="preceding-sibling::milestone[1]/@n"/>  -->
                <xsl:value-of select="count(preceding-sibling::div[@type='alignment'])+1"/>
            </td>
            <xsl:apply-templates/>
        </tr>
    </xsl:template>
    
    <xsl:template match="ab[@type='ms_instance']">

        <xsl:choose>
            <xsl:when test="seg[@type='witness']='V2'">
                <td class="ms_V2">
                    <xsl:text>f°</xsl:text><xsl:value-of select="seg[@type='location']"/>
                    <br/>
                    <xsl:if test="seg[@type='rubric']">
                        <i style="color: #801818;"><xsl:value-of select="seg[@type='rubric']"/></i>
                        <br/>
                    </xsl:if>
                    <xsl:text>§ </xsl:text><i><xsl:value-of select="seg[@type='paragraph']"/></i>
                    <xsl:if test="seg[@type='note']">
                        <br/><hr/>
                        <xsl:value-of select="seg[@type='note']"/>
                    </xsl:if>
                </td>
            </xsl:when>
            <xsl:when test="seg[@type='witness']='V3'">
                <td class="ms_V2">
                    <xsl:text>f°</xsl:text><xsl:value-of select="seg[@type='location']"/>
                    <br/>
                    <xsl:if test="seg[@type='rubric']">
                        <i style="color: #801818;"><xsl:value-of select="seg[@type='rubric']"/></i>
                        <br/>
                    </xsl:if>
                    <xsl:text>§ </xsl:text><i><xsl:value-of select="seg[@type='paragraph']"/></i>
                    <xsl:if test="seg[@type='note']">
                        <br/><hr/>
                        <xsl:value-of select="seg[@type='note']"/>
                    </xsl:if>
                </td>
            </xsl:when>
            <xsl:when test="seg[@type='witness']='B'">
                <td class="ms_B">
                    <xsl:text>f°</xsl:text><xsl:value-of select="seg[@type='location']"/>
                    <br/>
                    <xsl:if test="seg[@type='rubric']">
                        <i style="color: #801818;"><xsl:value-of select="seg[@type='rubric']"/></i>
                        <br/>
                    </xsl:if>
                    <xsl:text>§ </xsl:text><i><xsl:value-of select="seg[@type='paragraph']"/></i>
                    <xsl:if test="seg[@type='note']">
                        <br/><hr/>
                        <xsl:value-of select="seg[@type='note']"/>
                    </xsl:if>
                </td>
            </xsl:when>
            <xsl:when test="seg[@type='witness']='G'">
                <td class="ms_G">
                    <xsl:text>f°</xsl:text><xsl:value-of select="seg[@type='location']"/>
                    <br/>
                    <xsl:if test="seg[@type='rubric']">
                        <i style="color: #801818;"><xsl:value-of select="seg[@type='rubric']"/></i>
                        <br/>
                    </xsl:if>
                    <xsl:text>§ </xsl:text><i><xsl:value-of select="seg[@type='paragraph']"/></i>
                    <xsl:if test="seg[@type='note']">
                        <br/><hr/>
                        <xsl:value-of select="seg[@type='note']"/>
                    </xsl:if>
                </td>
            </xsl:when>
            <xsl:when test="seg[@type='witness']='X2'">
                <td class="ms_X2">
                    <xsl:text>f°</xsl:text><xsl:value-of select="seg[@type='location']"/>
                    <br/>
                    <xsl:if test="seg[@type='rubric']">
                        <i style="color: #801818;"><xsl:value-of select="seg[@type='rubric']"/></i>
                        <br/>
                    </xsl:if>
                    <xsl:text>§ </xsl:text><i><xsl:value-of select="seg[@type='paragraph']"/></i>
                    <xsl:if test="seg[@type='note']">
                        <br/><hr/>
                        <xsl:value-of select="seg[@type='note']"/>
                    </xsl:if>
                </td>
            </xsl:when>
            <xsl:otherwise>
                <td>
                    <xsl:text>f°</xsl:text><xsl:value-of select="seg[@type='location']"/>
                    <br/>
                    <xsl:if test="seg[@type='rubric']">
                        <i style="color: #801818;"><xsl:value-of select="seg[@type='rubric']"/></i>
                        <br/>
                    </xsl:if>
                    <xsl:text>§ </xsl:text><i><xsl:value-of select="seg[@type='paragraph']"/></i>
                    <xsl:if test="seg[@type='note']">
                        <br/><hr/>
                        <xsl:value-of select="seg[@type='note']"/>
                    </xsl:if>
                </td>        
            </xsl:otherwise>
        </xsl:choose>
        
    </xsl:template>

</xsl:stylesheet>