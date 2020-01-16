# What it is

This git repo provides some XSLT code that let you produce PDF cards of your Jira tickets. You'll get two different styles of PDF cards, one with a title (summary) and description, and one with just the title (summary) in large letters without description.

# What it isn't

I do not provide any code, plug-ins or else to enable your Jira instance to produce the PDF. That means, you manually have to export the desired issues from Jira in XML format.

If you're looking for an Jira integration, take a look at the original github repo from which I forked my branch.

# What do you need

* An XSLT 2 processor like Saxon (tested with Saxon 9.1.0.8J)
* An FO renderer like FOP (tested with FOP Version 2.1)

Optional:

* gnu make, if you want to use my sample Makefile (tested with GNU Make 4.1)

And, of course, you'll need Jira.

# How to use it

1. Clone the repo
1. Copy `cards-config-sample.xsl` to `cards-config.xsl` - or write your own (see below)
1. Export a bunch of Jira issues in XML format, save it under `jira-export.xml` in the repo directory - or copy `jira-export-sample.xml` to `jira-export.xml` 
1. call `make`


# Settings and configuration

## Makefile

The Makefile assumes the software is running on a unix like system with a temporary directory named /tmp. If this isn't true on your system, change it accordingly in the Makefile

    TMP=/tmp

## XSLT-Configuration

You'll need a file named `cards-config.xsl`, I'll provide a file named `cards-config-sample.xsl` for illustration purposes.

It contains a mapping of Jira project keys to colors used to render the PDFs. The essential lines look like this:

      <!-- orange -->
      <xslt:when test="./@key = 'YOURPROJECTKEY'">#ff9900</xslt:when>


It's up to you to replace `YOURPROJECTKEY` with the keys used by your Jira projects. You'll find them in the XML export file.

The config file comes with a default, which means, if you do not adjust the keys you'll get PDFs with gray as the only color used.

    <!-- gray -->
    <xslt:otherwise>#aaaaaa</xslt:otherwise>

These colors above are used for borders and background. Changing background colors might require setting the font color to have enough contrast. You can do this in the second part of the config file (`mode="font-color-on-key-color-background"`).

It works the same way as before.

### Why would you want to set multiple colors?

I'm working in a multi team environment with several teams working on one product. The printed cards are used in multi team meetings, such as plannings and retrospectives. To make it easier to recognize to which team a card belongs, we're using colors. Actually, every team has a team color, which we use consistently at several occasions. For example, we have blank cards for giving feedback on a physical board, and the blank cards have the same colors as the PDFs. Everybody knows immediately which team is addressed if she sees an orange card. Same for red, blue, yellow, green, blue, white and so on.

# Known limitations

1. The project contains a file named xhtml-to-xslfo.xsl by Doug Tidwell. I got the file from the original github repo when I forked it. The XHTML to FO transformation is required to render the rich text fields of a Jira issue, such as the description. When using the software I encountered some problems, i.e. rendering of tables and images didn't work well in all cases. Therefore I disabled some templates in xhtml-to-xslfo.xsl, to ensure the rendering just moves on, accepting that some content is missing in the generated PDFs. Right now non of those issues matters to me, and I didn't analyze the problem. So please don't expect a quick fix.
1. For every XHTML snippet my software writes a temporary file and processes it with xhtml-to-xslfo.xsl. I don't like to write a couple of temporary files, but the only solution I know requires a non-free version of the Saxon XSLT processor. Michael Kay, the developer of Saxon, does an incredibly job and should be supported; without him the XSLT community would merely exist. If you use the software in a professional context, consider buying a paid-for version of Saxon.

# Background

This project is a fork, based on the work of Bas van der Hoek. Initially I had some different needs than those, satisfied by the original project. At the same time I was aware that I didn't already knew, what I actually needed. I made a fork and began to work in a trial and error process. This process has not come to an end, but slowed down in a way that makes me feel I'm close to my own version 1.0. 
