<?xml version="1.0" encoding="iso-8859-2"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" />


  <xsl:variable name="group">A</xsl:variable>
  
  <xsl:template match="document">
    
    <html>
      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-2"/>
        <meta http-equiv="Content-Language" content="pl"/>
        <link rel="stylesheet" type="text/css" href="style.css"/>
      </head>
      <body>
        <div id="wraper">

          <xsl:apply-templates select="DocumentName" />
		  
          <xsl:call-template name="adress"/>
		  
          <div id="participants">
            <p class="h3">Participants:</p>
            <table border="0">
              <xsl:apply-templates select="participants/participant" />
            </table>  
          </div>
		  
          <div id="judges">
            <p class="h3">Judges:</p>
            <table border="0">
              <xsl:apply-templates select="judges/trasa/osoba" />
            </table>
          </div>
          
          <div id="equipment">
            Equipment:
            <xsl:apply-templates select="equipment/item"/>
          </div>

          <div id="groupA">
            Start group A:
            <xsl:apply-templates select="type_rodzaje"/>
          </div>
		  
          <div id="age_groups">
            Age groups:
            <xsl:apply-templates select="age_groups"/>
          </div>		  

          <div id="footer">
            <xsl:call-template name="contact_adm"/>
          </div>

        </div>
      </body>
    </html>

  </xsl:template>
  
  <xsl:template match="DocumentName">
    <div id="header">
      <p class="h1"><xsl:apply-templates /></p>
      <p class="h2">
        <xsl:value-of select="//document/competition/@date"/>
      </p>

    </div>

  </xsl:template>

  <xsl:template name="adress" >    
    <div id="adr">
        <xsl:value-of select="//document/competition/@place"/>,
        <xsl:value-of select="//document/competition/@building"/><br/>
    </div>
  </xsl:template>
  
  <xsl:template match="participant|osoba">
    
      <tr>
        <td><xsl:apply-templates select="member"/></td>
        <td>
              <xsl:element name="a">
                <xsl:attribute name="href">mailto:<xsl:value-of select="contacts/email" />
              </xsl:attribute>
                send mail
              </xsl:element>
          </td>
          <xsl:if test="@crew">
            
            <td>
              <xsl:choose>
                <xsl:when test="experience='true'">
                  (has experience)
                </xsl:when>
                <xsl:when test="experience='false'">
                  (no experience)
                </xsl:when>
                <xsl:otherwise>
                  &#160;&#160;
                </xsl:otherwise>
              </xsl:choose> 
            </td>
            <td>
              <xsl:value-of select="@crew"/>
            </td>
            
            <td>
              <xsl:element name="img">
                <xsl:attribute name="width">100</xsl:attribute>
                <xsl:attribute name="height">100</xsl:attribute>
                <xsl:attribute name="src">
                  <xsl:value-of select="photo" />
                </xsl:attribute>
                <xsl:attribute name="title">
                  <xsl:value-of select="postadr/city" />
                </xsl:attribute>
              </xsl:element>
            </td>
            
          </xsl:if>

      </tr> 

  </xsl:template>
  
  <xsl:template match="item">
    <br>
      <xsl:number format="&#x0069;) "/>
      <xsl:value-of select="."/>
    </br>
  </xsl:template>

  <xsl:template match="type_rodzaje">   
    <br/>
    <xsl:for-each select = "type">
      <xsl:sort select="group/@time"/>
      <xsl:if test="group[@name=$group]">
        <xsl:number format="1. "/>
        Type: <xsl:value-of select="@name"/> start: <xsl:value-of select="group/@time"/><br/>
      </xsl:if>
    </xsl:for-each>    
  </xsl:template>

  <xsl:template name="contact_adm" match="contact_adm">
    Choose contact and send mail:<br/>
    
      <select id="sm">
          <option value="0">Send to...</option>
		  <xsl:apply-templates select="//mail"/>
      </select>

    &#160;&#160;<button onclick="alert(document.getElementById('sm').value)"> SEND </button>
        
  </xsl:template>
  
   <xsl:template match="age_groups">
 
    <br>(<xsl:value-of select="."/>)</br>
	
  </xsl:template>
  
  <xsl:template match="mail">
    <option value="{@val}">      
      <xsl:value-of select="@val"/>
    </option>
  </xsl:template>


</xsl:stylesheet> 