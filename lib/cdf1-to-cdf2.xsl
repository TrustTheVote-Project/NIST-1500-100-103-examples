<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:cdf1="NIST_V1_election_results.xsd"
    xmlns:cdf2="http://itl.nist.gov/ns/voting/1500-100/v2"
    xmlns="http://itl.nist.gov/ns/voting/1500-100/v2" exclude-result-prefixes="xs cdf1 cdf2"
    version="2.0">
    
    <xsl:output indent="yes" method="xml" encoding="UTF-8" />

    <xsl:template match="cdf1:AnnotatedString">
        <AnnotatedString Annotation="{@annotation}">
            <xsl:apply-templates/>
        </AnnotatedString>
    </xsl:template>
    
    <xsl:template match="cdf1:Abbreviation">
        <Abbreviation>
            <Text Language="en">
                <xsl:apply-templates/>
            </Text>
        </Abbreviation>
    </xsl:template>
  
    <xsl:template match="cdf1:BallotMeasureContest">
        <BallotMeasureContest>
            <xsl:apply-templates/>
        </BallotMeasureContest>
    </xsl:template>

    <xsl:template match="cdf1:BallotName">
        <BallotName>
            <xsl:apply-templates/>
        </BallotName>
    </xsl:template>
    
    <xsl:template match="cdf1:BallotSelection">
        <ContestSelection ObjectId="{@objectId}" xsi:type="{@xsi:type}">
            <xsl:apply-templates/>
        </ContestSelection>
    </xsl:template>

