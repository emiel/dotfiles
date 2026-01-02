# Emiel's Vim Cheat Sheet

## Cursor Motions

`h` left
`j` down
`k` up
`l` right

`H` head of screen
`M` middle of screen
`L` last of screen

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

`f` to (inclusive)
`t` till (exclusive)
`F` to backwards
`T` till backwards
`;` repeat latest `f`, `t`, `F` or `T`.
`,` repeat latest `f`, `t`, `F` or `T` in opposite direction

`*` search forward using word under cursor
`#` search backward using word under cursor
`g*` search forward using word under cursor (no word boundary)
`g#` search backward using word under cursor (no word boundary)
`/` find forward
`?` find backward

`n` repeat search
`N` repeat search opposite direction

## Scrolling

`ctrl-f` full page forward (page down)
`ctrl-b` full page backward (page up)
`ctrl-d` half page forward
`ctrl-u` half page backward
`ctrl-e` scroll lines downward (extra lines)
`ctrl-y` scroll lines upward
`zz`

## Change

`c{motion}` delete to {motion} and start editing
`cc` or `S` delete lines and start editing
`C` delete till end of line and start editing

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
