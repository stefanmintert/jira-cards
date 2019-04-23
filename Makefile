stories.pdf: stories.fo
	fop stories.fo stories.pdf
stories.fo: SearchRequest.xml cards.xsl descriptions
	saxonb-xslt -ext:on -o:stories.fo -s:SearchRequest.xml -xsl:cards.xsl
descriptions: SearchRequest.xml cards.xsl
	saxonb-xslt -ext:on -im:extractDescriptions -s:SearchRequest.xml -xsl:cards.xsl
clean:
	rm stories.fo stories.pdf
