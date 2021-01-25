<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:output method="xml" encoding="utf-8"/>
  

<xsl:variable name="curl">file:///C:\Users\????\Desktop\xml-projekt\Transformacja2-Ready</xsl:variable>

<xsl:template match="/">
    <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
		<fo:layout-master-set>
	  
			<fo:simple-page-master master-name="Tytulowa"
								page-height="29.7cm" page-width="21cm"
								margin-top="7cm" margin-bottom="2cm"
								margin-left="2.5cm" margin-right="2.5cm">
			  <fo:region-body margin-top="2cm" />
			  <fo:region-after extent="1cm" />
			</fo:simple-page-master>
		
			<fo:simple-page-master master-name="Ogólne"		  
								page-height="21cm" page-width="29.7cm"
								margin-top="1cm" margin-bottom="1cm"
								margin-left="2.5cm" margin-right="2.5cm">
									
			  <fo:region-body margin-top="1cm" />
			  <fo:region-before extent="1cm" />		
			  <fo:region-after extent="1cm" />
			</fo:simple-page-master>
			
			<fo:simple-page-master master-name="Ostatni"
								page-height="29.7cm" page-width="21cm"
								margin-top="7cm" margin-bottom="2cm"
								margin-left="2.5cm" margin-right="2.5cm">
								
			  <fo:region-body margin-top="2cm" />
			  <fo:region-after extent="4cm"/>
			</fo:simple-page-master>	
		
			<fo:page-sequence-master master-name="nazwa">
			  <fo:repeatable-page-master-alternatives>
				<fo:conditional-page-master-reference master-reference="Tytulowa" page-position="first"/>
				<fo:conditional-page-master-reference master-reference="Ogólne" page-position="rest"/>
				<fo:conditional-page-master-reference master-reference="Ostatni" page-position="last"/>
			  </fo:repeatable-page-master-alternatives>
			</fo:page-sequence-master>
		</fo:layout-master-set>
	  
		<fo:page-sequence master-reference="Tytulowa">
			<fo:static-content flow-name="xsl-region-after">
			  <fo:block  text-align="center" font-size="10pt">
			   GDANSK 
			  </fo:block>
			</fo:static-content>
		
			<fo:flow flow-name="xsl-region-body">
			  <fo:block id="1" text-align="center" font-size="40pt" color="blue">
				<xsl:apply-templates select="//document/DocumentName"/>
			  </fo:block>
			  <fo:block id="2" text-align="center" font-size="30pt">
				<xsl:apply-templates select="document/competition/@name"/>
				<fo:block text-align="center" >
				<fo:external-graphic height="auto" width="auto" content-height="auto"
                        content-width="auto" src="url('images/1_1391878623.jpg')">
              </fo:external-graphic>        				
				</fo:block>			
			  </fo:block>
			</fo:flow>   
		</fo:page-sequence>
	  
		<fo:page-sequence master-reference="Ogólne">
			<fo:static-content flow-name="xsl-region-before">
			  <fo:block  text-align="center" font-size="10pt">
				<xsl:text>Strona nr </xsl:text>
				<fo:page-number />
			</fo:block>
			</fo:static-content>
			<fo:static-content flow-name="xsl-region-after">
			  <fo:block  text-align="center" font-size="10pt">
			   GDANSK
			  </fo:block>
			</fo:static-content>
			
			<fo:flow flow-name="xsl-region-body">
			  <fo:block id="3" text-align="center" font-size="10pt" color="blue">
			  
					<fo:block text-align="center" font-size="20pt" color="black" font-weight="bold">Participants</fo:block>

					<fo:table>
						<fo:table-column column-width="25mm"/>
						<fo:table-column column-width="25mm"/>
						<fo:table-column column-width="50mm"/>
						<fo:table-column column-width="30mm"/>
						<fo:table-column column-width="25mm"/>
						<fo:table-column column-width="120mm"/>
						<fo:table-header  padding-bottom="0.5cm">
							<fo:table-row>
								<fo:table-cell padding-top="5">
									<fo:block font-weight="bold">FIO</fo:block>
								</fo:table-cell>
								<fo:table-cell padding-top="5">
									<fo:block font-weight="bold">CREW</fo:block>
								</fo:table-cell>
								<fo:table-cell padding-top="5">
									<fo:block font-weight="bold">CONTACTS</fo:block>
								</fo:table-cell>							
								<fo:table-cell padding-top="5">
									<fo:block font-weight="bold">EXPERIENCE</fo:block>
								</fo:table-cell>							
								<fo:table-cell padding-top="5">
									<fo:block font-weight="bold">FROM</fo:block>
								</fo:table-cell>							
								<fo:table-cell padding-top="5">
									<fo:block font-weight="bold">PHOTO</fo:block>
								</fo:table-cell>							
								
							</fo:table-row>
						</fo:table-header>

						<fo:table-body>	
						
							<xsl:apply-templates select="//document/participants/participant"/>
							
						</fo:table-body>

					</fo:table>
					
					<fo:block break-before="page"/>
					
					<fo:block text-align="center" font-size="20pt" color="black" font-weight="bold">Judges</fo:block>
					<fo:block text-align="center" font-size="15pt" color="blue" margin-left="3cm" margin-top="3cm">
					<fo:table>
						<fo:table-column column-width="30mm"/>
						<fo:table-column column-width="50mm"/>
						<fo:table-column column-width="30mm"/>
						<fo:table-column column-width="50mm"/>
						<fo:table-header padding-bottom="1cm">
							<fo:table-row>
								<fo:table-cell padding-top="5">
									<fo:block font-weight="bold">FIO</fo:block>
								</fo:table-cell>
								<fo:table-cell padding-top="5">
									<fo:block font-weight="bold">PlACE</fo:block>
								</fo:table-cell>
								<fo:table-cell padding-top="5">
									<fo:block font-weight="bold">CLASS</fo:block>
								</fo:table-cell>
								<fo:table-cell padding-top="5">
									<fo:block font-weight="bold">CONTACTS</fo:block>
								</fo:table-cell>																		
								
							</fo:table-row>
						</fo:table-header>

						<fo:table-body>	
						
							<xsl:apply-templates select="//document/judges/trasa/osoba"/>
							
						</fo:table-body>

					</fo:table>				
					</fo:block>
					
			
			  </fo:block>		  
			</fo:flow>   
		</fo:page-sequence>
	  
		<fo:page-sequence master-reference="Ostatni" >
			<fo:static-content flow-name="xsl-region-after">
			  <fo:block text-align="center" font-size="10pt">
			   GDANSK 
			  </fo:block>
			</fo:static-content>
			
			<fo:flow flow-name="xsl-region-body">					  
				<fo:block padding-top="1cm" padding-bottom="1cm" text-align="center" font-size="15pt" color="black" background-color="#EBFAFF" font-weight="bold">KONTAKTY:</fo:block>			  
				<fo:block text-align="center" font-size="15pt" color="blue" >
					<fo:list-block provisional-label-separation="5mm">
						<xsl:apply-templates select="//document/contact_adm/mail"/>
  
					</fo:list-block>
				</fo:block>			  
			</fo:flow>   
		  </fo:page-sequence>
		  
	</fo:root>
