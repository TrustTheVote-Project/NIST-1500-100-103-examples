xquery version "3.1";

declare namespace cdf = "NIST_V1_election_results.xsd";
declare namespace cdf2 = "NIST_V2_election_results_reporting.xsd";

declare namespace xsi="http://www.w3.org/2001/XMLSchema-instance";

declare variable $municipality external;

declare function local:composingUnits($doc, $id) {

let $city := $doc//cdf:GpUnit[@objectId=$id]
for $cunit in tokenize($city/cdf:ComposingGpUnitIds/text())
return $doc//cdf:GpUnit[@objectId=$cunit]
};

declare function local:contests($root, $unitid) {
    $root//cdf:ElectoralDistrictId[.=$unitid]/ancestor::cdf:Contest
};

declare function local:candidates($root, $unitId) {
    let $contests := local:contests($root, $unitId)
    let $candidateIds := 
        for $contest in $contests
       return $contest//cdf:CandidateIds/text()
    for $id in distinct-values($candidateIds)
    return $root//cdf:Candidate[@objectId=$id]
};

declare function local:GpUnits($root, $unitId) {
    let $unit := $root//cdf:GpUnit[@objectId=$unitId]
    return
    ($unit, 
    for $subUnitId in tokenize($unit/cdf:ComposingGpUnitIds/text())
    return $root//cdf:GpUnit[@objectId=$subUnitId])
};

declare function local:offices($root, $unitId) {
    let $contests := local:contests($root, $unitId)
    for $contest in $contests
    for $id in $contest/cdf:OfficeIds
    return $root//cdf:Office[@objectId=$id]
};

declare function local:parties($root, $unitId) {
    let $GpUnits := local:GpUnits($root,$unitId)
    let $partyIds := 
        for $unit in $GpUnits 
        return $unit//cdf:PartyId/text()
    for $id in distinct-values($partyIds)
        return $root//cdf:Party[@objectId=$id]
};

declare function local:persons($root, $unitId) {
    let $candidates := local:candidates($root,$unitId)
    let $personIds := 
        for $candidate in $candidates
        return $candidate/cdf:PersonId/text()
    for $id in distinct-values($personIds)
        return $root//cdf:Person[@objectId=$id]
};

declare function local:er-v2($root, $unitId) {
    <ElectionReport xmlns="http://itl.nist.gov/ns/voting/1500-100/v2"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://itl.nist.gov/ns/voting/1500-100/v2 ../schemas/NIST_V2_election_results_reporting.xsd">
    <cdf2:Format>{ $root/cdf:Format/text() }</cdf2:Format>
    </ElectionReport>
};

declare function local:ElectionReportFor($root, $unitId) {
    <ElectionReport xmlns="NIST_V1_election_results.xsd"
     xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
     xsi:schemaLocation="NIST_V1_election_results.xsd ../schemas/NIST_V1_election_resultsV50.xsd">
        <Election>
            <CandidateCollection>
            { local:candidates($root, $unitId) }
            </CandidateCollection>
            <ContestCollection>
            { local:contests($root, $unitId) }
            </ContestCollection>
            <ElectionScopeId>{$unitId}</ElectionScopeId>
            { $root/cdf:Election/cdf:Name }
            { $root/cdf:Election/cdf:StartDate }
            { $root/cdf:Election/cdf:EndDate }
            { $root/cdf:Election/cdf:Type }
        </Election>
        { $root/cdf:Format}
        { $root/cdf:GeneratedDate}
        <GpUnitCollection>
        { local:GpUnits($root, $unitId) }
        </GpUnitCollection>
        { $root/cdf:Issuer }
        { $root/cdf:IssuerAbbreviation }
        <OfficeCollection>
        { local:offices($root, $unitId) }
        </OfficeCollection>
        <PartyCollection>
        { local:parties($root, $unitId) }
        </PartyCollection>
        <PersonCollection>
        { local:persons($root, $unitId) }
        </PersonCollection>
        { $root/cdf:SequenceStart }
        { $root/cdf:SequenceEnd }
        { $root/cdf:Status }
        { $root/cdf:VendorApplicationId }
        </ElectionReport>
        };

let $root := root()/cdf:ElectionReport

return local:ElectionReportFor($root, $municipality)