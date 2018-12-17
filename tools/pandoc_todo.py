#! /usr/bin/env python

"""
Pandoc filter to change "{to do!}" to "\todo{to do!}"
https://mirror.hmc.edu/ctan/macros/latex/contrib/todonotes/todonotes.pdf
"""

__author__ = "Raphael Wimmer"

from pandocfilters import toJSONFilter, RawInline, Str

stringbuffer = ""
in_todo = False

def todo(key, value, fmt, meta):
    global stringbuffer, in_todo
    # order is important here!
    if key == 'Str' and "}" in value:
        in_todo = False
        stringbuffer += value
        idx_end = stringbuffer.index("}")
        idx_start = stringbuffer.index("{")
        before = stringbuffer[:idx_start] if idx_start > 0 else None
        todo_str = stringbuffer[idx_start+1:idx_end]
        after = stringbuffer[idx_end+1] if idx_end < len(stringbuffer) - 1 else None
        # todo_str = "\\todo[inline]{%s}{}" % (stringbuffer.strip("{}"))
        todo_str = "\\fxnote{%s}" % (todo_str)
        stringbuffer = ""
        blocks = []
        if before:
            blocks.append(Str(before))
        blocks.append(RawInline('latex', todo_str))
        if after:
            blocks.append(Str(after))
        return blocks
    if key == 'Str' and value.startswith("{"):
        in_todo = True
        stringbuffer += value
        return []  # remove it
    if key == 'Str' and in_todo:
        stringbuffer += value
        return []  # remove it
    if key == 'Space' and in_todo:
        stringbuffer += " "
        return []  # remove it


if __name__ == "__main__":
    toJSONFilter(todo)
