" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
" Enable filetype detection
filetype on

" Enable filetype-specific indenting
filetype indent on

" Enable filetype-specific plugins
filetype plugin on

" Enable compiler support for ruby
compiler ruby

" Enable syntax highlighting
syntax on

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

""
"" Completion
""

" Show the command as we enter it
set showcmd

" Make file/command completion useful
set wildmenu
set wildmode=list:longest

""
"" Indenting
""

" Always set autoindenting on
set autoindent

" Smart indenting
set smartindent

" Copy indent
set copyindent

" Preserve indent
set preserveindent

""
"" Searching
""

" Do incremental searching; show the best match so far
set incsearch

" Highlight search terms
set hlsearch

" Ignore search term case
set ignorecase

" Override ignore case if keyword contains an upper case letter
set smartcase

""
"" Misc
""

" Briefly show matching brackets
set showmatch

" Show the current editing mode
set showmode

" Set the terminal title
set title

" Keep a longer history
set history=256

" Maintain more context around the cursor
set scrolloff=2

" Number of lines to check for set commands
set modelines=3

" Do not keep a backup file, use versions instead
set nobackup

" Show the cursor position all the time
set ruler

" String to show for wrapped lines
set showbreak=+++

" Language
lang C
set langmenu=none

" Show confirmation
set confirm

set shell=zsh

" Stop distracting your co-workers
set visualbell

" Stifle many interruptive prompts
set shortmess=atI

" Remember
set viminfo='20,<50,s10,h,%

" The current buffer can be put to the background without writing to
" disk; When a background buffer becomes current again, marks and
" undo-history are remembered.
set hidden

"set keywordprg=aspell
"set wrapmargin=2
"set nojoinspaces

""
"" Mapping
""

" Map leader to ,
" The leader character is your own personal modifier key, as g is Vim's
" modifier key (when compared to vi). The default leader is \, but this
" is not located standardly on all keyboards and requires a pinky
" stretch in any case.
let mapleader = ","

" Clear highlight search
nmap <silent> <leader>n :silent :nohlsearch<CR>

" Catch trailing whitespace
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>w :set nolist!<CR>

" NERD Tree
map <silent> <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>

" Fuzzy Finder!
map <silent> <leader>f :FufFile<CR>
map <silent> <leader>b :FufBuffer<CR>

" ctas
"let Tlist_Ctags_Cmd = "/usr/bin/ctags"
"nnoremap <silent> <F8> :Tlist<CR>

" Cut
"map <F5> O--8<--------------------------------------------------------------------<ESC>|
"map <F6> o-------------------------------------------------------------------->8--<ESC>|

" These are very similar keys. Typing 'a will jump to the line in the
" current file marked with ma. However, `a will jump to the line and
" column marked with ma.
"
" It is more useful in any case I can imagine, but it is located way
" off in the corner of the keyboard. The best way to handle this is
" just to swap them:
nnoremap ' `
nnoremap ` '

" Scroll the viewport faster
nnoremap <c-e> 4<c-e>
nnoremap <c-y> 4<c-y>
vnoremap <c-e> 4<c-e>
vnoremap <c-y> 4<c-y>

" Navigate splits
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Pasting
"set paste
"map <leader>P :set paste<CR>
"map <leader>p :set nopaste<CR>
"set pastetoggle=<leader>p

"nnoremap <C-Tab> :bnext<CR>
"nnoremap <S-C-Tab> :bprevious<CR>

"" This is an alternative that also works in block mode, but the deleted
"" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Who needs .gvimrc?
if has('gui_running')

  " Turn off toolbar and menu
  "set guioptions-=T
  "set guioptions-=m

  " Color scheme
  colorscheme ir_black

  set encoding=utf-8

  " Font
  if has("gui_macvim")
    set guifont=ProFont:h12
  elseif has("gui_gtk2")
    set guifont=ProFontWindows\ 10
  elseif has("x11")
    " Also for GTK 1
    " set guifont=*-lucidatypewriter-medium-r-normal-*-*-180-*-*-m-*-*
  elseif has("gui_win32")
    "set guifont=ProFontWindows:h12:cDEFAULT
  endif

else
  " Color scheme
  colorscheme metacosm
end

" Indent XML readably
function! DoPrettyXML()
  1,$!xmllint --format --recover -
endfunction
command! PrettyXML call DoPrettyXML()
