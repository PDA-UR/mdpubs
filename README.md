# mdpubs
Pandoc-based toolchain and templates for writing scientific papers in [Markdown](https://daringfireball.net/projects/markdown/)
Currently with a heavy focus on ACM publications.

NOTICE: Due to an upgrade to Pandoc 2.19, there are some rendering problems. I'll try to fix them as soon as possible.


## What is this?

This is a small toolchain for generating typeset scientific papers in different styles from a single markdown source file.
It is comprised of:
- a sample Pandoc-flavored Markdown file which includes examples of the most important elements and a (rather large) metadata block
- a set of LaTeX templates which are filled with the contents of the markdown file (and its metadata) by [Pandoc](https://pandoc.org/).
- a set of [Makefiles](https://en.wikipedia.org/wiki/Makefile) that take care of generating the PDF files


## Why?

We are using this toolchain for [our group](https://hci.ur.de)'s publications since 2018.
It has a few advantages over Word and plain LaTeX:

- Markdown is much easier to write, read, and refactor than LaTeX (especially on non-US keyboard layouts)
- re-submitting a paper to a venue with different formatting guidelines just requires running the respective Makefile
- our approach allows for clear separation of content and formatting instructions
- debugging formatting issues is easier than in Word because you can always check the LaTeX code and search online for solutions
- the toolchain can be extended with additional filters, version control, automatic generation of figures from raw data, etc.
- Pandoc allows for converting Word files into Markdown (however, the generated Markdown text needs to be modified a little bit in order to be compiled using this toolchain)
- Markdown is inherently accessible and can still be read 100 years in the future.
- Pandoc allows for converting Markdown into a lot of different formats, such as MS Word .docx LibreOffice .odt, EPUB, or HTML. This makes it easy to e.g. generate a basic website for each publication or continue working on a paper using Word.


## Prerequisites

- a LaTeX distribution, such as [TeXlive](https://www.tug.org/texlive/)
- XeLaTeX (maybe others, too)
- [Pandoc](https://pandoc.org/) (currently, v2.19 is supported)
- a Linux/Unix system (probably) with support for Makefiles
- Python 3 (for some Pandoc filters)
- the [pandoc-crossref](https://github.com/lierdakil/pandoc-crossref/) filter (download the current release for you platform, extract the binary and, and put it into the `tools/` folder)
- [Inkscape](https://inkscape.org/) (if you want to include SVG illustrations)


## Usage

Run ``make -f sigconf.mk`` to compile *example.md* into *example.pdf* using the CHI Proceedings template (a TeX file *example.tex* also gets generated - it helps in troubleshooting and might need to be submitted as source file with your camera-ready version).

If you rename example.md (hint: you should), you will also need to adjust the "BASE=..." line in the Makefile(s).

As the manuscript/publication formats for ACM conferences are currently the only supported formats, you can rename `sigconf.mk` to `Makefile`.
Then, you can just run `make` without further parameters to build the document.

Check out the YAML block in `example.md`. It is used to set most metadata - including anonymization.

Run `make -f sigconf.mk clean` to remove all generated files.

Run `make -f sigconf.mk taps` to build a .zip archive that can be submitted to ACM's [TAPS](https://authors.acm.org/proceedings/production-information/taps-production-workflow). 
Be aware that TAPS uses its own toolchain to generate PDF and HTML output from the TeX file you provide. 
You will need to manually add required accessibility metadata to the TeX file. Check out the current requirements of ACM and/or your conference.


## Supported Styles

- **ACM SIGCONF Proceedings** (new acmart.cls format only)
- (feel free to submit pull requests for additional templates)

## Deprecated Styles:

The Makefiles for these styles are still in the repository. 
However, they might no longer work.

- **ACM SIGCHI Proceedings** (SIGCHI switched to the sigconf format)
- **ACM SIGCHI Extended Abstracts** (SIGCHI switched to the sigconf format)
- [Mensch und Computer](https://ctan.org/pkg/mucproc) (MuC switched to ACM sigconf format)


## Limitations

- the output is not guaranteed to look correct. It might not be accepted by Sheridan Printing (although at least [two](https://dl.acm.org/citation.cfm?id=3214323) [papers](https://dl.acm.org/citation.cfm?doid=3290605.3300650) in the ACM DL were generated using this toolchain).
- cruft and cargo cult in the templates (feel free to point out all instances)
- **all ACM templates (acmart.cls):** the ``\shortauthors`` field is not automatically filled with *"Mustermann et al."* because Pandoc does not allow for easily extracting only the first author. Workaround: a special ``shortauthors`` YAML field.
- **CHI Extended Abstracts template:** the margin/sidebar is not supported at the moment (and is such a special case that I won't add generic support for it). Footnotes are already placed into the margin by acmart.cls. Workaround: add raw TeX snippets to your markdown document.

## See also

- [Purush Swaminathan's acm-pandoc-paper](https://github.com/purukaushik/acm-pandoc-paper) (only seems to support the old version of the template but includes support for automatically building PDFs via Travis)
- [Daniel Garziotin: How to write an ACM-styled conference paper using Markdown/Pandoc](https://ineed.coffee/4008/how-to-write-an-acm-styled-conference-paper-using-markdownpandoc/)
- [Ulrik Lyngs: How to Write ACM Articles with R Markdown](https://ulyngs.github.io/blog/posts/2018-10-28-how-to-write-acm-articles-with-r-markdown/) ([Github Repository](https://github.com/ulyngs/chi-proc-rmd-template))

