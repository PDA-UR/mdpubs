---
# Note: not every field is used by every template. 
title:  'Demonstrating How Markdown May Be Used For Writing Papers'
shorttitle: 'Demonstrating How Markdown May Be Used ...'   # used for headers in order to avoid overlaps
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
anonymized: false
link-citations: false
links-as-notes: false
copyright: rightsretained  # rightsretained, acmlicensed, acmcopyright, usgov, usgovmixed, cagov, cagovmixed
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
abstract: |  # indent all lines in a block by two space characters
  For many papers, abstracts are important.
  For this one not. 
  This is just some filler text.
...


# Introduction
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

~~~~
start:
  wait some trime
loop:
  read data 
  if data good:
    print data
  else:
    complain
  goto loop
~~~~


Put two space characters at the end of a line to insert a manual line break.  
Teletype formatting example: ``pandoc --help`` is helpful.

Insert an empty line to start a new paragraph.


# References {.unnumbered}
<!-- add the following lines to correctly format the references section for ACM articles. -->
\footnotesize
\setlength{\parindent}{-0.2in}
\setlength{\leftskip}{0.2in}
\indent
<!-- pandoc appends bibliography here -->
