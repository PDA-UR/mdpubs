---
# Note: not every field is used by every template. 
title:  'Writing ACM Conference Papers in Markdown'
shorttitle: 'Writing ACM ...'   # used for headers in order to avoid overlaps
author:
- firstname: Max
  lastname: Mustermann
  affiliation: 
    institution: University of Musterstadt
    street: Universitätsstr. 1
    city: Musterstadt
    postcode: 12345
    state:
    country: Germany
  email: max.mustermann@example.com
  orcid: 0000-0000-0000-0000
  bio: # some biographical text
  photo: # filename of author photo
- firstname: Ike
  lastname: Antkare
  affiliation: 
    institution: International Institute of Technology
    street:  
    city:   
    postcode:    
    state:
    country: United Slates of Earth
  email: Ike.Antkare@iit.use
  orcid: 0000-0000-0000-0001
  bio: # some biographical text
  photo: # filename of author photo
number_of_authors: 2
shared_affiliation: ["University of Somewhere", "12345 Musterstadt, Germany"] # not used anymore for ACM publications
shortauthors: Mustermann et al.
keywords: [example, markdown, test, pandoc, LaTeX]
general_terms: [none]
categories: [none]
link-citations: false
links-as-notes: false
copyright: rightsretained  # rightsretained, acmlicensed, acmcopyright, usgov, usgovmixed, cagov, cagovmixed
anonymized: false
authorversion: false  # mark as author's version
for-review: false   # add e.g., line numbers to supporting formats
conference:
    year: 2019
    short: "EXAMPLE '19"
    long:  "Second International Conference on Examples and More 2019"
    date:  "May 4-9, 2019"
    place: "Glasgow"
booktitle: "EXAMPLE '19 Adjunct Proceedings"  # automatically generated from conference info if empty
doi: 
isbn: 
price: # nothing - put value into quotes to avoid interpretation as number ('15.00' instead of 15.00)
...

::: Abstract 
This sample paper demonstrates how to write a scientific paper in Markdown.
The abstract needs to be put into a so-called *fenced div*.
This allows the toolchain to extract it and put it into the correct metadata field for the rendering template.
:::

