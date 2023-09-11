<?xml version="1.0" encoding="UTF-8"?> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Le Roman de Pelyarmenus</title>
                <title>édition en cours d'élaboration par Camille Carnaille, Prunelle Deleville, Sophie Lecomte (sous la direction
                    de Simone Ventura)</title>
                <link rel="stylesheet" type="text/css" href="../ASSETS/Pelyarmenus.css"/>
            </head>
            <body><xsl:apply-templates/></body>
        </html>
    </xsl:template>
    <xsl:template match="teiHeader">
    </xsl:template>
    <xsl:template match="head[@type='rubrique']">
        <h1><span class="headNum">[<xsl:value-of select="substring-after(@n,'R')"/>]</span><xsl:text> </xsl:text><xsl:apply-templates/></h1> 
    </xsl:template>
    <xsl:template match="head[@type='explicit']">
        <h1><span class="headNum">[<xsl:value-of select="substring-after(@n,'R')"/>]</span><xsl:text> </xsl:text><xsl:apply-templates/></h1>
    </xsl:template>
    <xsl:template match="figDesc">
        <h2><i><span class="figDesc"><xsl:apply-templates/></span></i></h2>
    </xsl:template>
    <xsl:template match="p">
        <p><span class="paraNum">[<xsl:value-of select="substring-after(@n,'P')"/>]</span><xsl:text> </xsl:text><xsl:apply-templates/></p>
    </xsl:template>
    <xsl:template match="pb">
        <span class="pb">[<xsl:value-of select="@n"/>]</span><xsl:text></xsl:text><xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="cb">
        <span class="cb">[<xsl:value-of select="@n"/>]</span><xsl:text></xsl:text><xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="num">
        .<span class="num"><xsl:apply-templates/></span>.        
    </xsl:template>
    <xsl:template match="hi[@type='exp']">
        <sup><span class="exp"><xsl:apply-templates/></span></sup> 
    </xsl:template>
    <xsl:template match="hi">
        <xsl:choose>
            <xsl:when test="@rend='exp'">
                <sup><span class="exp"><xsl:apply-templates/></span></sup>
            </xsl:when>
        </xsl:choose>  
        <xsl:choose>
            <xsl:when test="@rend='italique'">
                <i><xsl:apply-templates/></i>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="hi[@type='italique']">
        <i><xsl:apply-templates/></i> 
    </xsl:template>    
    <xsl:template match="said">
        <xsl:choose>
            <xsl:when test="@direct='true'"> 
                "<xsl:apply-templates/>"
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="del"> 
        <span class="del"><xsl:apply-templates/></span>
    </xsl:template>
    <xsl:template match="add"> 
        <b>[<xsl:apply-templates></xsl:apply-templates>]</b>
    </xsl:template>
    <xsl:template match="rdg"> 
        <i>[<xsl:apply-templates/><xsl:text> </xsl:text><xsl:value-of select="translate(@wit,'#','')"/>]</i> 
    </xsl:template>
    <xsl:template match="lem">
        <i><span class="lem"><xsl:apply-templates/></span></i>
    </xsl:template>
    <xsl:template match="supplied">
        <b><i>[<xsl:apply-templates/><xsl:text> </xsl:text><xsl:value-of select="translate(@source,'#','')"/>]</i></b>
    </xsl:template>
    <xsl:template match="note">
        [<b><span class="note"><xsl:apply-templates/></span></b>]
    </xsl:template>
    <xsl:template match="c">    
        <i><span class="c"><xsl:apply-templates/></span></i>
    </xsl:template>
    <xsl:template match="persName">
        <span class="persName"><xsl:apply-templates/></span>
    </xsl:template>
    <xsl:template match="placeName">
        <span class="placeName"><xsl:apply-templates/></span>
    </xsl:template>
    <xsl:template match="rs">
        <span class="rs"><xsl:apply-templates/></span>
    </xsl:template>
    <xsl:template match="rs[@type='people']">
        <span class="people"><xsl:apply-templates/></span> 
        <xsl:choose>
            <xsl:when test="@type='people'">
                <span class="people"><xsl:apply-templates/></span>
            </xsl:when>
            <xsl:when test="@type='place'">
                <span class="place"><xsl:apply-templates/></span>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="rs[@type='place']">
        <span class="place"><xsl:apply-templates/></span> 
    </xsl:template>
    <xsl:template match="seg">
        <xsl:choose>
            <xsl:when test="@ana='lettre'"> 
                "<xsl:apply-templates/>"
            </xsl:when>
            <xsl:when test="@ana='chanson'">
                "<xsl:apply-templates/>"
            </xsl:when>
            <xsl:otherwise>
                '<xsl:apply-templates/>'
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="unclear">
        <i>[<xsl:apply-templates/>]</i>
    </xsl:template>   
</xsl:stylesheet>