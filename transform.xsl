<?xml version="1.0"?>
<!-- vim: set shiftwidth=1 tabstop=1: -->
<xsl:stylesheet 
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
 xmlns:exsl="http://exslt.org/common" version="1.0" 
 extension-element-prefixes="exsl">
<!-- 
    (c) Miek Gieben 2013, Licensed under the GPL version 2.
-->
  <xsl:output method="xml" omit-xml-declaration="yes"/>
  <xsl:variable name="smallcase" select="'abcdefghijklmnopqrstuvwxyz'"/>
  <xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'"/>
  <xsl:variable name="ure" select="'igure: '"/>
  <xsl:variable name="Fig" select="concat('@F', $ure)"/>
  <xsl:variable name="fig" select="concat('@f', $ure)"/>
  <xsl:template match="/">
   <xsl:comment>
    This document was prepared using Pandoc2rfc
    https://github.com/miekg/pandoc2rfc
   </xsl:comment>
   <xsl:apply-templates/>
  </xsl:template>
  <xsl:template match="article">
   <xsl:apply-templates/>
  </xsl:template>
<!-- 
Remove the article info section, this should be handled
in the <front> matter of the draft 
-->
  <xsl:template match="articleinfo">
  </xsl:template>
<!-- Use footnotes for indexes (iref) -->
  <xsl:template match="footnote">
   <xsl:element name="iref">
    <xsl:choose>
     <xsl:when test="contains(./para, '!')">
      <xsl:attribute name="item">
       <xsl:value-of select="substring-before (normalize-space(
        translate(./para, '&#10;', ' ')), '!')"/>
      </xsl:attribute>
      <xsl:attribute name="subitem">
       <xsl:value-of select="substring-after (normalize-space(
        translate(./para, '&#10;', ' ')), '!')"/>
      </xsl:attribute>
     </xsl:when>
     <xsl:otherwise>
      <xsl:attribute name="item">
       <xsl:value-of select="normalize-space(
        translate(./para, '&#10;', ' '))"/>
      </xsl:attribute>
     </xsl:otherwise>
    </xsl:choose>
   </xsl:element>
  </xsl:template>
<!-- Merge section with the title tags into one section -->
  <xsl:template match="section | simplesect |
   sect1 | sect2 | sect3 | sect4 | sect5">
   <section>
    <xsl:attribute name="title">
     <xsl:value-of select="normalize-space(
      translate(./title, '&#10;', ' '))"/>
    </xsl:attribute>
    <xsl:attribute name="anchor">
     <xsl:value-of select="@id"/>
    </xsl:attribute>
    <xsl:apply-templates/>
   </section>
  </xsl:template>
<!--
Transform a <para> to <t>, not in lists, then it is discarded 
-->
  <xsl:template match="para | simpara">
   <xsl:choose>
    <xsl:when test="ancestor::orderedlist">
     <xsl:if test="position() &gt; 2">
      <vspace blankLines="1"/>
     </xsl:if>
     <xsl:apply-templates/>
    </xsl:when>
    <xsl:when test="ancestor::itemizedlist">
     <xsl:if test="position() &gt; 2">
      <vspace blankLines="1"/>
     </xsl:if>
     <xsl:apply-templates/>
    </xsl:when>
    <xsl:when test="ancestor::variablelist">
     <xsl:if test="position() &gt; 2">
      <vspace blankLines="1"/>
     </xsl:if>
     <xsl:apply-templates/>
    </xsl:when>
    <xsl:when test="ancestor::tbody">
     <xsl:apply-templates/>
    </xsl:when>
    <xsl:otherwise>
     <t>
      <xsl:apply-templates/>
     </t>
    </xsl:otherwise>
   </xsl:choose>
  </xsl:template>
<!--
Transform a <listitem> to a <t> for lists, except in description lists
-->
  <xsl:template match="listitem">
   <xsl:choose>
    <xsl:when test="parent::varlistentry">
     <xsl:apply-templates/>
    </xsl:when>
    <xsl:otherwise>
     <t>
      <xsl:apply-templates/>
     </t>
    </xsl:otherwise>
   </xsl:choose>
  </xsl:template>
