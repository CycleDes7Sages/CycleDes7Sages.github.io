<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    
    <xsl:output method="text" encoding="UTF-8"/>
    
    <xsl:template match="/">
        <xsl:text>\documentclass{article}
\usepackage[T1]{fontenc}
\usepackage{microtype}
\usepackage[pdfusetitle,hidelinks]{hyperref}
\usepackage[english]{babel}
\usepackage[series={},nocritical,noend,noeledsec,nofamiliar,noledgroup]{reledmac}
\usepackage{reledpar}


\begin{document}

\date{}
        </xsl:text>
        <xsl:text>\title{</xsl:text><xsl:value-of select="//title[parent::titleStmt]"/><xsl:text>}
\maketitle

\begin{abstract}
Abstract to be added
\end{abstract}
\begin{pages}
\beginnumbering
        </xsl:text>
        <xsl:apply-templates/>
        <xsl:text>
\end{pages}
\end{document}
        </xsl:text>
    </xsl:template> 
    
    <xsl:template match="teiHeader"/>
    
    <xsl:template match="p">
        <xsl:text>\pstart </xsl:text>
        <xsl:apply-templates/>
        <xsl:text> \pend</xsl:text>
    </xsl:template>
    
    <xsl:template match="quote">
        <xsl:text>\textit{</xsl:text><xsl:apply-templates/><xsl:text>}</xsl:text>
    </xsl:template>
    
    
    
</xsl:stylesheet>