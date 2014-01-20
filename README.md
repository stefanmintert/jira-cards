
    /opt/fop-1.1/fop -xml single.xml -xsl cards.xsl -pdf cards.pdf

There is an unofficial [schema](http://svn.apache.org/viewvc/xmlgraphics/fop/trunk/src/foschema/fop.xsd?view=co) to [validate](http://xmlgraphics.apache.org/fop/fo.html#fo-validate).

## XHTML to FO
The `cards.xsl` assumes an RSS style XML file. The `description` field of that file will contain XML-escaped HTML that
needs to be processed first, such that:

`&lt;` becomes `<`, `&gt;` becomes `>`, and `&quot;` becomes `"`. The result is rendered with developWorks
[xhtml-to-xslfo.xsl](http://www.ibm.com/developerworks/library/x-xslfo2app/).
Antenna House has [several](http://www.antennahouse.com/XSLsample/XSLsample.htm) stylesheets.