<!--
Transform lists, for lists in list we do not put it in a new <t></t>
-->
  <xsl:template match="orderedlist">
   <xsl:choose>
    <xsl:when test="contains(@numeration,'arabic')">
     <xsl:choose>
      <xsl:when test="ancestor::orderedlist">
       <list style="numbers">
        <xsl:apply-templates/>
       </list>
      </xsl:when>
      <xsl:when test="ancestor::itemizedlist">
       <list style="numbers">
        <xsl:apply-templates/>
       </list>
      </xsl:when>
      <xsl:when test="ancestor::variablelist">
       <list style="numbers">
        <xsl:apply-templates/>
       </list>
      </xsl:when>
      <xsl:otherwise>
       <t>
        <list style="numbers">
         <xsl:apply-templates/>
        </list>
       </t>
      </xsl:otherwise>
     </xsl:choose>
    </xsl:when>
    <xsl:when test="contains(@numeration,'lowerroman')">
     <xsl:choose>
      <xsl:when test="ancestor::orderedlist">
       <list style="format %i.">
        <xsl:apply-templates/>
       </list>
      </xsl:when>
      <xsl:when test="ancestor::itemizedlist">
       <list style="format %i.">
        <xsl:apply-templates/>
       </list>
      </xsl:when>
      <xsl:when test="ancestor::variablelist">
       <list style="format %i.">
        <xsl:apply-templates/>
       </list>
      </xsl:when>
      <xsl:otherwise>
       <t>
        <list style="format %i.">
         <xsl:apply-templates/>
        </list>
       </t>
      </xsl:otherwise>
     </xsl:choose>
    </xsl:when>
    <xsl:when test="contains(@numeration,'upperroman')">
     <xsl:choose>
      <xsl:when test="ancestor::orderedlist">
       <list style="format (%d)">
        <xsl:apply-templates/>
       </list>
      </xsl:when>
      <xsl:when test="ancestor::itemizedlist">
       <list style="format (%d)">
        <xsl:apply-templates/>
       </list>
      </xsl:when>
      <xsl:when test="ancestor::variablelist">
       <list style="format (%d)">
        <xsl:apply-templates/>
       </list>
      </xsl:when>
      <xsl:otherwise>
       <t>
        <list style="format (%d)">
         <xsl:apply-templates/>
        </list>
       </t>
      </xsl:otherwise>
     </xsl:choose>
    </xsl:when>
    <xsl:when test="contains(@numeration,'upperalpha')">
     <xsl:choose>
      <xsl:when test="ancestor::orderedlist">
       <list style="format %C.">
        <xsl:apply-templates/>
       </list>
      </xsl:when>
      <xsl:when test="ancestor::itemizedlist">
       <list style="format %C.">
        <xsl:apply-templates/>
       </list>
      </xsl:when>
      <xsl:when test="ancestor::variablelist">
       <list style="format %C.">
        <xsl:apply-templates/>
       </list>
      </xsl:when>
      <xsl:otherwise>
       <t>
        <list style="format %C.">
         <xsl:apply-templates/>
        </list>
       </t>
      </xsl:otherwise>
     </xsl:choose>
    </xsl:when>
    <xsl:when test="contains(@numeration,'loweralpha')">
     <xsl:choose>
      <xsl:when test="ancestor::orderedlist">
       <list style="letters">
        <xsl:apply-templates/>
       </list>
      </xsl:when>
      <xsl:when test="ancestor::itemizedlist">
       <list style="letters">
        <xsl:apply-templates/>
       </list>
      </xsl:when>
      <xsl:when test="ancestor::variablelist">
       <list style="letters">
        <xsl:apply-templates/>
       </list>
      </xsl:when>
      <xsl:otherwise>
       <t>
        <list style="letters">
         <xsl:apply-templates/>
        </list>
       </t>
      </xsl:otherwise>
     </xsl:choose>
    </xsl:when>
    <xsl:otherwise>
     <xsl:choose>
      <xsl:when test="ancestor::orderedlist">
       <list style="empty">
        <xsl:apply-templates/>
       </list>
      </xsl:when>
      <xsl:when test="ancestor::itemizedlist">
       <list style="empty">
        <xsl:apply-templates/>
       </list>
      </xsl:when>
      <xsl:when test="ancestor::variablelist">
       <list style="empty">
        <xsl:apply-templates/>
       </list>
      </xsl:when>
      <xsl:otherwise>
       <t>
        <list style="empty">
         <xsl:apply-templates/>
        </list>
       </t>
      </xsl:otherwise>
     </xsl:choose>
    </xsl:otherwise>
   </xsl:choose>
  </xsl:template>
  <xsl:template match="itemizedlist">
   <xsl:choose>
    <xsl:when test="ancestor::orderedlist">
     <list style="symbols">
      <xsl:apply-templates/>
     </list>
    </xsl:when>
    <xsl:when test="ancestor::itemizedlist">
     <list style="symbols">
      <xsl:apply-templates/>
     </list>
    </xsl:when>
    <xsl:when test="ancestor::variablelist">
     <list style="symbols">
      <xsl:apply-templates/>
     </list>
    </xsl:when>
    <xsl:otherwise>
     <t>
      <list style="symbols">
       <xsl:apply-templates/>
      </list>
     </t>
    </xsl:otherwise>
   </xsl:choose>
  </xsl:template>
