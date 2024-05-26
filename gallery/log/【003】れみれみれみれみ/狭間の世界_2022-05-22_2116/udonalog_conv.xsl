<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="UTF-8" />
  <xsl:template match="/">
    <html>
    <head>
         <title>log</title>
         <link rel="stylesheet" type="text/css" href="udonalog_style.css" title="Style"/>
    </head>
    <body>
    <table>
    <xsl:for-each select="chat-tab-list/chat-tab/chat">
        <xsl:sort select="@timestamp" data-type="number" order="ascending" />
        <!-- 秘話クラス分け部 -->
        <tr valign="top">
        <xsl:choose>

         <xsl:when test="parent::node()/attribute::name= '会場'">
         <xsl:attribute name="class">
         <xsl:value-of select="'tab1'"/>
         </xsl:attribute>
         </xsl:when>

         <xsl:when test="parent::node()/attribute::name= '情報'">
         <xsl:attribute name="class">
         <xsl:value-of select="'tab2'"/>
         </xsl:attribute>
         </xsl:when>

         <xsl:when test="parent::node()/attribute::name= '雑談'">
         <xsl:attribute name="class">
         <xsl:value-of select="'tab3'"/>
         </xsl:attribute>
         </xsl:when>

         <xsl:when test="parent::node()/attribute::name= '見学'">
         <xsl:attribute name="class">
         <xsl:value-of select="'tab4'"/>
         </xsl:attribute>
         </xsl:when>

         <xsl:when test="parent::node()/attribute::name= 'リモ'">
         <xsl:attribute name="class">
         <xsl:value-of select="'tab5'"/>
         </xsl:attribute>
         </xsl:when>

         <xsl:otherwise>
         <xsl:attribute name="class">
         <xsl:value-of select="'tab6'"/>
         </xsl:attribute>
         </xsl:otherwise>

        </xsl:choose>
        <!-- 秘話クラス分け部ここまで -->
		<td align="right" width="60px">
			<span class="tabname">
			<xsl:value-of select="parent::node()/attribute::name"/>
			</span>
		</td>
        <td align="center" width="125px">
            <img class="icon" onerror="this.remove()">
                <xsl:attribute name='src'><xsl:value-of select="@imageIdentifier"/>.jpg</xsl:attribute>
            </img>
            <img class="icon" onerror="this.remove()">
                <xsl:attribute name='src'><xsl:value-of select="@imageIdentifier"/>.gif</xsl:attribute>
            </img>
            <img class="icon" onerror="this.remove()">
                <xsl:attribute name='src'><xsl:value-of select="@imageIdentifier"/>.png</xsl:attribute>
            </img>
        </td>
        <td align="left">
            <div class="name">
            <xsl:attribute name='style'>color:<xsl:value-of select="@messColor"/></xsl:attribute>
            <xsl:value-of select="@name"/>
            </div>
            <div class="maintext">
            <xsl:attribute name='style'>color:<xsl:value-of select="@messColor"/></xsl:attribute>
            <xsl:call-template name="replace">
            <xsl:with-param name="str" select="." />
            </xsl:call-template>
            </div>
        </td>
        </tr>
    </xsl:for-each>
	</table>
    </body>
    </html>
  </xsl:template>

  <!-- 改行コードを "<br />" に変換 -->
<xsl:template name="replace">
  <xsl:param name="str" />

  <xsl:choose>
    <xsl:when test="contains($str, '&#10;')">
      <xsl:value-of select="substring-before($str, '&#10;')" /><br />
      <xsl:call-template name="replace">
        <xsl:with-param name="str" select="substring-after($str, '&#10;')" />
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="$str" />
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>
</xsl:stylesheet>

