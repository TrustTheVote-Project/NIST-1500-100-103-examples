<?xml version="1.0" encoding="UTF-8"?> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:cdf1="NIST_V1_election_results.xsd"
    xmlns="http://itl.nist.gov/ns/voting/1500-103/v1" exclude-result-prefixes="xs cdf1" version="2.0">

    <xsl:output indent="yes" method="xml" encoding="UTF-8"/>

    <xsl:template match="cdf1:BallotSelection">
        <ContestSelection ObjectId="{@objectId}" xsi:type="{@xsi:type}">
            <xsl:apply-templates select="cdf1:CandidateIds"/>
        </ContestSelection>
    </xsl:template>

    <xsl:template match="cdf1:CandidateIds">
        <CandidateIds>
            <xsl:apply-templates/>
        </CandidateIds>
    </xsl:template>

    <xsl:template match="cdf1:ElectionReport">
        <CastVoteRecordReport xmlns="http://itl.nist.gov/ns/voting/1500-103/v1">
            <xsl:apply-templates select="cdf1:Election"/>
            <xsl:apply-templates select="cdf1:GeneratedDate"/>
            <xsl:apply-templates select="cdf1:GpUnitCollection/cdf1:GpUnit"/>
            <xsl:apply-templates select="cdf1:PartyCollection/cdf1:Party"/>
            <xsl:call-template name="extras" />
        </CastVoteRecordReport>
    </xsl:template>

    <xsl:template match="cdf1:Election">
        <Election ObjectId="some-id">
            <xsl:apply-templates select="cdf1:CandidateCollection/cdf1:Candidate"/>
            <xsl:apply-templates select="cdf1:ContestCollection/cdf1:Contest"/>
            <xsl:apply-templates select="cdf1:ElectionScopeId"/>
        </Election>
    </xsl:template>

    <xsl:template match="cdf1:Candidate">
        <Candidate ObjectId="{@objectId}">
            <Name>
                <xsl:apply-templates select="cdf1:BallotName"/>
            </Name>
            <PartyId>
                <xsl:apply-templates select="cdf1:PartyId"/>
            </PartyId>
        </Candidate>
    </xsl:template>

    <xsl:template match="cdf1:Contest">
        <Contest ObjectId="{@objectId}" xsi:type="{@xsi:type}">
            <xsl:apply-templates select="cdf1:BallotSelection"/>
            <xsl:apply-templates select="cdf1:Name"/>
        </Contest>
    </xsl:template>

    <xsl:template match="cdf1:ElectionScopeId">
        <ElectionScopeId>
            <xsl:apply-templates/>
        </ElectionScopeId>
    </xsl:template>

    <xsl:template match="cdf1:GeneratedDate">
        <GeneratedDate>
            <xsl:apply-templates/>
        </GeneratedDate>
    </xsl:template>

    <xsl:template match="cdf1:GpUnit[@xsi:type = 'ReportingUnit']">
        <GpUnit ObjectId="{@objectId}">
            
                <xsl:apply-templates select="cdf1:Name"/>
            
            <xsl:apply-templates select="cdf1:Type"/>
        </GpUnit>
    </xsl:template>

    <xsl:template match="cdf1:Name">
        <Name>
            <xsl:apply-templates/>
        </Name>
    </xsl:template>

    <xsl:template match="cdf1:Party">
        <Party ObjectId="{@objectId}">
            <xsl:apply-templates select="cdf1:Name"/>
        </Party>
    </xsl:template>
    
    <xsl:template match="cdf1:Type">
        <xsl:choose>
            <xsl:when test=". = 'precinct'">
                <Type>precinct</Type>
            </xsl:when>
            <xsl:otherwise>
                <Type>other</Type>
                <OtherType><xsl:value-of select="."/></OtherType>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template name="extras">
        <ReportGeneratingDeviceIds>simulated-1</ReportGeneratingDeviceIds>
        <ReportingDevice ObjectId="simulated-1">
            <Application>Ballot Marking application</Application>
            <Manufacturer>Trust the Vote</Manufacturer>
            <Model>some-model-number</Model>
            <SerialNumber>some-serial-number</SerialNumber>
        </ReportingDevice>
        <ReportType>originating-device-export</ReportType>
        <Version>1.0.0</Version>        
    </xsl:template>

</xsl:stylesheet>
