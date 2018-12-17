%%
%% This is file `mucproc.cls', v. 1.25 2018/01/31, 
%% an adaptation of the original mucproc-Version 1.02 
%% by Marei Peischl (2017).
%%
%% The original source files were:
%%
%% mucproc.dtx  (with options: `class')
%% 
%% This is a generated file.
%% 
%% Copyright (C) 2017 by Marei Peischl <TeX@mareipeischl.de>
%% 
%% This file may be distributed and/or modified under the conditions of
%% the LaTeX Project Public License, either version 1.3 of this license
%% or (at your option) any later version.  The latest version of this
%% license is in:
%% 
%%    http://www.latex-project.org/lppl.txt
%% 
%% and version 1.3 or later is part of all distributions of LaTeX version
%% 2005/12/01 or later.
%% 
\def\mucprocVersion{1.25}

\NeedsTeXFormat{LaTeX2e}[2014/05/01]
\ProvidesClass{mucproc}
    [2018/01/16 v\mucprocVersion\ conference proceedings for the German MuC-conference]
\RequirePackage{expl3}
\ExplSyntaxOn
\bool_new:N \g_MUC@compatibility_mode
\@ifpackagelater{expl3}{2015/09/07}{
\bool_gset_false:N \g_MUC@compatibility_mode
}{
\msg_new:nnn {mucproc}{compatibility}{
    Your~ LaTeX-Distribution~ seems~ to~ be~ outdated.\\\\
    Enabling~ compatibility~ Mode.\\\\
    Some~ features~ won't~ be~ available.
    }
    \msg_warning:nn {mucproc}{compatibility}
\bool_gset_true:N \g_MUC@compatibility_mode
}

\RequirePackage{xparse}
\RequirePackage{scrbase}
\DefineFamily{MUC}
\DefineFamilyMember{MUC}
\bool_new:N \g_MUC@pdfa_bool
\FamilyBoolKey{MUC}{anonymous}{MUC@anonymous}
\FamilyBoolKey{MUC}{forcefinal}{MUC@final}
\FamilyBoolKey{MUC}{headline}{MUC@headline}
\FamilyBoolKey{MUC}{copyrightinfo}{MUC@copyrightinfo}
\FamilyBoolKey{MUC}{pagestyle}{MUC@pagestyle}
\MUC@headlinetrue
\MUC@copyrightinfofalse
\MUC@pagestyletrue

\FamilyProcessOptions{MUC}
\ifMUC@headline
\else
    \ifMUC@copyrightinfo
    \else
        \MUC@pagestylefalse
    \fi
