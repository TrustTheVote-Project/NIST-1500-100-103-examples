<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns="http://itl.nist.gov/ns/voting/1500-100/v2" 
    exclude-result-prefixes="xs"
    version="3.0">
    <xsl:mode on-no-match="deep-copy"/>
    <xsl:output indent="true" />
    
    <xsl:template match="ElectionReport/Election/Contest/ContestSelection/VoteCounts"></xsl:template>

    
</xsl:stylesheet>