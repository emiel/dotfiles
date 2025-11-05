vim9script

# --range <RANGE>  When specified, Ruff will try to only format the code in
#                  the given range.
#                  It might be necessary to extend the start backwards or
#                  the end forwards, to fully enclose a logical line.
#                  The `<RANGE>` uses the format
#                  `<start_line>:<start_column>-<end_line>:<end_column>`.
#
#          - The line and column numbers are 1 based.
#          - The column specifies the nth-unicode codepoint on that line.
#          - The end offset is exclusive.
#          - The column numbers are optional. You can write `--range=1-2` instead of `--range=1:1-2:1`.
#          - The end position is optional. You can write `--range=2` to format the entire document starting from the second line.
#          - The start position is optional. You can write `--range=-3` to format the first three lines of the document.
#
#          The option can only be used when formatting a single file. Range formatting of notebooks is unsupported.

def RunRuffFormatRange(start_line: number, end_line: number): void
    # XXX(emiel) add column support
    const range = $"{start_line}-{end_line}"
    echo range
    const cmd = $"ruff format --range {range}"

    # via stdin: cat foo.py | ruff format - --range 5-8
    # execute a:firstline . "," . a:lastline . "!" . cmd args
    echo cmd
enddef

# Define user command
#command -range RuffFormatRange RunRuffFormatRange(<line1>, <line2>)
# visual mode range
# command -range RuffFormatRange '<,'> call ...

# xnoremap <plug>(RuffFormatRangeSelection) :RuffFormatRange<cr>
# nnoremap <plug>(RuffFormatRangeCurrentLine) :RuffFormatRange<cr>

xnoremap <leader>R <esc>:'<,'> !ruff format -<cr>
