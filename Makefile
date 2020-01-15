CONF=cards-config.xsl
TMP=/tmp
all:	tickets-complete.pdf tickets-titleonly.pdf
tickets-complete.pdf: tickets-complete.fo
	fop tickets-complete.fo tickets-complete.pdf
tickets-complete.fo: jira-export.xml cards.xsl ${TMP}/descriptions.timestamp ${CONF} Makefile
	saxonb-xslt -ext:on -o:tickets-complete.fo -s:jira-export.xml -xsl:cards.xsl tmp=${TMP}
tickets-titleonly.pdf: tickets-titleonly.fo
	fop tickets-titleonly.fo tickets-titleonly.pdf
tickets-titleonly.fo: jira-export.xml cards-titleonly-layout.xsl ${CONF}
	saxonb-xslt -ext:on -o:tickets-titleonly.fo -s:jira-export.xml -xsl:cards-titleonly-layout.xsl tmp=${TMP}
${TMP}/descriptions.timestamp: jira-export.xml cards.xsl ${CONF}
	saxonb-xslt -ext:on -im:extractDescriptions -s:jira-export.xml -xsl:cards.xsl tmp=${TMP}
clean:
	rm -f tickets-complete.fo tickets-complete.pdf tickets-titleonly.fo tickets-titleonly.pdf ${TMP}/descriptions.timestamp *~
