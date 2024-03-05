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
                .ms_V1{
                background-color: #add8e6;
                vertical-align:top;
                }
                .ms_V2{
                background-color: #add8e6;
                vertical-align:top;
                }
                .ms_V3{
                background-color: #add8e6;
                vertical-align:top;
                }
                .ms_B{
                background-color: #87cefa;
                vertical-align:top;
                }
                .ms_G{
                background-color: #71c5e7;
                vertical-align:top;
                }
                .ms_X1{
                background-color: #87ceeb;
                vertical-align:top;
                }
                .ms_X2{
                background-color: #87ceeb;
                vertical-align:top;
                }
                .ms_R{
                background-color: #166484;
                vertical-align:top;
                }
                .ms_C{
                background-color: #19349a;
                vertical-align:top;
                }
                .subblock::before { 
               
                }
                .subblock{
                display: block;
                padding-top:1em;
                margin-top:1em;
                border-top: dashed #434343;
                }
            </style>
            <head>
                <title>Alignement du C7S</title>
            </head>
            <body>
                <table  style="width:100%">
                    <tr>
                        <th>Chapitres</th>
                        <th>V</th>
                        <th>B</th>
                        <th>G</th>
                        <th>X</th>
                        <th>R</th>
                        <th>C</th>
                    </tr>
                    <xsl:apply-templates/>
                </table>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="teiHeader"/><!-- offrir accès au projectDesc du TeiHeader pour documenter le tableau directement sur la page HTML -->
    
    <xsl:template match="div[@type='alignment']">
        <tr>
            <td>
                <xsl:value-of select="preceding-sibling::milestone[1]/@xml:id"/>
                <!-- <xsl:value-of select="count(preceding-sibling::div[@type='alignment'])+1"/> -->
            </td>
            <xsl:apply-templates/>
        </tr>
    </xsl:template>
    
    <xsl:template match="ab[@type='ms_instance']">
        
        <xsl:choose>
            <xsl:when test="seg[@type='witness']='V1'">
                <td class="ms_V2">
                    <xsl:text>f°</xsl:text><xsl:value-of select="seg[@type='location']"/>
                    <br/>
                    <xsl:if test="seg[@type='rubric']">
                        <i style="color: #801818;"><xsl:value-of select="seg[@type='rubric']"/></i>
                        <br/>
                    </xsl:if>
                    <xsl:if test="seg[@type='incipit']">
                        <b style="color: #801818;"><xsl:value-of select="seg[@type='incipit']"/></b>
                        <br/>
                    </xsl:if>
                    <xsl:if test="seg[@type='explicit']">
                        <b style="color: #801818;"><xsl:value-of select="seg[@type='explicit']"/></b>
                        <br/>
                    </xsl:if>
                    <xsl:if test="seg[@type='note']">
                        <br/><hr/>
                        <xsl:value-of select="seg[@type='note']"/>
                    </xsl:if>
                </td>
            </xsl:when>
            <xsl:when test="seg[@type='witness']='V2'">
                <td class="ms_V2">
                    <xsl:text>f°</xsl:text><xsl:value-of select="seg[@type='location']"/>
                    <br/>
                    <xsl:if test="seg[@type='rubric']">
                        <i style="color: #801818;"><xsl:value-of select="seg[@type='rubric']"/></i>
                        <br/>
                    </xsl:if>
                    <xsl:if test="seg[@type='incipit']">
                        <b style="color: #801818;"><xsl:value-of select="seg[@type='incipit']"/></b>
                        <br/>
                    </xsl:if>
                    <xsl:if test="seg[@type='explicit']">
                        <b style="color: #801818;"><xsl:value-of select="seg[@type='explicit']"/></b>
                        <br/>
                    </xsl:if>
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
                    <xsl:if test="seg[@type='incipit']">
                        <b style="color: #801818;"><xsl:value-of select="seg[@type='incipit']"/></b>
                        <br/>
                    </xsl:if>
                    <xsl:if test="seg[@type='explicit']">
                        <b style="color: #801818;"><xsl:value-of select="seg[@type='explicit']"/></b>
                        <br/>
                    </xsl:if>
                    <xsl:if test="seg[@type='note']">
                        <br/><hr/>
                        <xsl:value-of select="seg[@type='note']"/>
                    </xsl:if>
                </td>
            </xsl:when>
            <xsl:when test="seg[@type='witness']='B'">
                <xsl:choose>
                    <xsl:when test="not(following-sibling::ab/seg[@type='witness']='B') and not(preceding-sibling::ab/seg[@type='witness']='B')">
                        <td class="ms_B">
                            <xsl:text>f°</xsl:text><xsl:value-of select="seg[@type='location']"/>
                            <br/>
                            <xsl:if test="seg[@type='rubric']">
                                <i style="color: #801818;"><xsl:value-of select="seg[@type='rubric']"/></i>
                                <br/>
                            </xsl:if>
                            <xsl:if test="seg[@type='incipit']">
                                <b style="color: #801818;"><xsl:value-of select="seg[@type='incipit']"/></b>
                                <br/>
                            </xsl:if>
                            <xsl:if test="seg[@type='explicit']">
                                <b style="color: #801818;"><xsl:value-of select="seg[@type='explicit']"/></b>
                                <br/>
                            </xsl:if>
                            <xsl:if test="seg[@type='note']">
                                <br/><hr/>
                                <xsl:value-of select="seg[@type='note']"/>
                            </xsl:if>
                        </td>
                    </xsl:when>
                    <xsl:when test="not(preceding-sibling::ab/seg[@type='witness']='B')">
                        <td class="ms_B">
                            <xsl:text>f°</xsl:text><xsl:value-of select="seg[@type='location']"/>
                            <br/>
                            <xsl:if test="seg[@type='rubric']">
                                <i style="color: #801818;"><xsl:value-of select="seg[@type='rubric']"/></i>
                                <br/>
                            </xsl:if>
                            <xsl:if test="seg[@type='incipit']">
                                <b style="color: #801818;"><xsl:value-of select="seg[@type='incipit']"/></b>
                                <br/>
                            </xsl:if>
                            <xsl:if test="seg[@type='explicit']">
                                <b style="color: #801818;"><xsl:value-of select="seg[@type='explicit']"/></b>
                                <br/>
                            </xsl:if>
                            <xsl:if test="seg[@type='note']">
                                <br/><hr/>
                                <xsl:value-of select="seg[@type='note']"/>
                            </xsl:if>
                            <xsl:if test="following-sibling::ab[1]/seg[@type='witness']='B'">
                                <span class="subblock">
                                <xsl:text>f°</xsl:text><xsl:value-of select="following-sibling::ab[1]/seg[@type='location']"/>
                                <br/>
                                <xsl:if test="following-sibling::ab[1]/seg[@type='rubric']">
                                    <i style="color: #801818;"><xsl:value-of select="following-sibling::ab[1]/seg[@type='rubric']"/></i>
                                    <br/>
                                </xsl:if>
                                <xsl:if test="following-sibling::ab[1]/seg[@type='incipit']">
                                    <b style="color: #801818;"><xsl:value-of select="following-sibling::ab[1]/seg[@type='incipit']"/></b>
                                    <br/>
                                </xsl:if>
                                <xsl:if test="following-sibling::ab[1]/seg[@type='explicit']">
                                    <b style="color: #801818;"><xsl:value-of select="following-sibling::ab[1]/seg[@type='explicit']"/></b>
                                    <br/>
                                </xsl:if>
                                <xsl:if test="following-sibling::ab[1]/seg[@type='note']">
                                    <br/><hr/>
                                    <xsl:value-of select="following-sibling::ab[1]/seg[@type='note']"/>
                                </xsl:if>
                                </span>
                            </xsl:if>
                            <xsl:if test="following-sibling::ab[2]/seg[@type='witness']='B'">
                                <span class="subblock">
                                <xsl:text>f°</xsl:text><xsl:value-of select="following-sibling::ab[2]/seg[@type='location']"/>
                                <br/>
                                <xsl:if test="following-sibling::ab[2]/seg[@type='rubric']">
                                    <i style="color: #801818;"><xsl:value-of select="following-sibling::ab[2]/seg[@type='rubric']"/></i>
                                    <br/>
                                </xsl:if>
                                <xsl:if test="following-sibling::ab[2]/seg[@type='incipit']">
                                    <b style="color: #801818;"><xsl:value-of select="following-sibling::ab[2]/seg[@type='incipit']"/></b>
                                    <br/>
                                </xsl:if>
                                <xsl:if test="following-sibling::ab[2]/seg[@type='explicit']">
                                    <b style="color: #801818;"><xsl:value-of select="following-sibling::ab[2]/seg[@type='explicit']"/></b>
                                    <br/>
                                </xsl:if>
                                <xsl:if test="following-sibling::ab[2]/seg[@type='note']">
                                    <br/><hr/>
                                    <xsl:value-of select="following-sibling::ab[2]/seg[@type='note']"/>
                                </xsl:if>
                                </span>
                            </xsl:if>
                            <xsl:if test="following-sibling::ab[3]/seg[@type='witness']='B'">
                                <span class="subblock">
                                    <xsl:text>f°</xsl:text><xsl:value-of select="following-sibling::ab[3]/seg[@type='location']"/>
                                    <br/>
                                    <xsl:if test="following-sibling::ab[3]/seg[@type='rubric']">
                                        <i style="color: #801818;"><xsl:value-of select="following-sibling::ab[3]/seg[@type='rubric']"/></i>
                                        <br/>
                                    </xsl:if>
                                    <xsl:if test="following-sibling::ab[3]/seg[@type='incipit']">
                                        <b style="color: #801818;"><xsl:value-of select="following-sibling::ab[3]/seg[@type='incipit']"/></b>
                                        <br/>
                                    </xsl:if>
                                    <xsl:if test="following-sibling::ab[3]/seg[@type='explicit']">
                                        <b style="color: #801818;"><xsl:value-of select="following-sibling::ab[3]/seg[@type='explicit']"/></b>
                                        <br/>
                                    </xsl:if>
                                    <xsl:if test="following-sibling::ab[3]/seg[@type='note']">
                                        <br/><hr/>
                                        <xsl:value-of select="following-sibling::ab[3]/seg[@type='note']"/>
                                    </xsl:if>
                                </span>
                            </xsl:if>
                        </td>
                    </xsl:when>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="seg[@type='witness']='X1'">
                <xsl:choose>
                    <xsl:when test="not(following-sibling::ab/seg[@type='witness']='X1') and not(preceding-sibling::ab/seg[@type='witness']='X1')">
                        <td class="ms_X1">
                            <xsl:text>f°</xsl:text><xsl:value-of select="seg[@type='location']"/>
                            <br/>
                            <xsl:if test="seg[@type='rubric']">
                                <i style="color: #801818;"><xsl:value-of select="seg[@type='rubric']"/></i>
                                <br/>
                            </xsl:if>
                            <xsl:if test="seg[@type='incipit']">
                                <b style="color: #801818;"><xsl:value-of select="seg[@type='incipit']"/></b>
                                <br/>
                            </xsl:if>
                            <xsl:if test="seg[@type='explicit']">
                                <b style="color: #801818;"><xsl:value-of select="seg[@type='explicit']"/></b>
                                <br/>
                            </xsl:if>
                            <xsl:if test="seg[@type='note']">
                                <br/><hr/>
                                <xsl:value-of select="seg[@type='note']"/>
                            </xsl:if>
                        </td>
                    </xsl:when>
                    <xsl:when test="not(preceding-sibling::ab/seg[@type='witness']='X1')">
                        <td class="ms_X1">
                            <xsl:text>f°</xsl:text><xsl:value-of select="seg[@type='location']"/>
                            <br/>
                            <xsl:if test="seg[@type='rubric']">
                                <i style="color: #801818;"><xsl:value-of select="seg[@type='rubric']"/></i>
                                <br/>
                            </xsl:if>
                            <xsl:if test="seg[@type='incipit']">
                                <b style="color: #801818;"><xsl:value-of select="seg[@type='incipit']"/></b>
                                <br/>
                            </xsl:if>
                            <xsl:if test="seg[@type='explicit']">
                                <b style="color: #801818;"><xsl:value-of select="seg[@type='explicit']"/></b>
                                <br/>
                            </xsl:if>
                            <xsl:if test="seg[@type='note']">
                                <br/><hr/>
                                <xsl:value-of select="seg[@type='note']"/>
                            </xsl:if>
                            <xsl:if test="following-sibling::ab[1]/seg[@type='witness']='X1'">
                                <span class="subblock">
                                    <xsl:text>f°</xsl:text><xsl:value-of select="following-sibling::ab[1]/seg[@type='location']"/>
                                    <br/>
                                    <xsl:if test="following-sibling::ab[1]/seg[@type='rubric']">
                                        <i style="color: #801818;"><xsl:value-of select="following-sibling::ab[1]/seg[@type='rubric']"/></i>
                                        <br/>
                                    </xsl:if>
                                    <xsl:if test="following-sibling::ab[1]/seg[@type='incipit']">
                                        <b style="color: #801818;"><xsl:value-of select="following-sibling::ab[1]/seg[@type='incipit']"/></b>
                                        <br/>
                                    </xsl:if>
                                    <xsl:if test="following-sibling::ab[1]/seg[@type='explicit']">
                                        <b style="color: #801818;"><xsl:value-of select="following-sibling::ab[1]/seg[@type='explicit']"/></b>
                                        <br/>
                                    </xsl:if>
                                    <xsl:if test="following-sibling::ab[1]/seg[@type='note']">
                                        <br/><hr/>
                                        <xsl:value-of select="following-sibling::ab[1]/seg[@type='note']"/>
                                    </xsl:if>
                                </span>
                            </xsl:if>
                        </td>
                    </xsl:when>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="seg[@type='witness']='X2'">
                <xsl:choose>
                    <xsl:when test="not(following-sibling::ab/seg[@type='witness']='X2') and not(preceding-sibling::ab/seg[@type='witness']='X2')">
                        <td class="ms_X2">
                            <xsl:text>f°</xsl:text><xsl:value-of select="seg[@type='location']"/>
                            <br/>
                            <xsl:if test="seg[@type='rubric']">
                                <i style="color: #801818;"><xsl:value-of select="seg[@type='rubric']"/></i>
                                <br/>
                            </xsl:if>
                            <xsl:if test="seg[@type='incipit']">
                                <b style="color: #801818;"><xsl:value-of select="seg[@type='incipit']"/></b>
                                <br/>
                            </xsl:if>
                            <xsl:if test="seg[@type='explicit']">
                                <b style="color: #801818;"><xsl:value-of select="seg[@type='explicit']"/></b>
                                <br/>
                            </xsl:if>
                            <xsl:if test="seg[@type='note']">
                                <br/><hr/>
                                <xsl:value-of select="seg[@type='note']"/>
                            </xsl:if>
                        </td>
                    </xsl:when>
                    <xsl:when test="not(preceding-sibling::ab/seg[@type='witness']='X2')">
                        <td class="ms_X2">
                            <xsl:text>f°</xsl:text><xsl:value-of select="seg[@type='location']"/>
                            <br/>
                            <xsl:if test="seg[@type='rubric']">
                                <i style="color: #801818;"><xsl:value-of select="seg[@type='rubric']"/></i>
                                <br/>
                            </xsl:if>
                            <xsl:if test="seg[@type='incipit']">
                                <b style="color: #801818;"><xsl:value-of select="seg[@type='incipit']"/></b>
                                <br/>
                            </xsl:if>
                            <xsl:if test="seg[@type='explicit']">
                                <b style="color: #801818;"><xsl:value-of select="seg[@type='explicit']"/></b>
                                <br/>
                            </xsl:if>
                            <xsl:if test="seg[@type='note']">
                                <br/><hr/>
                                <xsl:value-of select="seg[@type='note']"/>
                            </xsl:if>
                            <xsl:if test="following-sibling::ab[1]/seg[@type='witness']='X2'">
                                <span class="subblock">
                                    <xsl:text>f°</xsl:text><xsl:value-of select="following-sibling::ab[1]/seg[@type='location']"/>
                                    <br/>
                                    <xsl:if test="following-sibling::ab[1]/seg[@type='rubric']">
                                        <i style="color: #801818;"><xsl:value-of select="following-sibling::ab[1]/seg[@type='rubric']"/></i>
                                        <br/>
                                    </xsl:if>
                                    <xsl:if test="following-sibling::ab[1]/seg[@type='incipit']">
                                        <b style="color: #801818;"><xsl:value-of select="following-sibling::ab[1]/seg[@type='incipit']"/></b>
                                        <br/>
                                    </xsl:if>
                                    <xsl:if test="following-sibling::ab[1]/seg[@type='explicit']">
                                        <b style="color: #801818;"><xsl:value-of select="following-sibling::ab[1]/seg[@type='explicit']"/></b>
                                        <br/>
                                    </xsl:if>
                                    <xsl:if test="following-sibling::ab[1]/seg[@type='note']">
                                        <br/><hr/>
                                        <xsl:value-of select="following-sibling::ab[1]/seg[@type='note']"/>
                                    </xsl:if>
                                </span>
                            </xsl:if>
                        </td>
                    </xsl:when>
                </xsl:choose>
            </xsl:when>            
            <xsl:when test="seg[@type='witness']='G'">
                <td class="ms_G">
                    <xsl:text>f°</xsl:text><xsl:value-of select="seg[@type='location']"/>
                    <br/>
                    <xsl:if test="seg[@type='rubric']">
                        <i style="color: #801818;"><xsl:value-of select="seg[@type='rubric']"/></i>
                        <br/>
                    </xsl:if>
                    <xsl:if test="seg[@type='incipit']">
                        <b style="color: #801818;"><xsl:value-of select="seg[@type='incipit']"/></b>
                        <br/>
                    </xsl:if>
                    <xsl:if test="seg[@type='explicit']">
                        <b style="color: #801818;"><xsl:value-of select="seg[@type='explicit']"/></b>
                        <br/>
                    </xsl:if>
                    <xsl:if test="seg[@type='note']">
                        <br/><hr/>
                        <xsl:value-of select="seg[@type='note']"/>
                    </xsl:if>
                </td>
            </xsl:when>
            <xsl:when test="seg[@type='witness']='R'">
                <xsl:choose>
                    <xsl:when test="not(following-sibling::ab/seg[@type='witness']='R') and not(preceding-sibling::ab/seg[@type='witness']='R')">
                        <td class="ms_R">
                            <xsl:text>f°</xsl:text><xsl:value-of select="seg[@type='location']"/>
                            <br/>
                            <xsl:if test="seg[@type='rubric']">
                                <i style="color: #801818;"><xsl:value-of select="seg[@type='rubric']"/></i>
                                <br/>
                            </xsl:if>
                            <xsl:if test="seg[@type='incipit']">
                                <b style="color: #801818;"><xsl:value-of select="seg[@type='incipit']"/></b>
                                <br/>
                            </xsl:if>
                            <xsl:if test="seg[@type='explicit']">
                                <b style="color: #801818;"><xsl:value-of select="seg[@type='explicit']"/></b>
                                <br/>
                            </xsl:if>
                            <xsl:if test="seg[@type='note']">
                                <br/><hr/>
                                <xsl:value-of select="seg[@type='note']"/>
                            </xsl:if>
                        </td>
                    </xsl:when>
                    <xsl:when test="not(preceding-sibling::ab/seg[@type='witness']='R')">
                        <td class="ms_R">
                            <xsl:text>f°</xsl:text><xsl:value-of select="seg[@type='location']"/>
                            <br/>
                            <xsl:if test="seg[@type='rubric']">
                                <i style="color: #801818;"><xsl:value-of select="seg[@type='rubric']"/></i>
                                <br/>
                            </xsl:if>
                            <xsl:if test="seg[@type='incipit']">
                                <b style="color: #801818;"><xsl:value-of select="seg[@type='incipit']"/></b>
                                <br/>
                            </xsl:if>
                            <xsl:if test="seg[@type='explicit']">
                                <b style="color: #801818;"><xsl:value-of select="seg[@type='explicit']"/></b>
                                <br/>
                            </xsl:if>
                            <xsl:if test="seg[@type='note']">
                                <br/><hr/>
                                <xsl:value-of select="seg[@type='note']"/>
                            </xsl:if>
                            <xsl:if test="following-sibling::ab[1]/seg[@type='witness']='R'">
                                <span class="subblock">
                                    <xsl:text>f°</xsl:text><xsl:value-of select="following-sibling::ab[1]/seg[@type='location']"/>
                                    <br/>
                                    <xsl:if test="following-sibling::ab[1]/seg[@type='rubric']">
                                        <i style="color: #801818;"><xsl:value-of select="following-sibling::ab[1]/seg[@type='rubric']"/></i>
                                        <br/>
                                    </xsl:if>
                                    <xsl:if test="following-sibling::ab[1]/seg[@type='incipit']">
                                        <b style="color: #801818;"><xsl:value-of select="following-sibling::ab[1]/seg[@type='incipit']"/></b>
                                        <br/>
                                    </xsl:if>
                                    <xsl:if test="following-sibling::ab[1]/seg[@type='explicit']">
                                        <b style="color: #801818;"><xsl:value-of select="following-sibling::ab[1]/seg[@type='explicit']"/></b>
                                        <br/>
                                    </xsl:if>
                                    <xsl:if test="following-sibling::ab[1]/seg[@type='note']">
                                        <br/><hr/>
                                        <xsl:value-of select="following-sibling::ab[1]/seg[@type='note']"/>
                                    </xsl:if>
                                </span>
                            </xsl:if>
                        </td>
                    </xsl:when>
                </xsl:choose>
            </xsl:when>

            <xsl:when test="seg[@type='witness']='C'">
                <td class="ms_C">
                    <xsl:text>f°</xsl:text><xsl:value-of select="seg[@type='location']"/>
                    <br/>
                    <xsl:if test="seg[@type='rubric']">
                        <i style="color: #801818;"><xsl:value-of select="seg[@type='rubric']"/></i>
                        <br/>
                    </xsl:if>
                    <xsl:if test="seg[@type='incipit']">
                        <b style="color: #801818;"><xsl:value-of select="seg[@type='incipit']"/></b>
                        <br/>
                    </xsl:if>
                    <xsl:if test="seg[@type='explicit']">
                        <b style="color: #801818;"><xsl:value-of select="seg[@type='explicit']"/></b>
                        <br/>
                    </xsl:if>
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
                    <xsl:if test="seg[@type='incipit']">
                        <b style="color: #801818;"><xsl:value-of select="seg[@type='incipit']"/></b>
                        <br/>
                    </xsl:if>
                    <xsl:if test="seg[@type='explicit']">
                        <b style="color: #801818;"><xsl:value-of select="seg[@type='explicit']"/></b>
                        <br/>
                    </xsl:if>
                    <xsl:if test="seg[@type='note']">
                        <br/><hr/>
                        <xsl:value-of select="seg[@type='note']"/>
                    </xsl:if>
                </td>        
            </xsl:otherwise>
        </xsl:choose>
        
    </xsl:template>
    
</xsl:stylesheet>
