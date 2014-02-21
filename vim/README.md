dotvim
======

Motion
------
    h left
    j down
    k up
    l right

    0 or ^ beginning of line
    $ end of line

    w beginning of word
    W beginning of WORD (whitespace)
    e end of word
    E end of WORD (whitespace)
    b back to beginning of word
    B back to beginning of WORD
    ge back to end of word
    gE back to end of WORD

    f to (inclusive)
    t till (exclusive)
    F to backwards
    T till backwards

    fFtT repeat with ';'

    ^f full page forward
    ^b full page backward
    ^d half page forward
    ^u half page backward

    H head of screen
    M middle of screen
    L last of screen

    gg goto line (default top)
    G  goto line (default bottom)

    * search forward using word under cursor
    # search backward using word under cursor
    g* search forward using word under cursor (no word boundary)
    g# search backward using word under cursor (no word boundar)
    / find forward
    ? find backward

    n repeat search
    N repeat search opposite direction

Change
------
    c{motion} : delete to {motion} and start editing
    cc or S : delete lines and start editing
    C : delete till end of line and start editing

git
---
git submodule foreach git pull origin master
