<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    <xsl:template match="/">
        <html>
            <head>
                <title>Le Roman de Pelyarmenus, édition en cours d'élaboration par Camille Carnaille, Prunelle Deleville, Sophie Lecomte 
                    (sous la direction de Simone Ventura)</title>
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
    <xsl:template match="graphic[@url]">
        <h2><a href="{@url}" target="_blank" class="GallicaLink">🖼️</a></h2>
    </xsl:template>
    <xsl:template match="p">
        <p><b>§<span class="paraNum"><xsl:value-of select="substring-after(@n,'P')"/></span></b><xsl:text> </xsl:text><xsl:apply-templates/></p>
    </xsl:template>
    <xsl:template match="pb">
        <sup><span class="pb">[<xsl:value-of select="@n"/>]</span><xsl:text></xsl:text><xsl:apply-templates/></sup>
    </xsl:template>    
    <xsl:template match="l">
        <br/><xsl:text> </xsl:text><xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="cb">
        <sup><span class="cb">[<xsl:value-of select="@n"/>]</span><xsl:text></xsl:text><xsl:apply-templates/></sup>
    </xsl:template>
    <xsl:template match="num">.<span class="num"><xsl:apply-templates/></span>.</xsl:template>
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
        <xsl:choose>
            <xsl:when test="@rend='latin'">
                <span class="latin"><xsl:apply-templates/></span>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="hi[@type='italique']">
        <i><xsl:apply-templates/></i>
    </xsl:template>
    <xsl:template match="hi[@type='latin']">
        <span class="latin"><xsl:apply-templates/></span>
    </xsl:template> 
    <xsl:template match="said">
        <xsl:choose>
            <xsl:when test="@rendition='dialogue'">
                <xsl:choose>
                    <!--<xsl:when test="preceding-sibling::said and not(following-sibling::said[1][@rendition='dialogue']) and matches(.,'^.*[\.!\?]$')"><br/> – <xsl:apply-templates/>&#xA0;»<br/></xsl:when>-->
                    <xsl:when test="preceding-sibling::said and not(following-sibling::said[1][@rendition='dialogue']) and ends-with(.,'.')"><br/> – <xsl:apply-templates/>&#xA0;»<br/></xsl:when>
                    <xsl:when test="preceding-sibling::said and not(following-sibling::said[1][@rendition='dialogue']) and ends-with(.,'?')"><br/> – <xsl:apply-templates/>&#xA0;»<br/></xsl:when>
                    <xsl:when test="preceding-sibling::said and not(following-sibling::said[1][@rendition='dialogue']) and ends-with(.,'!')"><br/> – <xsl:apply-templates/>&#xA0;»<br/></xsl:when>
                    <xsl:when test="preceding-sibling::said and not(following-sibling::said[1][@rendition='dialogue']) and not(matches(.,'^.*[\.!\?]$'))"><br/> – <xsl:apply-templates/>&#xA0;»</xsl:when>
                    <xsl:when test="preceding-sibling::said and following-sibling::said[1][@rendition='dialogue']"><br/> – <xsl:apply-templates/> </xsl:when>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="@direct='true' and @aloud='true' and not(@rendition='dialogue')">
                <xsl:choose>
                    <xsl:when test="following-sibling::said[1][@rendition='dialogue']"><br/> «&#xA0;<xsl:apply-templates/> </xsl:when>
                    <xsl:otherwise><br/> «&#xA0;<xsl:apply-templates/>&#xA0;»<br/></xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="@direct='true' and aloud='true' and @next"> <!-- SG : HELP (again) : j'ai tenté qqch pour assurer la visualisation des discours qui doivent être
            scindés en deux balises (xml:id et next), maiiis ça ne marche pas (ex dans le fichier de Sophie en bas du §426) -->
                <br/> «&#xA0;<xsl:apply-templates/></xsl:when>
            <xsl:when test="@direct='true' and aloud='true' and @xml:id">
                <xsl:apply-templates/>&#xA0;»<br/>
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
        <b><xsl:apply-templates></xsl:apply-templates></b>
    </xsl:template>
    <xsl:template match="app">
        <span class="tooltip"><xsl:apply-templates/></span>
    </xsl:template>
    <xsl:template match="rdg">
        <span class="tooltip-content"><xsl:apply-templates/><xsl:text> </xsl:text><xsl:value-of select="translate(@wit,'#','')"/></span>
    </xsl:template>
    <xsl:template match="lem">
        <span class="lem"><xsl:apply-templates/></span>
    </xsl:template>
    <xsl:template match="supplied">
        <!-- <span class="tooltip"><span class="supplied"><xsl:apply-templates/><span class="tooltip-content"><xsl:value-of select="@source"/></span></span></span> -->
        <span class="tooltip">
            <xsl:choose>
                <xsl:when test="@source='#SL'">[<xsl:apply-templates/>]</xsl:when>
                <xsl:otherwise>‹<xsl:apply-templates/>›</xsl:otherwise>
            </xsl:choose>
            <span class="tooltip-content"><xsl:value-of select="translate(@source, '#','')"/></span></span>
    </xsl:template>
    <xsl:template match="note"><span class="tooltip"><span class="note">💬<span class="tooltip-content"><xsl:apply-templates/></span></span></span></xsl:template>
    <xsl:template match="c">   
        <i><span class="c"><xsl:apply-templates/></span></i>
    </xsl:template>
    <xsl:template match="persName">
        <span class="persName"><xsl:apply-templates/></span>
    </xsl:template>
    <xsl:template match="placeName"><span class="placeName"><xsl:apply-templates/></span></xsl:template>
    <xsl:template match="rs">
        <span class="tooltip"><span class="rs"><xsl:apply-templates/><span class="tooltip-content"><xsl:value-of select="@key"/></span></span></span>
    </xsl:template>
    <xsl:template match="rs[@type='people']">
        <span class="tooltip"><span class="people"><xsl:apply-templates/><span class="tooltip-content"><xsl:value-of select="@key"/></span></span></span>
    </xsl:template>
    <xsl:template match="rs[@type='place']">
        <span class="tooltip"><span class="place"><xsl:apply-templates/><span class="tooltip-content"><xsl:value-of select="@key"/></span></span></span>
    </xsl:template>
    <xsl:template match="seg">
        <xsl:choose>
            <xsl:when test="@ana='lettre'">"<xsl:apply-templates/>"</xsl:when>
            <xsl:when test="@ana='chanson'"><xsl:apply-templates/></xsl:when>
            <xsl:otherwise>'<xsl:apply-templates/>'</xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="unclear">
        <i>[<xsl:apply-templates/>]</i>
   </xsl:template>  
</xsl:stylesheet>