</xsl:template>  
		
		
	  <xsl:template match="participant">
		
						<fo:table-row>
							<fo:table-cell>
								<fo:block><xsl:apply-templates select="member"/></fo:block>
							</fo:table-cell>
							<fo:table-cell>
							<fo:block><xsl:value-of select="@crew"/></fo:block>
							</fo:table-cell>
							<fo:table-cell>
							<fo:block linefeed-treatment="preserve"><xsl:apply-templates select="contacts"/></fo:block>
							</fo:table-cell>						
							<fo:table-cell>
							<fo:block>
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
							</fo:block>
							</fo:table-cell>						
							<fo:table-cell>
							<fo:block><xsl:apply-templates select="postadr/city"/></fo:block>
							</fo:table-cell>
							<fo:table-cell>
							<fo:block>	
								<fo:external-graphic content-width="5cm" >
									<xsl:attribute name="src"><xsl:value-of select="$curl"/><xsl:apply-templates select="photo"/></xsl:attribute>
								</fo:external-graphic>
							</fo:block>
							</fo:table-cell>
						</fo:table-row>

	  </xsl:template> 
	 <xsl:template match="osoba">
	
		<fo:table-row>
			<fo:table-cell>
				<fo:block><xsl:apply-templates select="member"/></fo:block>
			</fo:table-cell>
			<fo:table-cell>
				<fo:block><xsl:value-of select="@place"/></fo:block>
			</fo:table-cell>
			<fo:table-cell>
				<fo:block><xsl:value-of select="@class"/></fo:block>
			</fo:table-cell>
			<fo:table-cell>
				<fo:block linefeed-treatment="preserve"><xsl:apply-templates select="contacts"/></fo:block>
			</fo:table-cell>						
				
		</fo:table-row>

	</xsl:template> 
	
  <xsl:template match="mail">	
	<fo:list-item line-height="20mm">
		<fo:list-item-label>
		<fo:block font-size="15pt" font-family="sans-serif">									
		</fo:block>
		</fo:list-item-label>
	    <fo:list-item-body>
			<fo:block font-size="15pt" font-family="sans-serif">
				<fo:block><xsl:value-of select="@fio"/> : <fo:inline font-weight="bold"><xsl:value-of select="@val"/></fo:inline></fo:block>
			</fo:block>
		</fo:list-item-body>
	</fo:list-item>
  </xsl:template> 
  
  

  
  
  </xsl:stylesheet>