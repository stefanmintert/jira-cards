## Atlassian Toolchain
Install the [Atlassian SDK](https://developer.atlassian.com/display/DOCS/Set+up+the+Atlassian+Plugin+SDK+and+Build+a+Project) with Homebrew.

  $ brew tap atlassian/tap
  $ brew install atlassian/tap/atlassian-plugin-sdk

The SDK is based on Maven, with a repository in `/usr/local/Cellar/atlassian-plugin-sdk/4.2.12/libexec/repository`.

### Workflow
Run a fresh JIRA instance with `atlas-run-standalone --product jira`, or `atlas-run` for your project.

    $ atlas-package
    $ atlas-install-plugin

Then open http://localhost:2990/jira/secure/Dashboard.jspa in Chrome, login as `admin` with password `admin`.

### JIRA Agile
Create a new Agile Scrum project, and automatically install JIRA Agile. Click the Agile tab to provide the license key.

The plug-in is installed in `amps-standalone/target/jira/home/plugins/installed-plugins` and needs to be imported into
your Maven repository.

  $ mvn install:install-file -Dfile=plugin.2028706680741470180.jira-greenhopper-plugin-6.3.6.1.jar -DgroupId=com.atlassian.jira.plugins -DartifactId=jira-greenhopper-plugin -Dversion=6.3.6.1 -Dpackaging=jar

See the [JavaDoc](https://docs.atlassian.com/greenhopper/6.3.6.1/)

https://developer.atlassian.com/display/JIRADEV/JIRA+Agile+LinkProvider+Plugin+Module

## Sample

  $ brew install mercurial
  $ hg clone ssh://hg@bitbucket.org/atlassian/wallboards

## REST
https://docs.atlassian.com/jira/REST/6.1/.

## Plug-in
https://developer.atlassian.com/display/JIRADEV/JIRA+Agile+Development

## Command-line

    /opt/fop-1.1/fop -xml tmp/single.xml -xsl cards.xsl -pdf tmp/cards.pdf

There is an unofficial [schema](http://svn.apache.org/viewvc/xmlgraphics/fop/trunk/src/foschema/fop.xsd?view=co) to [validate](http://xmlgraphics.apache.org/fop/fo.html#fo-validate).

## XHTML to FO
The `cards.xsl` assumes an RSS style XML file. The `description` field of that file will contain XML-escaped HTML that
needs to be processed first, such that:

`&lt;` becomes `<`, `&gt;` becomes `>`, and `&quot;` becomes `"`. The result is rendered with developWorks
[xhtml-to-xslfo.xsl](http://www.ibm.com/developerworks/library/x-xslfo2app/).
Antenna House has [several](http://www.antennahouse.com/XSLsample/XSLsample.htm) stylesheets.