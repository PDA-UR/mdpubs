---
# This YAML block contains title, author affiliations, and further metadata
# It must be at the beginning of the document or in a separate file
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
anonymized: false    # replace author names with placeholder, hide Acknowledgments, set anonymous mode of template if available
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

> "ACM's consolidated article template, introduced in 2017, provides a
> consistent LaTeX style for use across ACM publications, and incorporates
> accessibility and metadata-extraction functionality necessary for future
> Digital Library endeavors. Numerous ACM and SIG-specific LaTeX templates
> have been examined, and their unique features incorporated into this
> single new template."

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


# Sectioning Commands

# Tables

The "`acmart`" document class includes the "`booktabs`" package ---
<https://ctan.org/pkg/booktabs> --- for preparing high-quality tables.

Unfortunately, Pandoc output `longtable` tables which cause some layout problems. 
One possible workaround might be to replace all instances of `longtable` with `supertabular` before compiling the TeX file.
Table captions are placed *above* the table.

Immediately following this sentence is the point at which
[@tbl:freq] is included in the input file; compare the placement of the table here with
the table in the printed output of this document.

<!--
::: {#tbl:freq}
   Non-English or Math    Frequency   Comments
  --------------------- ------------- -------------------
            Ø            1 in 1,000   For Swedish names
          $\pi$            1 in 5     Common in math
           \$              4 in 5     Used in business
       $\Psi^2_1$        1 in 40,000  Unexplained usage

  : Frequency of Special Characters
:::
-->

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

See the examples below ([@fig:placeholder1; @fig:placeholder2]) .

Your figures should contain a caption. 

Figure captions are placed *below* the figure.
![A placeholder image with a single-column width.](img/placeholder.pdf){description="Every image should have a description!" #fig:placeholder1}


![A placeholder image with a two-column width.](img/sampleteaser.pdf){description="Every image should have a description!" #fig:placeholder2 .wide}

Every figure should also have a figure description unless it is purely
decorative. These descriptions convey what's in the image to someone who
cannot see it. They are also used by search engine crawlers for indexing
images, and when images cannot be loaded.

A figure description must be unformatted plain text less than 2000
characters long (including spaces). 
See <https://www.acm.org/publications/taps/describing-figures/>.

# Citations and Bibliographies

*From the ACM template:*

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


# SIGCHI Extended Abstracts

are not supported by this toolchain at the moment.

::: Acknowledgments
All acknowledgments should be placed in this block so that they can be formatted correctly by the template.
The ACM template also hides the *Acknowledgments* section when `anonymous` mode is enabled.
:::


# References {.unnumbered}
<!-- add the following lines to correctly format the references section for ACM articles. -->
<!--
\footnotesize
\setlength{\parindent}{-0.2in}
\setlength{\leftskip}{0.2in}
\indent
-->
<!-- pandoc appends bibliography here -->