\fi
\ifMUC@final
    \bool_if:NTF \g_MUC@compatibility_mode {
        \msg_new:nnn {mucproc} {compatibility-final-error} {
        forcefinal~ is~ not~ possible~ in~ compatibility~ mode.\\\\
        Update~ your~ TeX~ distribution~ and retry!}
        \msg_error:nn {mucproc} {compatibility-final-error}

    }{
    \sys_if_engine_luatex:F {
        \msg_new:nnn {mucproc} {luatex-required} {
        forcefinal~ requires~ LuaLaTeX~ for~ correct~ PDF/A~ output.\\\\
        Remove~ forcefinal~ option~ or~ change~ the~ compiler.
        }
        \msg_error:nn {mucproc} {luatex-required}
    }
    \clist_new:N \l_MUC@globalopts_clist

    \msg_new:nnn {mucproc} {force-final} {
        forcefinal~ option~ is~ enabled.\\\\
        Ignoring~ all~ global~ complementary~ options.}
    \msg_warning:nn {mucproc} {force-final}
    \msg_new:nnn {mucproc} {remove-draft}{
        forcefinal~ enabled:~ The~ global~ Option~ #1~ is~ ignored,~
        because~ it~ seems~ to~ activate draft~ mode!}

    \exp_args:Nx \clist_map_inline:nn {\@classoptionslist} {
     \tl_if_in:nnTF {#1} {draft}
            {\msg_warning:nnx {mucproc} {remove-draft} {#1}}
            {\clist_put_right:Nn  \l_MUC@globalopts_clist {#1}}
        \tl_if_in:nnTF {#1} {final}
            {\tl_if_in:nnTF {#1} {false}
                {\msg_warning:nnx {mucproc} {remove-draft} {#1}}
                {\clist_put_right:Nn  \l_MUC@globalopts_clist {#1}}
            }
            {\clist_put_right:Nn  \l_MUC@globalopts_clist {#1}}
    }

    \edef\@classoptionslist{\clist_use:Nn \l_MUC@globalopts_clist {,}}
    \bool_gset_true:N \g_MUC@pdfa_bool
    \MUC@anonymousfalse
    }
\fi

\newcommand*{\@fontsizefilebase}{mucfontsize}
\PassOptionsToClass{abstract=true,parskip=full,fontsize=10pt,
    twoside=semi}{scrartcl}
\LoadClass{scrartcl}
\setparsizes{0pt}{7pt plus 7 pt}{1em plus 1 fill}
\raggedbottom
\RequirePackage{graphicx}
\RequirePackage{babel}
\PassOptionsToPackage{babel}{csquotes}
\bbl@frenchspacing
\RequirePackage{csquotes}

\RequirePackage{geometry}% setup margins
\geometry{paper=a4paper,top=4.8cm, bottom=5.7cm,left=3.8cm,right=4cm,
    head=12.045pt,headsep=\dimexpr1cm-12.045pt\relax}

\PassOptionsToPackage{backend=biber}{biblatex}
\PassOptionsToPackage{citestyle=authoryear-comp}{biblatex}
\PassOptionsToPackage{bibstyle=apa}{biblatex}
\RequirePackage{biblatex}
\DeclareLanguageMapping{english}{english-apa}
\DeclareLanguageMapping{ngerman}{ngerman-apa}
\defcaptionname{ngerman,german}{\refname}{Literaturverzeichnis}

\renewcommand*{\nameyeardelim}{\addcomma\space}
\bool_new:N \g_MUC@fontspec_bool
\bool_if:NTF \g_MUC@compatibility_mode {
\expandafter\ifx\csname pdfmatch\endcsname\relax
    \else
      \PassOptionsToPackage{utf8}{inputenc}
      \RequirePackage{inputenc}
\fi
    \bool_gset_false:N \g_MUC@fontspec_bool
}{
\sys_if_engine_luatex:TF {
        \bool_gset_true:N \g_MUC@fontspec_bool
    }{
    \sys_if_engine_xetex:TF{
            \bool_gset_true:N \g_MUC@fontspec_bool
    }{
    \sys_if_engine_pdftex:T {
            \bool_gset_false:N \g_MUC@fontspec_bool
    \PassOptionsToPackage{utf8}{inputenc}
    \RequirePackage{inputenc}
        }
        }
    }
}
\cs_new:Nn \MUC@font_Fallback: {
\PassOptionsToPackage{T1}{fontenc}
\RequirePackage{fontenc}
    \IfFileExists{txfonts.sty}{\RequirePackage{txfonts}}{}
}

\if_bool:N \g_MUC@fontspec_bool
\RequirePackage{fontspec}
\fontspec_font_if_exist:nTF {Times~ New~ Roman}
    {\setmainfont{Times~ New~ Roman}}
{\MUC@font_Fallback:}
\else:
\MUC@font_Fallback:
\fi:

\if_bool:N \g_MUC@pdfa_bool
    \PassOptionsToPackage{a-1b}{pdfx}
    \RequirePackage{pdfx}
    \hypersetup{hidelinks}
    \iow_new:N \MUC@xmpdata_stream
    \iow_open:Nn \MUC@xmpdata_stream {\jobname.xmpdata}
    \tl_new:N \g_MUC@xmp_title
    \tl_new:N \g_MUC@xmp_author

    \newcommand*{\MUC@passTitleData}{
    \begingroup
    \def\newline{}
    \def\\{}
    \xdef\MUC@author{\@author}
    \xdef\MUC@title{\@title}
    \cs_set:Npn \and {\exp_not:n {\exp_not:N \sep}}
    \tl_gset:Nx \g_MUC@xmp_title {\@title}
    \tl_gset:Nx \g_MUC@xmp_author {\@author}
    \endgroup
    \iow_now:Nx \MUC@xmpdata_stream
     {
     \exp_not:N \Title{\tl_use:N \g_MUC@xmp_title}
     ^^J
     \exp_not:N \Author{\tl_use:N \g_MUC@xmp_author}
     ^^J
     \exp_not:N \Org{Mensch~ und~ Computer~ 2018}
     }
    }
\else:
    \msg_new:nnn {mucproc} {no-pdfa}{The~ mucproc~ class~ won't~ create~ PDF/A-mode.}
    \msg_info:nn {mucproc} {no-pdfa}
    \newcommand*{\MUC@passTitleData}{
        \begingroup
     \def\newline{}
     \def\\{}
     \xdef\MUC@author{\@author}
     \xdef\MUC@title{\@title}
        \endgroup
    }
\fi:
\clist_new:N \l_MUC@thanks_clist
\cs_set:Nn \MUC@thanks:nn {
    \clist_gput_right:Nn \l_MUC@thanks_clist
        {{#2\def\@thefnmark{#1}\@makefnmark}
    }}
\bool_if:NTF \g_MUC@compatibility_mode
{\NewDocumentCommand{\MUC@thanks}{om}{
    \footnotemark%
    \exp_args:Nx \MUC@thanks:nn {\thefootnote}{#2}
    }
}{
\NewDocumentCommand{\MUC@thanks}{om}{
    \footnotemark%
    \IfNoValueF{#1}{
        \prop_if_exist:NF \g_MUC@InstRef_prop {
            \prop_new:N \g_MUC@InstRef_prop}
        \prop_put:Nnx \g_MUC@InstRef_prop {#1} {\thefootnote}
        }
    \exp_args:Nx \MUC@thanks:nn {\thefootnote}{#2}
    }
}
\bool_if:NTF \g_MUC@compatibility_mode {
\msg_new:nnn {mucproc} {thanksref-unavailable} {
    Compatibilty~ mode~ enabled.\\\\
    The~ institution~ reference~ mechanism~ is~ not available.\\\\
    Update~ Your~ TeX~ distribution~ to~ be~ able~
        to~ use~ this~ feature.
    }
\msg_warning:nn {mucproc} {thanksref-unavailable}
    \newcommand\MUC@thanksref[1]{$\dagger$}
}{
\msg_new:nnn {mucproc} {thanks-label-missing} {
    No~ institute~ labeled~ '#1'.\\\\
    Add~ a~ label~ using~ the~ optional~ argument~
        of~ the~ \thanks~ command.
    }

\NewDocumentCommand\MUC@thanksref{m}{
    \prop_if_in:NnTF \g_MUC@InstRef_prop {#1} {
    \def\@thefnmark{\prop_item:Nn \g_MUC@InstRef_prop {#1}}%
    \@makefnmark
    }
    {\msg_error:nn {mucproc} {thanks-label-missing}}
}
}
\newcommand*\typeset@MUC@thanks {
    \clist_use:Nn \l_MUC@thanks_clist {\rule{0pt}{0pt}\\}}
    
\newcommand{\email}[1]{%
	\def\emails{
		\begin{flushleft}%
		\begin{small}\texttt{#1}\end{small}
		\end{flushleft}%
}
}

\renewcommand*{\maketitle}{
\begingroup
\DeclareExpandableDocumentCommand{\thanks}{om}{}
\def\thanksref##1{}
\def\and{\unskip,~\ignorespaces}
\MUC@passTitleData
\let\titlepage@restore\relax
\renewcommand*\thefootnote{\@arabic\c@footnote}
\let\thanks\MUC@thanks
\let\thanksref\MUC@thanksref
\global\@topnum=\z@
\setparsizes{\z@}{\z@}{\z@\@plus 1fil}\par@updaterelative
\null
\vskip 41pt
{\usekomafont{title}{\Huge \@title \par}}%
    {\ifx\@subtitle\@empty\else\vskip .5em\usekomafont{subtitle}%
    \Large\@subtitle\par\fi}%
    \vskip 7pt
{%
\usekomafont{author}{%
\lineskip .5em%
\@author
\par
}%
}%
\par
\vskip 8pt
\bool_if:NTF \g_MUC@compatibility_mode
    {\thispagestyle{empty}}
    {\thispagestyle{MUC@titlepagestyle}}
\typeset@MUC@thanks
\par
\vspace{8pt}
\emails
\vspace{12pt}
\endgroup
\setcounter{footnote}{0}%
\global\let\and\relax
\global\let\thanksref\relax
}

\ifMUC@anonymous
\providecaptionname{english}{\MUCanonymousauthor}{anonymous~ version}
\providecaptionname{german,ngerman}{\MUCanonymousauthor}{Anonymisierte~ Fassung}
    \def\@author{\MUCanonymousauthor}
    \def\author#1{\relax}
    \RequirePackage{comment}
    \excludecomment{authoraddendum}
\else
    \NewDocumentEnvironment{authoraddendum}{d<>om}{
        \par
        \IfNoValueTF{#2}{
        {\usekomafont{authoraddendum}#3}\par\medskip
        }{
        \begin{minipage}[t]{3cm}
        \vspace{0pt}
        \IfNoValueTF{#1}{
            \includegraphics[width=\linewidth]{#2}
        }{
            \includegraphics[#1]{#2}
        }
        \end{minipage}\hfill%
        \begin{minipage}[t]{\dimexpr\linewidth-4cm\relax}
        \vspace{0pt}
        {\usekomafont{authoraddendum}#3}\par\medskip%
        }
        \usekomafont{authoraddendumvita}\ignorespaces
        }{
        \IfNoValueF{#2}{\end{minipage}}
        \par
        \vspace{5pt}
        }
\fi

\reverse_if:N  \if_bool:N \g_MUC@compatibility_mode
\newcommand*{\MUC@sectionnumberbox}[1]{\makebox[28bp][l]{#1\autodot}}
\renewcommand*{\sectionformat}{
    \MUC@sectionnumberbox{\thesection}}
\renewcommand*{\subsectionformat}{
    \MUC@sectionnumberbox{\thesubsection}}
\renewcommand*{\subsubsectionformat}{
    \MUC@sectionnumberbox{\thesubsubsection}}
\RedeclareSectionCommand[afterskip=1.5ex plus .2ex,%
    beforeskip=-3.6ex plus -1ex minus -.2ex]{section}
\RedeclareSectionCommand[afterskip=.5ex plus .2ex,%
    beforeskip=-1ex plus -1ex minus -.2ex]{subsection}
\RedeclareSectionCommand[afterskip=.5ex plus .2ex,%
    beforeskip=-1ex plus -1ex minus -.2ex]{subsubsection}
\RedeclareSectionCommand[afterskip=1em,%
    beforeskip=1ex plus 1ex minus .2ex]{paragraph}
\RedeclareSectionCommand[afterskip=1em,%
    beforeskip=1ex plus 1ex minus .2ex]{subparagraph}
\fi:
\ExplSyntaxOff
\setkomafont{disposition}{}
\setkomafont{title}{}
\setkomafont{author}{\large}
\setkomafont{section}{\LARGE}
\setkomafont{subsection}{\Large}
\setkomafont{caption}{\footnotesize\itshape}
\setkomafont{captionlabel}{\usekomafont{caption}}
\newkomafont{abstractcontent}{\small}
\newkomafont{abstract}{\normalsize\bfseries}
\newkomafont{authoraddendum}{\small\bfseries}
\newkomafont{authoraddendumvita}{\small}
\renewenvironment{abstract}{%
    \setparsizes{0pt}{4pt}{0pt plus 1 fill}{%
    \usekomafont{abstract}%
    \abstractname}\par%
    \usekomafont{abstractcontent}}{}

\ifMUC@pagestyle
\PassOptionsToPackage{headsepline}{scrlayer-scrpage}
    \RequirePackage{scrlayer-scrpage}
    \ifMUC@copyrightinfo
        \newsavebox\MUC@copyrightbox
     \begin{lrbox}{\MUC@copyrightbox}
     \setlength{\fboxrule}{.7bp}%
     \setlength{\fboxsep}{6.5pt}%
     \fbox{\hspace*{.8pt}\parbox[t][\dimexpr2cm-2\fboxsep
            -2\fboxrule\relax][t]{%
                \dimexpr\textwidth-2\fboxsep-2\fboxrule%
                -1.6pt\relax}{%
     Platzhalter für DOI und ggf. Copyright Text.
        (Bitte nicht entfernen oder bearbeiten).\par
     \vspace{7pt}
     Name, Vorname (2018): Titel.%
     Tagungsband Mensch und Computer 2018.
        Gesellschaft für Informatik.%
     DOI: xxxxxx}%
     }
     \end{lrbox}
    \DeclareNewLayer[align=tl,area={\dimexpr 1in
         + \hoffset + \oddsidemargin\relax}{%
        \dimexpr\paperheight-3.9cm\relax}{\textwidth}{2cm},
        contents={\usebox\MUC@copyrightbox}]{copyright}
    \DeclareNewPageStyleByLayers{MUC@titlepagestyle}{copyright}
    \else
    \DeclareNewPageStyleAlias{MUC@titlepagestyle}{empty}
    \fi
    \clearpairofpagestyles
    \ifMUC@headline
        \lohead{}%\MUC@title}
        \rehead{}%\csname MUC@author\endcsname}
    \fi
    \setkomafont{pagehead}{\normalfont}
    \setkomafont{pagefoot}{}
\fi
\endinput
%%
%% End of file `mucproc.cls'.
