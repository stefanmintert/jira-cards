all:	stories.pdf stories-alt.pdf
stories.pdf: stories.fo
	fop stories.fo stories.pdf
stories.fo: SearchRequest.xml cards.xsl descriptions.timestamp cards-color-config.xsl
	saxonb-xslt -ext:on -o:stories.fo -s:SearchRequest.xml -xsl:cards.xsl
stories-alt.pdf: stories-alt.fo
	fop stories-alt.fo stories-alt.pdf
stories-alt.fo: SearchRequest.xml cards-alt-layout.xsl descriptions.timestamp cards-color-config.xsl
	saxonb-xslt -ext:on -o:stories-alt.fo -s:SearchRequest.xml -xsl:cards-alt-layout.xsl
descriptions.timestamp: SearchRequest.xml cards.xsl cards-color-config.xsl
	saxonb-xslt -ext:on -im:extractDescriptions -s:SearchRequest.xml -xsl:cards.xsl
clean:
	rm stories.fo stories.pdf stories-alt.fo stories-alt.pdf