<!--
Hanging lists are specified as <variablelist> 
-->
  <xsl:template match="variablelist">
   <xsl:choose>
    <xsl:when test="ancestor::orderedlist">
     <list style="hanging">
      <xsl:apply-templates/>
     </list>
    </xsl:when>
    <xsl:when test="ancestor::itemizedlist">
     <list style="hanging">
      <xsl:apply-templates/>
     </list>
    </xsl:when>
    <xsl:when test="ancestor::variablelist">
     <list style="hanging">
      <xsl:apply-templates/>
     </list>
    </xsl:when>
    <xsl:otherwise>
     <t>
      <list style="hanging">
       <xsl:apply-templates/>
      </list>
     </t>
    </xsl:otherwise>
   </xsl:choose>
  </xsl:template>
  <xsl:template match="varlistentry">
   <t>
    <xsl:attribute name="hangText">
     <xsl:value-of select="normalize-space(translate(./term, 
      ' &#9;&#13;&#10;', ' '))"/>
    </xsl:attribute>
<!-- 
OPTION: enable this to get a newline after the hangText
-->
<!-- <xsl:element name="vspace"/> -->
    <xsl:apply-templates select="./listitem"/>
   </t>
  </xsl:template>
<!--
Transform <link> to <xref> crosslinks 
-->
  <xsl:template match="link">
   <xref>
    <xsl:attribute name="target">
     <xsl:value-of select="@linkend"/>
    </xsl:attribute>
    <xsl:apply-templates/>
   </xref>
  </xsl:template>
<!--
Transform <ulink> to <eref> links 
-->
  <xsl:template match="ulink">
   <eref>
    <xsl:attribute name="target">
     <xsl:value-of select="@url"/>
    </xsl:attribute>
    <xsl:apply-templates/>
   </eref>
  </xsl:template>
<!--
Transform <blockquote> to <list style="hanging">
-->
  <xsl:template match="blockquote">
   <t>
    <list style="hanging" hangIndent="3">
     <xsl:apply-templates/>
    </list>
   </t>
  </xsl:template>
