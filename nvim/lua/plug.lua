local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('EdenEast/nightfox.nvim')
Plug('junegunn/fzf')
Plug('junegunn/fzf.vim')
Plug('preservim/nerdtree')

vim.call('plug#end')
