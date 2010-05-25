<?xml version='1.0'?>

<!--
  * pkpinfo.xsl
  *
  * Copyright (c) 2000-2008 John Willinsky
  * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
  *
  * PKP DocBook XSL customization layer for FO transformations.
  *
  * $Id: pkpfo.xsl,v 1.1 2008/07/08 16:25:38 asmecher Exp $
  -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:d="http://docbook.org/ns/docbook"
    exclude-result-prefixes="d" version="1.0">

    <!-- This file has been developed using the DocBook 1.74.0 stylesheets and should be placed with them in the fo/ directory. -->

    <!-- Basic import stuff -->

    <xsl:import href="docbook.xsl"/>
    <xsl:import href="pagesetup.xsl"/>

    <!-- Basic parameters -->

    <xsl:param name="fop.extensions">0</xsl:param>
    <xsl:param name="fop1.extensions">1</xsl:param>
    <xsl:param name="region.before.extent">1.6cm</xsl:param>
    <xsl:param name="body.margin.top">2.2cm</xsl:param>
    <xsl:param name="hyphenate">true</xsl:param>
    <xsl:param name="ulink.show">0</xsl:param>
    <xsl:param name="use.role.for.mediaobject">1</xsl:param>
        

    <!-- un-indent body text; indent lists -->
    <xsl:param name="body.start.indent">0pt</xsl:param>
    <xsl:attribute-set name="list.block.spacing">
        <xsl:attribute name="margin-left">
            <xsl:choose>
                <xsl:when test="self::itemizedlist">1cm</xsl:when>
                <xsl:otherwise>0pt</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
    </xsl:attribute-set>
    

    <!-- fix for long tables etc. -->
    <!-- courtesy of http://sagehill.net/docbookxsl/PageBreaking.html#KeepTogetherPI -->

    <xsl:attribute-set name="formal.object.properties">
        <xsl:attribute name="keep-together.within-column">always</xsl:attribute>
    </xsl:attribute-set>



    <!-- fix to remove lists of tables, images, and so on from TOC -->
    <!-- courtesy of http://sagehill.net/docbookxsl/TOCcontrol.html -->

    <xsl:param name="generate.toc">
        book toc,title
        article toc,title
    </xsl:param>

    <!-- template to add PKP Header Image -->
    <!-- PLEASE NOTE the header.image.filename relative location. This is relative to the file being transformed. -->
    <!-- courtesy of http://sagehill.net/docbookxsl/PrintHeaders.html -->

    <xsl:template name="header.content">
        <xsl:param name="pageclass" select="''"/>
        <xsl:param name="sequence" select="''"/>
        <xsl:param name="position">center</xsl:param>
        <xsl:param name="gentext-key" select="''"/>
        <xsl:param name="header.image.filename">../common/pkplogo.png</xsl:param>

        <fo:block>
            <!-- sequence can be odd, even, first, blank -->
            <!-- position can be left, center, right -->
            <xsl:choose>

                <xsl:when test="$position = 'center'">
                    <fo:external-graphic content-height="1.59cm">
                        <xsl:attribute name="src">
                            <xsl:call-template name="fo-external-image">
                                <xsl:with-param name="filename" select="$header.image.filename"/>
                            </xsl:call-template>
                        </xsl:attribute>
                    </fo:external-graphic>
                </xsl:when>

                <xsl:when test="$sequence = 'even' and $position = 'center'">
                    <xsl:call-template name="draft.text"/>
                </xsl:when>


                <xsl:when test="$sequence = 'first' and $position = 'left'"> </xsl:when>

                <xsl:when test="$sequence = 'first' and $position = 'right'"> </xsl:when>

                <xsl:when test="$sequence = 'first' and $position = 'center'">
                    <xsl:value-of select="ancestor-or-self::book/bookinfo/corpauthor"/>
                </xsl:when>
            </xsl:choose>
        </fo:block>
    </xsl:template>

    <!-- Table (and informaltable) formatting -->

    <xsl:attribute-set name="table.properties" use-attribute-sets="normal.para.spacing">
        <xsl:attribute name="font-size">75%</xsl:attribute>
        <xsl:attribute name="hyphenate">true</xsl:attribute>
        <xsl:attribute name="wrap-option">wrap</xsl:attribute>
        <xsl:attribute name="text-align">left</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="informaltable.properties" use-attribute-sets="normal.para.spacing">
        <xsl:attribute name="font-size">75%</xsl:attribute>
        <xsl:attribute name="hyphenate">true</xsl:attribute>
        <xsl:attribute name="wrap-option">wrap</xsl:attribute>
        <xsl:attribute name="text-align">left</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="table.table.properties">
        <xsl:attribute name="hyphenate">true</xsl:attribute>
        <xsl:attribute name="wrap-option">wrap</xsl:attribute>
        <xsl:attribute name="text-align">left</xsl:attribute>
    </xsl:attribute-set>

    <!-- fonts -->
    <!-- xref.properties = URLs -->
    <!-- monospace.properties = code blocks and phrases etc. -->
    <!-- verbatim.properties = programlisting (example code blocks) -->

    <xsl:attribute-set name="monospace.properties">
        <xsl:attribute name="font-family">
            <xsl:value-of select="$monospace.font.family"/>
        </xsl:attribute>
        <xsl:attribute name="color">#1D5A61</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="xref.properties">
        <xsl:attribute name="color">#0066CC</xsl:attribute>
        <xsl:attribute name="text-decoration">underline</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="xref.properties">
        <xsl:attribute name="color">#0066CC</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="verbatim.properties">
        <xsl:attribute name="background-color">#dddddd</xsl:attribute>
        <xsl:attribute name="color">#000000</xsl:attribute>
        <xsl:attribute name="padding">1px</xsl:attribute>
        <xsl:attribute name="font-size">
            <xsl:value-of select="$body.font.master * 0.8"/>
            <xsl:text>pt</xsl:text>
        </xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="mediaobject.properties">
        <xsl:attribute name="border">0.5pt solid gray</xsl:attribute>
        <xsl:attribute name="background">#cccccc</xsl:attribute>
        <xsl:attribute name="padding">0.1in</xsl:attribute>
    </xsl:attribute-set>

    <!-- kludge to fix the inability to add proper linebreaks. 
    If you want to add a linebreak anywhere in an XML doc, add 
    <?linebreak?> where you want it.  -->

    <xsl:template match="processing-instruction('linebreak')">
        <fo:block/>
    </xsl:template>

    <!-- some testing stuff for image scaling -->
    <!--
    <xsl:attribute-set name="imagedata">
        <xsl:attribute name="width">100%</xsl:attribute>
        <xsl:attribute name="scalefit">1</xsl:attribute>
        <xsl:attribute name="contentdepth">100%</xsl:attribute>
    </xsl:attribute-set>

<xsl:param name="ignore.image.scaling">0</xsl:param>
-->
</xsl:stylesheet>