<!--
Transform <screen> and <programlisting> to <figure><artwork>
-->
  <xsl:template match="screen | programlisting">
   <figure>
    <xsl:choose>
     <xsl:when test="contains(., $Fig)">
      <xsl:attribute name="anchor">
       <xsl:text>fig:</xsl:text>
       <xsl:value-of select="translate(
        translate(substring(normalize-space(
        translate( substring-after(., $Fig) ,
        &quot;&#10;'&quot;, &quot;  &quot;)), 1, 10),
        &quot; &quot;, &quot;-&quot;), $uppercase, $smallcase)"/>
      </xsl:attribute>
<!-- If there is an caption, center the figure -->
          <xsl:attribute name="align">
           <xsl:text>center</xsl:text>
          </xsl:attribute>
          <artwork>
           <xsl:value-of select="substring-before(., $Fig)"/>
          </artwork>
          <postamble>
           <xsl:value-of select="substring-after(., $Fig)"/>
          </postamble>
         </xsl:when>
         <xsl:when test="contains(., $fig)">
          <xsl:attribute name="anchor">
           <xsl:text>fig:</xsl:text>
           <xsl:value-of select="translate(
            translate(substring(normalize-space(
            translate( substring-after(., $fig) ,
            &quot;&#10;'&quot;, &quot;  &quot;)), 1, 10),
            &quot; &quot;, &quot;-&quot;), $uppercase, $smallcase)"/>
          </xsl:attribute>
          <artwork>
           <xsl:value-of select="substring-before(., $fig)"/>
          </artwork>
          <postamble>
           <xsl:value-of select="substring-after(., $fig)"/>
          </postamble>
         </xsl:when>
         <xsl:otherwise>
          <artwork>
           <xsl:value-of select="."/>
          </artwork>
         </xsl:otherwise>
        </xsl:choose>
       </figure>
      </xsl:template>
      <xsl:template match="title"/>
      <xsl:template match="literal">
       <spanx style="verb">
        <xsl:apply-templates/>
       </spanx>
      </xsl:template>
      <xsl:template match="emphasis">
       <xsl:choose>
        <xsl:when test="contains(@role,'strong')">
         <spanx style="strong">
          <xsl:apply-templates/>
         </spanx>
        </xsl:when>
        <xsl:otherwise>
         <spanx style="emph">
          <xsl:apply-templates/>
         </spanx>
        </xsl:otherwise>
       </xsl:choose>
      </xsl:template>
      <xsl:template match="literal" mode="post">
       <spanx style="verb">
        <xsl:apply-templates mode="post"/>
       </spanx>
      </xsl:template>
      <xsl:template match="emphasis" mode="post">
       <xsl:choose>
        <xsl:when test="contains(@role,'strong')">
         <spanx style="strong">
          <xsl:apply-templates mode="post"/>
         </spanx>
        </xsl:when>
        <xsl:otherwise>
         <spanx style="emph">
          <xsl:apply-templates mode="post"/>
         </spanx>
        </xsl:otherwise>
       </xsl:choose>
      </xsl:template>
<!-- Tables -->
  <xsl:template match="table | informaltable">
   <texttable>
<!-- If there is a caption, fake an anchor attribute -->
      <xsl:if test="./caption">
       <xsl:attribute name="anchor">
        <xsl:text>tab:</xsl:text>
        <xsl:value-of select="translate(
         translate(substring(normalize-space(translate(
         ./caption, &quot;&#10;'&quot;, &quot;  &quot;)), 1, 10),
         &quot; &quot;, &quot;-&quot;), $uppercase, $smallcase)"/>
       </xsl:attribute>
      </xsl:if>
      <xsl:if test="./title">
       <xsl:attribute name="anchor">
        <xsl:text>tab:</xsl:text>
        <xsl:value-of select="translate( translate(
         substring(normalize-space(translate(./title,
         &quot;&#10;'&quot;, &quot;  &quot;)), 1, 10),
         &quot; &quot;, &quot;-&quot;), $uppercase, $smallcase)"/>
       </xsl:attribute>
      </xsl:if>
      <xsl:apply-templates/>
      <xsl:if test="./title">
<!-- create postamble of the title -->
        <postamble>
         <xsl:apply-templates select="./title" mode="post"/>
        </postamble>
       </xsl:if>
       <xsl:if test="./caption">
<!-- create postamble of the caption -->
        <postamble>
         <xsl:apply-templates select="./caption" mode="post"/>
        </postamble>
       </xsl:if>
      </texttable>
     </xsl:template>
<!-- Table headers -->
  <xsl:template match="table/thead/tr/th |
   informaltable/thead/tr/th">
   <ttcol>
    <xsl:attribute name="align">
     <xsl:value-of select="@align"/>
    </xsl:attribute>
<!--
Every even position() need to be dealt with: 
2 look back to 1, 4 look back to 2, etc.
-->
      <xsl:if test="position() = 2">
       <xsl:call-template name="get_col">
        <xsl:with-param name="column" select="1"/>
       </xsl:call-template>
      </xsl:if>
      <xsl:if test="position() = 4">
       <xsl:call-template name="get_col">
        <xsl:with-param name="column" select="2"/>
       </xsl:call-template>
      </xsl:if>
      <xsl:if test="position() = 6">
       <xsl:call-template name="get_col">
        <xsl:with-param name="column" select="3"/>
       </xsl:call-template>
      </xsl:if>
      <xsl:if test="position() = 8">
       <xsl:call-template name="get_col">
        <xsl:with-param name="column" select="4"/>
       </xsl:call-template>
      </xsl:if>
      <xsl:if test="position() = 10">
       <xsl:call-template name="get_col">
        <xsl:with-param name="column" select="5"/>
       </xsl:call-template>
      </xsl:if>
      <xsl:if test="position() = 12">
       <xsl:call-template name="get_col">
        <xsl:with-param name="column" select="6"/>
       </xsl:call-template>
      </xsl:if>
      <xsl:if test="position() = 14">
       <xsl:call-template name="get_col">
        <xsl:with-param name="column" select="7"/>
       </xsl:call-template>
      </xsl:if>
      <xsl:if test="position() = 16">
       <xsl:call-template name="get_col">
        <xsl:with-param name="column" select="8"/>
       </xsl:call-template>
      </xsl:if>
      <xsl:apply-templates/>
     </ttcol>
    </xsl:template>
    <xsl:template name="get_col">
     <xsl:param name="column"/>
     <xsl:if test="../../../col[$column]">
      <xsl:attribute name="width">
       <xsl:value-of select="../../../col[$column]/@width"/>
      </xsl:attribute>
     </xsl:if>
    </xsl:template>
<!-- Table headers for CALS tables -->
  <xsl:template match="table/tgroup/thead/row/entry">
   <ttcol>
    <xsl:if test="position() = 2">
     <xsl:call-template name="get_colspec">
      <xsl:with-param name="column" select="1"/>
     </xsl:call-template>
    </xsl:if>
    <xsl:if test="position() = 4">
     <xsl:call-template name="get_colspec">
      <xsl:with-param name="column" select="2"/>
     </xsl:call-template>
    </xsl:if>
    <xsl:if test="position() = 6">
     <xsl:call-template name="get_colspec">
      <xsl:with-param name="column" select="3"/>
     </xsl:call-template>
    </xsl:if>
    <xsl:if test="position() = 8">
     <xsl:call-template name="get_colspec">
      <xsl:with-param name="column" select="4"/>
     </xsl:call-template>
    </xsl:if>
    <xsl:if test="position() = 10">
     <xsl:call-template name="get_colspec">
      <xsl:with-param name="column" select="5"/>
     </xsl:call-template>
    </xsl:if>
    <xsl:if test="position() = 12">
     <xsl:call-template name="get_colspec">
      <xsl:with-param name="column" select="6"/>
     </xsl:call-template>
    </xsl:if>
    <xsl:if test="position() = 14">
     <xsl:call-template name="get_colspec">
      <xsl:with-param name="column" select="7"/>
     </xsl:call-template>
    </xsl:if>
    <xsl:if test="position() = 16">
     <xsl:call-template name="get_colspec">
      <xsl:with-param name="column" select="8"/>
     </xsl:call-template>
    </xsl:if>
<!-- If the entry itself has align, we use that -->
      <xsl:if test="@align">
       <xsl:attribute name="align">
        <xsl:value-of select="@align"/>
       </xsl:attribute>
      </xsl:if>
      <xsl:apply-templates/>
     </ttcol>
    </xsl:template>
    <xsl:template name="get_colspec">
     <xsl:param name="column"/>
     <xsl:if test="../../../../tgroup/colspec[$column]">
      <xsl:attribute name="align">
       <xsl:value-of 
        select="../../../../tgroup/colspec[$column]/@align"/>
      </xsl:attribute>
<!-- Optionally colwidth, translate * to % -->
      <xsl:if test="../../../../tgroup/colspec[$column]/@colwidth">
       <xsl:attribute name="width">
        <xsl:value-of select="translate(
         ../../../../tgroup/colspec[$column]/@colwidth, '*', '%')"/>
       </xsl:attribute>
      </xsl:if>
     </xsl:if>
    </xsl:template>
<!-- Table headers for CALS tables, Pandoc 1.9.x+ -->
  <xsl:template match="informaltable/tgroup/thead/row/entry">
   <ttcol>
    <xsl:if test="position() = 2">
     <xsl:call-template name="get_colspec_informal">
      <xsl:with-param name="column" select="1"/>
     </xsl:call-template>
    </xsl:if>
    <xsl:if test="position() = 4">
     <xsl:call-template name="get_colspec_informal">
      <xsl:with-param name="column" select="2"/>
     </xsl:call-template>
    </xsl:if>
    <xsl:if test="position() = 6">
     <xsl:call-template name="get_colspec_informal">
      <xsl:with-param name="column" select="3"/>
     </xsl:call-template>
    </xsl:if>
    <xsl:if test="position() = 8">
     <xsl:call-template name="get_colspec_informal">
      <xsl:with-param name="column" select="4"/>
     </xsl:call-template>
    </xsl:if>
    <xsl:if test="position() = 10">
     <xsl:call-template name="get_colspec_informal">
      <xsl:with-param name="column" select="5"/>
     </xsl:call-template>
    </xsl:if>
    <xsl:if test="position() = 12">
     <xsl:call-template name="get_colspec_informal">
      <xsl:with-param name="column" select="6"/>
     </xsl:call-template>
    </xsl:if>
    <xsl:if test="position() = 14">
     <xsl:call-template name="get_colspec_informal">
      <xsl:with-param name="column" select="7"/>
     </xsl:call-template>
    </xsl:if>
    <xsl:if test="position() = 16">
     <xsl:call-template name="get_colspec_informal">
      <xsl:with-param name="column" select="8"/>
     </xsl:call-template>
    </xsl:if>
<!-- If the entry itself has align, we use that -->
      <xsl:if test="@align">
       <xsl:attribute name="align">
        <xsl:value-of select="@align"/>
       </xsl:attribute>
      </xsl:if>
      <xsl:apply-templates/>
     </ttcol>
    </xsl:template>
    <xsl:template name="get_colspec_informal">
     <xsl:param name="column"/>
     <xsl:if test="../../../../tgroup/colspec[$column]">
      <xsl:attribute name="align">
       <xsl:value-of
        select="../../../../tgroup/colspec[$column]/@align"/>
      </xsl:attribute>
<!-- Optionally colwidth, translate * to % -->
      <xsl:if test="../../../../tgroup/colspec[$column]/@colwidth">
       <xsl:attribute name="width">
        <xsl:value-of
         select="translate(
         ../../../../tgroup/colspec[$column]/@colwidth,
         '*', '%')"/>
       </xsl:attribute>
      </xsl:if>
     </xsl:if>
    </xsl:template>
    <xsl:template match="table/tbody/tr/td | 
     informaltable/tbody/tr/td |
     table/tgroup/tbody/row/entry |
     informaltable/tgroup/tbody/row/entry">
     <c>
      <xsl:apply-templates/>
     </c>
    </xsl:template>
<!-- CALS table -->
  <xsl:template match="table/tbody/row/entry">
   <c>
    <xsl:apply-templates/>
   </c>
  </xsl:template>
 </xsl:stylesheet>