<!-- Removed BallotStyle/@ObjectId attribute -->
    <xsl:template match="cdf1:BallotStyle">
        <BallotStyle>
            <xsl:apply-templates/>
        </BallotStyle>
    </xsl:template>

    <xsl:template match="cdf1:BallotSubTitle">
        <BallotSubTitle>
            <xsl:apply-templates/>
        </BallotSubTitle>
    </xsl:template>

    <xsl:template match="cdf1:BallotTitle">
        <BallotTitle>
            <xsl:apply-templates/>
        </BallotTitle>
    </xsl:template>
    
    <xsl:template match="cdf1:BallotsCast">
        <BallotsCast>
            <xsl:apply-templates/>
        </BallotsCast>
    </xsl:template>
    
    <xsl:template match="cdf1:Candidate">
        <Candidate ObjectId="{@objectId}">
            <xsl:apply-templates/>
        </Candidate>
    </xsl:template>
    
    <xsl:template match="cdf1:CandidateIds">
        <CandidateIds>
            <xsl:apply-templates/>
        </CandidateIds>
    </xsl:template>
    
    <xsl:template match="cdf1:ComposingGpUnitIds">
        <ComposingGpUnitIds>
            <xsl:apply-templates/>
        </ComposingGpUnitIds>
    </xsl:template>
    

    
    <xsl:template match="cdf1:Contest">
        <Contest ObjectId="{@objectId}" xsi:type="{@xsi:type}">
            <xsl:apply-templates select="cdf1:Abbreviation"/>
            <xsl:apply-templates select="cdf1:BallotSubtitle"/>
            <xsl:apply-templates select="cdf1:BallotTitle" />
            <xsl:apply-templates select="cdf1:BallotSelection"/>
            <xsl:choose>
                <xsl:when test="cdf1:CountStatus">
                    <xsl:apply-templates select="cdf1:CountStatus" />
                </xsl:when>
                <xsl:otherwise>
                    <CountStatus>
                        <Status>unknown</Status>
                        <Type>other</Type>
                    </CountStatus>
                </xsl:otherwise>
            </xsl:choose> 
            <xsl:apply-templates select="cdf1:ElectoralDistrictId"/>
            <xsl:apply-templates select="cdf1:ExternalIdentifier"/>
            <xsl:apply-templates select="cdf1:HasRotation"/>
            <xsl:apply-templates select="cdf1:Name"/>
            <xsl:apply-templates select="cdf1:OtherCounts"/>
            <xsl:apply-templates select="cdf1:SequenceOrder"/>
            <xsl:apply-templates select="cdf1:SubUnitsReported"/>
            
            <xsl:apply-templates select="cdf1:TotalSubUnits"/>
            <xsl:apply-templates select="cdf1:OfficeIds"/>
            <xsl:apply-templates select="cdf1:VotesAllowed"/>
            <xsl:apply-templates select="cdf1:VoteVariation"/>
            <xsl:apply-templates select="cdf1:OtherVoteVariation"/>

        </Contest>
    </xsl:template>
    
    <xsl:template match="cdf1:Count">
        <Count>
            <xsl:apply-templates/>
        </Count>
    </xsl:template>
    
    <xsl:template match="cdf1:CountStatus">
        <CountStatus>
            <xsl:apply-templates/>
        </CountStatus>
    </xsl:template>
    
    <xsl:template match="cdf1:Device">
        <DeviceClass>
            <xsl:apply-templates/>
        </DeviceClass>
    </xsl:template>
    
    <xsl:template match="cdf1:ElectoralDistrictId">
        <ElectionDistrictId>
            <xsl:apply-templates/>
        </ElectionDistrictId>
    </xsl:template>

    <xsl:template match="cdf1:Election">
        <Election xmlns="http://itl.nist.gov/ns/voting/1500-100/v2">
            <xsl:apply-templates/>
        </Election>
    </xsl:template>

    <xsl:template match="cdf1:ElectionReport">
        <ElectionReport xmlns="http://itl.nist.gov/ns/voting/1500-100/v2">
            <xsl:apply-templates/>
        </ElectionReport>
    </xsl:template>

    <xsl:template match="cdf1:ElectionScopeId">
        <ElectionScopeId>
            <xsl:apply-templates/>
        </ElectionScopeId>
    </xsl:template>

    <xsl:template match="cdf1:EndDate">
        <EndDate>
            <xsl:apply-templates/>
        </EndDate>
    </xsl:template>
    
    <xsl:template match="cdf1:ExternalIdentifier">
        <ExternalIdentifier>
            <xsl:apply-templates/>
        </ExternalIdentifier>
    </xsl:template>
    
    <xsl:template match="cdf1:FirstName">
        <FirstName>
            <xsl:apply-templates/>
        </FirstName>
    </xsl:template>
    
    <xsl:template match="cdf1:Format">
        <Format>
            <xsl:apply-templates/>
        </Format>
    </xsl:template>
    
    <xsl:template match="cdf1:FullName">
        <FullName>
            <xsl:apply-templates/>
        </FullName>
    </xsl:template>
    
    <xsl:template match="cdf1:Gender">
        <Gender>
            <xsl:apply-templates/>
        </Gender>
    </xsl:template>
    
    <xsl:template match="cdf1:GeneratedDate">
        <GeneratedDate>
            <xsl:apply-templates/>
        </GeneratedDate>
    </xsl:template>
    
    <xsl:template match="cdf1:GpUnit">
        <GpUnit ObjectId="{@objectId}" xsi:type="{@xsi:type}">
            <xsl:apply-templates/>
        </GpUnit>
    </xsl:template>
    
    <!-- Removed summary counts from GpUnit  -->
    <xsl:template match="cdf1:GpUnit/cdf1:SummaryCounts"/>
 
    <xsl:template match="cdf1:GpUnit/cdf1:Name">
        <Name>
            <Text Language="en">
                <xsl:apply-templates/>
            </Text>
        </Name>
    </xsl:template>
 
    <xsl:template match="cdf1:GpUnitId">
        <GpUnitId>
            <xsl:apply-templates/>
        </GpUnitId>
    </xsl:template>
    
    <xsl:template match="cdf1:HasRotation">
        <HasRotation>
            <xsl:apply-templates/>
        </HasRotation>
    </xsl:template>
    
    <xsl:template match="cdf1:IsIncumbent">
        <IsIncumbent>
            <xsl:apply-templates/>
        </IsIncumbent>
    </xsl:template>
    
    <xsl:template match="cdf1:IsPartisan">
        <IsPartisan>
            <xsl:apply-templates/>
        </IsPartisan>
    </xsl:template>
    
    <xsl:template match="cdf1:Issuer">
        <Issuer>
            <xsl:apply-templates/>
        </Issuer>
    </xsl:template>
    
    <xsl:template match="cdf1:IssuerAbbreviation">
        <IssuerAbbreviation>
            <xsl:apply-templates/>
        </IssuerAbbreviation>
    </xsl:template>
    
    <xsl:template match="cdf1:LanguageString">
        <LanguageString Language="{@language}">
            <xsl:apply-templates/>
        </LanguageString>
    </xsl:template>

    <xsl:template match="cdf1:LastName">
        <LastName>
            <xsl:apply-templates/>
        </LastName>
    </xsl:template>


    <xsl:template match="cdf1:MiddleName">
        <MiddleName>
            <xsl:apply-templates/>
        </MiddleName>
    </xsl:template>
    
    <xsl:template match="cdf1:Name">
        <Name>
            <xsl:apply-templates/>
        </Name>
    </xsl:template>
    
    <xsl:template match="cdf1:Number">
        <Number>
            <xsl:apply-templates/>
        </Number>
    </xsl:template>

    <xsl:template match="cdf1:OrderedContest">
        <OrderedContest>
            <xsl:apply-templates/>
        </OrderedContest>
    </xsl:template>
   
   <xsl:template match="cdf1:OtherCounts">
       <OtherCounts>
           <xsl:apply-templates/>
       </OtherCounts>
   </xsl:template>
   
    <xsl:template match="cdf1:Office">
        <Office ObjectId="{@objectId}">
            <xsl:apply-templates/>
        </Office>
    </xsl:template>
    
    <xsl:template match="cdf1:OfficeIds">
        <OfficeIds>
            <xsl:apply-templates/>
        </OfficeIds>
    </xsl:template>
    
    <xsl:template match="cdf1:OtherVoteVariation">
        <OtherVoteVariation>
            <xsl:apply-templates/>
        </OtherVoteVariation>
    </xsl:template>
    
    <xsl:template match="cdf1:Party">
        <Party ObjectId="{@objectId}">
            <xsl:apply-templates/>
        </Party>
    </xsl:template>
    
    <xsl:template match="cdf1:PartyContest">
        <PartyContest>
            <xsl:apply-templates/>
        </PartyContest>    
    </xsl:template>
     
    <xsl:template match="cdf1:PartyId">
        <PartyId>
            <xsl:apply-templates />
        </PartyId>
    </xsl:template>
    
    <xsl:template match="cdf1:PartyRegistration">
        <PartyRegistration>
            <xsl:apply-templates/>
        </PartyRegistration>
    </xsl:template>
    
    <xsl:template match="cdf1:PassageThreshold">
        <PassageThreshold>
            <xsl:apply-templates />
        </PassageThreshold>
        
    </xsl:template>
 
    <xsl:template match="cdf1:Person">
        <Person ObjectId="{@objectId}">
            <xsl:apply-templates/>
        </Person>
    </xsl:template>
    
    <xsl:template match="cdf1:PersonId">
        <PersonId>
            <xsl:apply-templates/>
        </PersonId>
    </xsl:template>
    
    <xsl:template match="cdf1:Profession">
        <Profession>
            <xsl:apply-templates/>
        </Profession>
    </xsl:template>
    
    <xsl:template match="cdf1:RetentionContest">
        <RetentionContest>
            <xsl:apply-templates/>
        </RetentionContest>
    </xsl:template>
    
    <xsl:template match="cdf1:Selection">
        <Selection Label="{@label}">
            <xsl:apply-templates></xsl:apply-templates>
        </Selection>
    </xsl:template>

    <xsl:template match="cdf1:SequenceStart">
        <SequenceStart>
            <xsl:apply-templates/>
        </SequenceStart>
    </xsl:template>

    <xsl:template match="cdf1:SequenceEnd">
        <SequenceEnd>
            <xsl:apply-templates/>
        </SequenceEnd>
    </xsl:template>
    
    <xsl:template match="cdf1:SequenceOrder">
        <SequenceOrder>
            <xsl:apply-templates />
        </SequenceOrder>
    </xsl:template>

    <xsl:template match="cdf1:StartDate">
        <StartDate>
            <xsl:apply-templates/>
        </StartDate>
    </xsl:template>
    
    <xsl:template match="cdf1:Status">
        <Status>
            <xsl:apply-templates/>
        </Status>
    </xsl:template>
    
    <xsl:template match="cdf1:SubUnitsReported">
        <SubUnitsReported>
            <xsl:apply-templates/>
        </SubUnitsReported>
    </xsl:template>
    
    <xsl:template match="cdf1:SummaryCounts">
        <BallotCounts>
            <xsl:apply-templates/>
        </BallotCounts>
    </xsl:template>    
    
    <xsl:template match="cdf1:Text">
        <Text Language="{@language}">
            <xsl:apply-templates/>
        </Text>
    </xsl:template>

    <xsl:template match="cdf1:TotalSubUnits">
        <TotalSubUnits>
            <xsl:apply-templates/>
        </TotalSubUnits>
    </xsl:template>

    <xsl:template match="cdf1:Type">
        <Type>
            <xsl:apply-templates/>
        </Type>
    </xsl:template>
    
    <xsl:template match="cdf1:Value">
        <Value>
            <xsl:apply-templates/>
        </Value>
    </xsl:template>
    
    <xsl:template match="cdf1:VendorApplicationId">
        <VendorApplicationId>
            <xsl:apply-templates/>
        </VendorApplicationId>
    </xsl:template>
    
    <xsl:template match="cdf1:VoteCounts[cdf1:Type='total']">
        
    </xsl:template>
    
    <xsl:template match="cdf1:VoteCounts">
        <VoteCounts>
            <xsl:apply-templates/>
        </VoteCounts>
    </xsl:template>
    
    <xsl:template match="cdf1:VotesAllowed">
        <VotesAllowed>
            <xsl:apply-templates/>
        </VotesAllowed>
    </xsl:template>

    <xsl:template match="cdf1:VoteVariation">
        <VoteVariation>
            <xsl:apply-templates/>
        </VoteVariation>
    </xsl:template>

    <xsl:template
        match="cdf1:BallotStyleCollection | cdf1:CandidateCollection | cdf1:ContestCollection | cdf1:GpUnitCollection | cdf1:OfficeCollection | cdf1:PartyCollection | cdf1:PersonCollection | cdf1:VoteCountsCollection | cdf1:ExternalIdentifiers">
        <xsl:apply-templates/>
    </xsl:template>

</xsl:stylesheet>
