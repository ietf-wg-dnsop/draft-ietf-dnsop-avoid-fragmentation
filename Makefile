.SUFFIXES:	.mkd .xml .txt

.mkd.xml:
	kramdown-rfc $(.IMPSRC) > $(.TARGET).new
	mv $(.TARGET).new $(.TARGET)

.xml.txt:
	xml2rfc $(.IMPSRC)

all: draft-ietf-dnsop-avoid-fragmentation.txt

diff: draft-ietf-dnsop-avoid-fragmentation.txt
	-rm avoid-fragmentation.diff.txt avoid-fragmentation.diff.html
	iddiff --side-by-side draft-ietf-dnsop-avoid-fragmentation-16.txt draft-ietf-dnsop-avoid-fragmentation.txt > diff.html
	-diff -ub draft-ietf-dnsop-avoid-fragmentation-16.mkd draft-ietf-dnsop-avoid-fragmentation.mkd > diff.mkd

copy:
	-scp -p draft-ietf-dnsop-avoid-fragmentation.txt draft-ietf-dnsop-avoid-fragmentation.xml draft-ietf-dnsop-avoid-fragmentation.mkd diff.html diff.mkd sh.wide.ad.jp:.public_html/files/
	scp -p draft-ietf-dnsop-avoid-fragmentation.html sh.wide.ad.jp:.public_html/
