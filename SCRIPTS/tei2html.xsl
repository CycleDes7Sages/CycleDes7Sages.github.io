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
                <link rel="stylesheet" type="text/css" href="ASSETS/Pelyarmenus.css"/>
            </head>
            <body><xsl:apply-templates/></body>
        </html>
    </xsl:template>
    <xsl:template match="teiHeader">
    </xsl:template>
    <xsl:template match="head[@type='rubrique']">
        <h1><xsl:apply-templates/></h1> <!-- puis-je ajouter un numéro à chacune de ces div ? -->
    </xsl:template>
    <xsl:template match="figure">
        <i><xsl:apply-templates/></i>
    </xsl:template>
    <xsl:template match="p">
        <p><xsl:apply-templates/></p>
        <!-- comment puis-je faire apparaître les numéros des paragraphes ? 
            on a parlé d'ol dans la séance sur le html, mais comment les intégrer ?-->
    </xsl:template>
    <xsl:template match="num">
        .<small-caps><xsl:apply-templates></xsl:apply-templates></small-caps>.
    </xsl:template>
    <xsl:template match="said">
        <xsl:choose>
            <xsl:when test="@aloud='true'"> <!-- comment poser une double condition @aloud et @direct=true? -->
                "<xsl:apply-templates></xsl:apply-templates>"
            </xsl:when>
            <!-- est-il possible d'automatiser la création d'un tiret à chaque occurrence de dialogue 
                (fermeture de balise said et réouverture juste ensuite)? -->
            <xsl:otherwise>
                <xsl:apply-templates></xsl:apply-templates>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="del"> <!-- Comment pourrais-je demander un rendu en nbp, possible ici ? ou en biffé ?-->
        [<xsl:apply-templates></xsl:apply-templates>]
    </xsl:template>
    <xsl:template match="rdg"> <!-- Comment pourrais-je demander un rendu en nbp, possible ici ? 
                                    Serait-il en outre possible de demander de conserver la source indiquée du rdg en question-->
         <i>[<xsl:apply-templates></xsl:apply-templates>]</i> 
    </xsl:template>
    <xsl:template match="c">
        <i><span class="c"><xsl:apply-templates/></span></i>
    </xsl:template>
    <xsl:template match="persName">
        <span class="persName"><xsl:apply-templates/></span>
    </xsl:template>
    <xsl:template match="rs">
        <span class="rs"><xsl:apply-templates/></span>
    </xsl:template>
</xsl:stylesheet>