# Emiel's Vim Cheat Sheet

## Cursor Motions

`h` left
`j` down
`k` up
`l` right

`H` to head of screen ("Home")
`M` to middle of screen ("Middle")
`L` to last of screen ("Last")

`0` to the first character of the line.
`^` to the first non-blank character of the line
`$` end of line

`w` beginning of word
`W` beginning of WORD (white space)
`e` end of word
`E` end of WORD (white space)
`b` back to beginning of word
`B` back to beginning of WORD
`ge` back to end of word
`gE` back to end of WORD

`f` to char (inclusive) "find char"
`F` to char backwards
`t` till char (exclusive)
`T` till char backwards
`;` repeat latest `f`, `t`, `F` or `T` motion
`,` repeat latest `f`, `t`, `F` or `T` motion in opposite direction

`*` search forward using word under cursor
`#` search backward using word under cursor
`g*` search forward using word under cursor (no word boundary)
`g#` search backward using word under cursor (no word boundary)
`/` find forward
`?` find backward

`n` repeat search
`N` repeat search opposite direction

## Scrolling

Scroll down
`ctrl-e` scroll lines downward "Extra lines"
`ctrl-d` scroll half page downward "Downwards"
`ctrl-f` scroll full page forward (page down) "Forwards"

Scroll up
`ctrl-y` scroll lines upward
`ctrl-u` scroll half page upwards "Upwards"
`ctrl-b` scroll full page backward (page up) "Backwards"

"Up/Down", "Forward/Backward"

Scroll relative to cursor
`zt`
`zz`
`zb`

## Change

`:h change.txt`

`c{motion}` delete to {motion} and start editing
`cc` or `S` delete lines and start editing
`C` delete till end of line and start editing
`<ctrl-a>` increment
`<ctrl-x>` decrement

Quit with `ZZ`, `ZQ`

visual select in bracket

`vib` - visual; inner () block
`viB` - visual; inner {} block
`vi<` - visual; inner <> block

`cib` - change; inner () block

visual select around bracket (including bracket)

`vab`
`vaB`
`cab`

keying `vi` or `va` again will expand the selection to outer brackets.

```
 ('foo', 'bar', ('foo', 'bar'))
 {'foo', 'bar'}
 <'foo', 'bar'>
```

start vim without loading config files

`vim -u NONE`

# Commands starting with `g`

`gg` goto line (default top)
`G` goto line (default bottom)
`gU<motion>`
`gu<motion>`
`gUU` capitalize line
`guu` lowercase line
`gj` visible line navigation
`gk` visible line navigation
`g~~` switch case line
`g~0` switch case till start of line
`g~$` switch case till end of line
`gJ` join lines
`gq<motion>`
`gqip` in paragraph
`gf` Open file under cursor; "go file"
`ga`, `g8` Check ASCII, utf8
`gn` search and replace (conflict with LSP)
`gv` reselect last visual
`g;` jump to previous changes
`g,`
`g&`
`g*` find matches that are not a whole word; compare with `\*`
`g#` compare with `#` (search backward)
`gI` insert mode at beginning of line
`gi` insert mode at last edit
`g??` ROT13 encode whole line
`gt` goto next tab

`\<`, `\>` word boundaries...

From `vim-script-libary`:

`gx` open in browser (URL)

## Windows

`ctrl+w s` split horizontal
`ctrl+w v` split vertical
`ctrl+w c` close window
`ctrl+w o` close all other windows
`ctrl+w r` rotate windows down/right
`ctrl+w R` rotate windows up/left
`ctrl+w w` switch window
`ctrl+w =` equalize window sizes

## Completion

Insert mode completion. <https://vimhelp.org/insert.txt.html#ins-completion>

Show current `omnifunc` value:

`set omnifunc?`

## Filter

`!`
`!!`

Example:
`:.!figlet` - replace current line with ascii art.

## Ranges

:h ranges

`%` - entire buffer
`.` - current line
`'<,'>` - visual selection

object/text select
`vip` - visual select inner paragraph
`viw` - visual select inner word

## Repeats

:help repeat.txt

Command mode

`:global` - lines that match
`:g`
`:vglobal` - lines that do NOT match
`:v`

`[range]g[global]/{pattern}/[cmd]`

examples:

`:g/foo/d` - delete lines matching 'foo'
`:g/^foo/m4` - move lines beginning with foo to line 4

commands:

see `:h ex-cmd-index`
see `:h {address}`

d - delete
m - move
p - print

examples:

visual select numbers -> `g ctrl-a` -> numbered list

Yank entire buffer:
From command mode...
`:%y` yank entire buffer (`%` is a range for the entire buffer)
Is there a way in normal mode: `ggyG`

# Filters

Format markdown tables:

```
:'<,'>!column -s"|" -o"|" -t
```

```
:%!pandoc -t commonmark_x
```

# Command Line Window

`:help cmdline.txt`

Edit and reuse command line history.

`q:` edit Ex command-line
`<ctrl-f>`
`q/` forward search command-line
`q?` backward search command-line
