# Examples of the Election Results Common Data Format

This repository contains examples of documents that use the Election Results Common Data Format, defined by the National Institute of Standards and Technology (NIST) in two standards:

* [Election Results Reporting Common Data Format (NIST SP 1500-100)](https://github.com/usnistgov/electionResultsReporting) Versions 1 and 2.  Used for election definition

* [Cast Vote Records Common Data Format (NIST SP 1500-103)](https://github.com/usnistgov/CastVoteRecords) Used to encode cast vote records (CVRs)


## Organization of the Repository
The documents are organized by the schema to which they adhere. The CVR/ directory contains documents in the NIST SP 1500 103 format; the EDF/ directory contains two subdirectories, version_1/ and version_2/ corresponding with the two versions of the NIST SP 1500 100 schema.

### Schema Files
The NIST standards are expressed in UML, which has been automatically compiled into XML and JSON schemas.  The latest version of these have been copied into this repository for convenience, and renamed to conform with accepted standards. NIST 1500-103 and the second version of NIST 1500-100 also include json schema defintions; these, too, have been renamed and included in this repository.

### About Serialization
