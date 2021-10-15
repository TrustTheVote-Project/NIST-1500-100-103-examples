LDIR=./lib
SAXON=$(LDIR)/saxon-he-10.5.jar
XQ=$(LDIR)/electionReportFor.xq
CDF2=$(LDIR)/cdf1-to-cdf2.xsl
CVR=$(LDIR)/cdf1-to-cvr.xsl

%.v2.cdf.xml: EDF/version_1/%.v1.cdf.xml
	java -cp $(SAXON) net.sf.saxon.Transform -s:$< -xsl:$(CDF2) -o:EDF/version_2/$@

%.cvr.xml: EDF/version_1/%.v1.cdf.xml
	java -cp $(SAXON) net.sf.saxon.Transform -s:$< -xsl:$(CVR) -o:CVR/$@
