LDIR=../../lib
SAXON=$(LDIR)/saxon-he-10.5.jar
XQ=$(LDIR)/electionReportFor.xq
CDF2=$(LDIR)/cdf1-to-cdf2.xsl
CVR=$(LDIR)/cdf1-to-cvr.xsl



v2_files := GpU08AZ0.v2.cdf.xml GpU08BE0.v2.cdf.xml GpU08BP0.v2.cdf.xml GpU08CQ0.v2.cdf.xml GpU08GD0.v2.cdf.xml GpU08LS0.v2.cdf.xml GpU08RE0.v2.cdf.xml

cvr_files := GpU08AZ0.cvr.xml GpU08BE0.cvr.xml GpU08BP0.cvr.xml GpU08CQ0.cvr.xml GpU08GD0.cvr.xml GpU08LS0.cvr.xml GpU08RE0.cvr.xml

all: $(v2_files)

cvrs: $(cvr_files)

%.v2.cdf.xml: %.v1.cdf.xml
	java -cp $(SAXON) net.sf.saxon.Transform -s:$< -xsl:$(CDF2) -o:../version_2/$@

%.cvr.xml: %.v1.cdf.xml
	java -cp $(SAXON) net.sf.saxon.Transform -s:$< -xsl:$(CVR) -o:../../CVR/$@
