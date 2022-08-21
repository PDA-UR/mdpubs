#!/usr/bin/env python3

"""
Pandoc filter to change "{to do!}" to "\todo{to do!}"
https://mirror.hmc.edu/ctan/macros/latex/contrib/todonotes/todonotes.pdf
"""

__author__ = "Raphael Wimmer"
import sys
from pandocfilters import toJSONFilters, RawInline, Str, Div, RawBlock, stringify


'''
You need a lua filter to process the fenced div:

function Div(el)
  if el.classes[1] == "special" then
    -- insert element in front
    table.insert(
      el.content, 1,
      pandoc.RawBlock("latex", "\\begin{Special}"))
    -- insert element at the back
    table.insert(
      el.content,
      pandoc.RawBlock("latex", "\\end{Special}"))
  end
  return el
end
i

\begin{teaserfigure}
  \includegraphics[width=\textwidth]{sampleteaser}
  \caption{Seattle Mariners at Spring Training, 2010.}
  \Description{Enjoying the baseball game from the third-base
  seats. Ichiro Suzuki preparing to bat.}
  \label{fig:teaser}
\end{teaserfigure}


'''

'''
 [{'t': 'Image', 
   'c': [ ['fig:teaser',
         [], 
         [['width', '100%']]
         ],
         
         [{'t': 'Str', 'c': 'image'}],  txt
         ['img/sampleteaser.pdf', 'fig:'] (src,tit)
        ]}]

'''


def m(element):
    "'firstname': {'t': 'MetaInlines', 'c': [{'t': 'Str', 'c': 'Max'}]}"
    if type(element) == str:
        return {'t': 'MetaString', 'c': element}
    elif 'Para' in element[0]['t']:
        return {'t': 'MetaBlocks', 'c': element}
    else:
        return {'t': 'MetaInlines', 'c': element}


def get_from_list(l, name, default):
    for item in l:
        if len(item) == 2:
            if item[0] == name:
                return item[1]
    return default

"""
def concat(list_of_elements):
    out = []
    for e in list_of_elements:
        if e['t'] == 'Str':
            out.append(e['c'])
        elif e['t'] == 'Space':
            out.append(" ")
        elif e['t'] == 'SoftBreak':
            out.append("\n")
        else:
            out.append(" ")
    return "".join(out)
"""

def acm_figures(key, value, fmt, meta):
    if key != 'Image' or fmt != 'latex':  # don't modify element
        return None
    # else:
    # print(key, ": ", value, file=sys.stderr)
    # print(meta, file=sys.stderr)
    [[ident, classes, kvs], txt, [src, tit]] = value
    description = get_from_list(kvs, 'description', '')
    width_str = ""
    caption = txt
    if "teaser" in classes:
        meta['teaser-source'] = m(src)
        meta['teaser-label'] = m(ident)
        meta['teaser-caption'] = m(caption)
        meta['teaser-description'] = m(description)
        return [] # remove teaser element here, is only in template
    elif "wide" in classes:
        ftype = 'figure*'
        width_str = 'width=\\textwidth'
    else:
        ftype = 'figure'
    new = [
    RawInline('tex', "\\begin{%s}\n" % ftype),
    RawInline('tex', "\\includegraphics[%s]{%s}\n" % (width_str, src)),
    RawInline('tex', "\\caption{"),
    *caption,
    RawInline('tex', "}\n"),
    RawInline('tex', "\\Description{%s}\n" % description),
    RawInline('tex', "\\label{%s}\n" % ident),
    RawInline('tex', "\\end{%s}\n" % ftype)
    ]

    return new

def acm_abstract(key, value, fmt, meta):
    if key != 'Div' or fmt != 'latex':  # don't modify element
        return None
    # else:
    # print(key, ": ", value, file=sys.stderr)
    #print(meta, file=sys.stderr)
    [[ident, classes, kvs], content] = value 
    if "Abstract" in classes:
        meta['abstract'] = m(content)
        return [] # remove abstract element here, use only in template

if __name__ == "__main__":
    toJSONFilters([acm_abstract, acm_figures])
