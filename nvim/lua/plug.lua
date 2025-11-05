local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('junegunn/fzf')
Plug('junegunn/fzf.vim')
Plug('junegunn/seoul256.vim')
Plug('preservim/nerdtree')

vim.call('plug#end')