<!-- This is a comment. 
If you add a figure with a *teaser* class (i.e. with the string `.teaser` in the curly braces), that image is used for the two-column teaser image on page one.
The `width` property isn't used much at the moment.
-->
![This is a special two-column *teaser figure*](img/sampleteaser.pdf){#fig:teaser width=100% .teaser description="Every paper needs a teaser figure."}

# Introduction

This sample document contains some text from the official ACM LaTeX template.

ACM's consolidated article template, introduced in 2017, provides a
consistent LaTeX style for use across ACM publications, and incorporates
accessibility and metadata-extraction functionality necessary for future
Digital Library endeavors. Numerous ACM and SIG-specific LaTeX templates
have been examined, and their unique features incorporated into this
single new template.

However, not everyone likes writing LaTeX code.
Some people prefer writing and reading Markdown text.
However, for submission to ACM conferences and journals, the official template needs to be used.

This Markdown template and toolchain allow authors to write straightforward Markdown while supporting a few of the unique features of the ACM LaTeX template.

It is still work in progress and does not yet follow all ACM style requirements.
However, authors can easily use the generated TeX output to prepare a submission that follows ACM's requirements.

For further information on the LaTeX class, the *LaTeX User's Guide* is available from
<https://www.acm.org/publications/proceedings-template>.

# Feature Demo
<!-- Background ---------------------------------------------- -->
As shown by Antkare [@Labbe2010IkeAntkare; @Antkare2009ReinforcementLearning], publishing is important.
This example document contains fragments typically used when writing a scientific paper. Please check the [Pandoc User's Guide](https://pandoc.org/MANUAL.html) for more details on *Pandoc-flavored Markdown*.
[@fig:figure_one] is a placeholder.

<!-- ![An image that demonstrates something. This is the SVG version that only works if you have installed Inkscape.](img/placeholder.svg){#fig:figure_one} -->

![An image that demonstrates something. This is the PDF version of the image.](img/placeholder.pdf){#fig:figure_one}

**Note:** Footnotes are useful[^a_footnote]. 
<!-- Putting each sentence on its own line makes editing/reformatting easier. -->

[^a_footnote]: When used sparingly. They are a good place for linking to websites, such as <https://github.com/alex/what-happens-when>.

# Examples

## Apples
Lists are easy:

* a first item
* and a second one with an unrelated footnote[^quickstep]

[^quickstep]: For long URLs, insert manual breaks like this: [https://docs.google.com/document/d/1B3GfZkwAfHlQE5kAuHcn-wq8I -7D5UF2Ap7C_CYk5co/](https://docs.google.com/document/d/1B3GfZkwAfHlQE5kAuHcn-wq8I-7D5UF2Ap7C_CYk5co/)

## Bananas

Numbered lists:

1. the user always comes first
2. minutes come second
5. now comes the last item. Be aware that Pandoc ignores which numbers you actually place in front!

A small *pseudo-code* listing (which probably should have a caption?)

~~~~ {#lst:helloworld .python .numberLines}
def hello(s):
  print("Hello " + s)
~~~~


Put two space characters at the end of a line to insert a manual line break.  
Teletype formatting example: ``pandoc --help`` is helpful.

Insert an empty line to start a new paragraph.

## Metadata

Author names and many other relevant metadata are set in the YAML block at the beginning of the document.
However, currently, the output template and some template-specific options are only set in the Makefile.
If you want to switch between single-column *manuscript* style and two-columnt *sigconf* style, you need to edit the `sigconf.mk` Makefile.



# Typefaces

The "`acmart`" document class requires the use of the "Libertine"
typeface family. Your TeX installation should include this set of
packages. Please do not substitute other typefaces. The "`lmodern`" and
"`ltimes`" packages should not be used, as they will override the
built-in typeface families.

# Title Information

The title of your work should use capital letters appropriately -
<https://capitalizemytitle.com/> has useful rules for capitalization.
Use the `title` command to define the title of your work. If your work
has a subtitle, define it with the `subtitle` command. Do not insert
line breaks in your title.

If your title is lengthy, you must define a short version to be used in
the page headers, to prevent overlapping text. 
You can do this at the top of the YAML block.


# Authors and Affiliations

Each author must be defined separately for accurate metadata
identification. Multiple authors may share one affiliation. Authors'
names should not be abbreviated; use full first names wherever possible.
Include authors' e-mail addresses whenever possible.


The `authornote` and `authornotemark` commands in the LaTeX template allow a note to apply to multiple authors --- for example, if the first two authors of an article contributed equally to the work.

This feature is currently **not** supported in the Markdown toolchain.


# Rights Information

Authors of any work published by ACM will need to complete a rights
form. Depending on the kind of work, and the rights management choice
made by the author, this may be copyright transfer, permission, license,
or an OA (open access) agreement.

Regardless of the rights management choice, the author will receive a
copy of the completed rights form once it has been submitted. This form
contains LaTeX commands that must be copied into the source document.
When the document source is compiled, these commands and their
parameters add formatted text to several areas of the final document:

-   the "ACM Reference Format" text on the first page.

-   the "rights management" text on the first page.

-   the conference information in the page header(s).

Rights information is unique to the work; if you are preparing several
works for an event, make sure to use the correct set of commands with
each of the works.

The ACM Reference Format text is required for all articles over one page
in length, and is optional for one-page articles (abstracts).

# CCS Concepts and User-Defined Keywords

Two elements of the "acmart" document class provide powerful taxonomic
tools for you to help readers find your work in an online search.

The ACM Computing Classification System ---
<https://www.acm.org/publications/class-2012> --- is a set of
classifiers and concepts that describe the computing discipline. Authors
can select entries from this classification system, via
<https://dl.acm.org/ccs/ccs.cfm>, and generate the commands to be
included in the LaTeX source.

User-defined keywords are a comma-separated list of words and phrases of
the authors' choosing, providing a more flexible way of describing the
research being presented.

CCS concepts and user-defined keywords are required for for all articles
over two pages in length, and are optional for one- and two-page
articles (or abstracts).

# Sectioning Commands

Your work should use standard LaTeX sectioning commands: `section`,
`subsection`, `subsubsection`, and `paragraph`. They should be numbered;
do not remove the numbering from the commands.

Simulating a sectioning command by setting the first word or words of a
paragraph in boldface or italicized text is **not allowed.**

# Tables

The "`acmart`" document class includes the "`booktabs`" package ---
<https://ctan.org/pkg/booktabs> --- for preparing high-quality tables.

Table captions are placed *above* the table.

Because tables cannot be split across pages, the best placement for them
is typically the top of the page nearest their initial cite. To ensure
this proper "floating" placement of tables, use the environment
**table** to enclose the table's contents and the table caption. The
contents of the table itself must go in the **tabular** environment, to
be aligned properly in rows and columns, with the desired horizontal and
vertical rules. Again, detailed instructions on **tabular** material are
found in the *LaTeX User's Guide*.

Immediately following this sentence is the point at which
[@tbl:freq] is included in the input file; compare the placement of the table here with
the table in the printed output of this document.


::: {#tbl:freq}
   Non-English or Math    Frequency   Comments
  --------------------- ------------- -------------------
            Ø            1 in 1,000   For Swedish names
          $\pi$            1 in 5     Common in math
           \$              4 in 5     Used in business
       $\Psi^2_1$        1 in 40,000  Unexplained usage

  : Frequency of Special Characters
:::


To set a wider table, which takes up the whole width of the page's live
area, use the environment **table\*** to enclose the table's contents
and the table caption. As with a single-column table, this wide table
will "float" to a location deemed more desirable. Immediately following
this sentence is the point at which
Table [@tbl:commands] is included in the input file; again, it is
instructive to compare the placement of the table here with the table in
the printed output of this document.


::: {#tbl:commands}
      Command       A Number  Comments
  ---------------- ---------- ------------------
   `\author`              100     Author
   `\table`               300     For tables
   `\table*`             400     For wider tables
:::


# Math Equations

You may want to display math equations in three distinct styles: inline,
numbered or non-numbered display. Each of the three are discussed in the
next sections.

## Inline (In-text) Equations

A formula that appears in the running text is called an inline or
in-text formula. 
<!--
It is produced by the **math** environment, which can
be invoked with the usual ``\begin`` ... ``/end`` construction or
with the short form ``$`` ... ``$``. You can use any of the symbols and
structures, from $\alpha$ to $\omega$, available in
LaTeX [@Lamport:LaTeX]; this section will simply show a few examples of
in-text equations in context. Notice how this equation:
$  \lim_{n\rightarrow \infty}x=0$, set here in in-line math style, looks
slightly different when set in display style. (See next section).
-->

# Display Equations

A numbered display equation---one set off by vertical space from the
text and centered horizontally---is produced by the **equation**
environment. An unnumbered display equation is produced by the
**displaymath** environment.

Again, in either environment, you can use any of the symbols and
structures available in LaTeX; this section will just give a couple of
examples of display equations in context. First, consider the equation,
shown as an inline equation above: $$\lim_{n\rightarrow \infty}x=0$$
Notice how it is formatted somewhat differently in the **displaymath**
environment. Now, we'll enter an unnumbered equation:
$$\sum_{i=0}^{\infty} x + 1$$ and follow it with another numbered
equation: $$\sum_{i=0}^{\infty}x_i=\int_{0}^{\pi+2} f$$ just to
demonstrate LaTeX's able handling of numbering.

# Figures

The "`figure`" environment should be used for figures. One or more
images can be placed within a figure. If your figure contains
third-party material, you must clearly identify it as such, as shown in
the example below ([@fig:placeholder1; @fig:placeholder2]) .

Your figures should contain a caption which describes the figure to the
reader.

Figure captions are placed *below* the figure.
![A placeholder image with a single-column width.](img/placeholder.pdf){description="Every image should have a description!" #fig:placeholder1}


![A placeholder image with a two-column width.](img/sampleteaser.pdf){description="Every image should have a description!" #fig:placeholder2 .wide}

Every figure should also have a figure description unless it is purely
decorative. These descriptions convey what's in the image to someone who
cannot see it. They are also used by search engine crawlers for indexing
images, and when images cannot be loaded.

A figure description must be unformatted plain text less than 2000
characters long (including spaces). **Figure descriptions should not
repeat the figure caption -- their purpose is to capture important
information that is not already provided in the caption or the main text
of the paper.** For figures that convey important and complex new
information, a short text description may not be adequate. More complex
alternative descriptions can be placed in an appendix and referenced in
a short figure description. For example, provide a data table capturing
the information in a bar chart, or a structured list representing a
graph. For additional information regarding how best to write figure
descriptions and why doing this is so important, please see
<https://www.acm.org/publications/taps/describing-figures/>.

# Citations and Bibliographies

The use of  for the preparation and formatting of one's references is
strongly recommended. Authors' names should be complete --- use full
first names ("Donald E. Knuth") not initials ("D. E. Knuth") --- and the
salient identifying features of a reference should be included: title,
year, volume, number, pages, article DOI, etc.

The bibliography is included in your source document with these two
commands, placed just before the `\end{document}` command:

      \bibliographystyle{ACM-Reference-Format}
      \bibliography{bibfile}

where "`bibfile`" is the name, without the "`.bib`" suffix, of the
 file.

Citations and references are numbered by default. A small number of ACM
publications have citations and references formatted in the "author
year" style; for these exceptions, please include this command in the
**preamble** (before the command "`\begin{document}`") of your
LaTeX source:

      \citestyle{acmauthoryear}

Some examples. A paginated journal article [@Abril07], an enumerated
journal article [@Cohen07], a reference to an entire issue [@JCohen96],
a monograph (whole book) [@Kosiur01], a monograph/whole book in a series
(see 2a in spec. document) [@Harel79], a divisible-book such as an
anthology or compilation [@Editor00] followed by the same example,
however we only output the series if the volume number is given
[@Editor00a] (so Editor00a's series should NOT be present since it has
no vol. no.), a chapter in a divisible book [@Spector90], a chapter in a
divisible book in a series [@Douglass98], a multi-volume work as book
[@Knuth97], a couple of articles in a proceedings (of a conference,
symposium, workshop for example) (paginated proceedings article)
[@Andler79; @Hagerup1993], a proceedings article with all possible
elements [@Smith10], an example of an enumerated proceedings article
[@VanGundy07], an informally published work [@Harel78], a couple of
preprints [@Bornmann2019; @AnzarootPBM14], a doctoral dissertation
[@Clarkson85], a master's thesis: [@anisi03], an online document / world
wide web resource [@Thornburg01; @Ablamowicz07; @Poker06], a video game
(Case 1) [@Obama08] and (Case 2) [@Novak03] and [@Lee05] and (Case 3) a
patent [@JoeScientist001], work accepted for publication [@rous08],
'YYYYb'-test for prolific author [@SaeediMEJ10] and [@SaeediJETC10].
Other cites might contain 'duplicate' DOI and URLs (some SIAM articles)
[@Kirschmer:2010:AEI:1958016.1958018]. Boris / Barbara Beeton:
multi-volume works as books [@MR781536] and [@MR781537]. A couple of
citations with DOIs:
[@2004:ITE:1009386.1010128; @Kirschmer:2010:AEI:1958016.1958018]. Online
citations: [@TUGInstmem; @Thornburg01; @CTANacmart]. Artifacts: [@R] and
[@UMassCitations].

# Acknowledgments

Identification of funding sources and other support, and thanks to
individuals and groups that assisted in the research and the preparation
of the work should be included in an acknowledgment section, which is
placed just before the reference section in your document.

This section has a special environment:

      \begin{acks}
      ...
      \end{acks}

so that the information contained therein can be more easily collected
during the article metadata extraction phase, and to ensure consistency
in the spelling of the section heading.

Authors should not prepare this section as a numbered or unnumbered
`\section`; please use the "`acks`" environment.

# Appendices

If your work needs an appendix, add it before the "`\end{document}`"
command at the conclusion of your source document.

Start the appendix with the "`appendix`" command:

      \appendix

and note that in the appendix, sections are lettered, not numbered. This
document has two appendices, demonstrating the section and subsection
identification method.

# SIGCHI Extended Abstracts

are not supported by this toolchain at the moment.


# References {.unnumbered}
<!-- add the following lines to correctly format the references section for ACM articles. -->
\footnotesize
\setlength{\parindent}{-0.2in}
\setlength{\leftskip}{0.2in}
\indent
<!-- pandoc appends bibliography here -->
