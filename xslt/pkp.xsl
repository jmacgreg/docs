<?xml version='1.0'?>

<!--
  * pkp.xsl
  *
  * Copyright (c) 2000-2008 John Willinsky
  * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
  *
  * PKP DocBook XSL customization layer for xHTML transformations.
  *
  * $Id: pkp.xsl,v 1.1 2008/07/08 16:25:38 asmecher Exp $
  -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <!-- This file has been developed using the DocBook 1.74.0 stylesheets and should be placed with them in the xhtml/ directory. -->

    <xsl:import href="chunk.xsl"/>

    <!-- Remove the default top title -->
    
    <xsl:param name="navig.showtitles">0</xsl:param>

    <!-- get rid of Lists of tables and so on -->
    
    <xsl:param name="use.id.as.filename">1</xsl:param>

    <xsl:param name="generate.toc">
        book toc,title
        part toc,title
        chapter toc,title
        article toc,title
    </xsl:param>

    <!-- adds a stylesheet link to /files/docs/docstyle.css -->
    
    <xsl:param name="html.stylesheet" select="'../common/docstyle.css'"/>

    <!-- adds PKP header images -->
    
    <xsl:template name="user.header.navigation">
        <div id="header">
        <div style="background-color: #444; padding: 5px; width: 879px; font-size: 0.8em; font-family: Verdana, Arial, Helvetica, sans-serif;">
            <span style="margin-left:5px;"><a style="color: white; text-decoration: none; padding-right: 5px;" href="http://pkp.sfu.ca/ojs">OJS</a> <a style="color: white; text-decoration: none; padding-right: 5px;" href="http://pkp.sfu.ca/ocs">OCS</a> <a style="color: white; text-decoration: none; padding-right: 5px;" href="http://pkp.sfu.ca/omp">OMP</a> <a style="color: white; text-decoration: none;" href="http://pkp.sfu.ca/harvester">OHS</a></span>
            <span style="margin-left:650px;"><a style="color: white; text-decoration: none; padding-right: 5px;" href="http://pkp.sfu.ca/">PKP</a></span>
            <span style="text-align: right;"><a style="color: white; text-decoration: none; padding-right: 5px;" href="http://pkp.sfu.ca/wiki/">Wiki</a></span>            
            <span style="text-align: right;"><a style="color: white; text-decoration: none; padding-right: 5px;" href="http://pkp.sfu.ca/support/forum/">Forum</a></span>
        </div>
        
        <div id="logo-wrapper">
            <div id="logo"><a href="/" title="Home"><img src="../common/barroness_logo.gif" alt="Home" /></a></div>                            </div><!-- /logo-wrapper-->
        </div><!-- /header-->
        <br />
    </xsl:template>

    <!-- misc. parameters -->
    <xsl:param name="use.role.for.mediaobject">1</xsl:param>
    <xsl:param name="section.autolabel">1</xsl:param>
    <xsl:param name="section.autolabel.max.depth">3</xsl:param>
   <xsl:param name="chunk.first.sections">1</xsl:param>
    <!-- kludge to fix the inability to add proper linebreaks. 
    If you want to add a linebreak anywhere in an XML doc, add 
    <?linebreak?> where you want it.  -->

    <xsl:template match="processing-instruction('linebreak')">
        <br/>
    </xsl:template>

<xsl:param name="chunker.output.indent">yes</xsl:param>
<xsl:param name="draft.mode">no</xsl:param>

</xsl:stylesheet>
