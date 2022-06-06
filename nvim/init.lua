--
-- Global options
--

vim.g.mapleader = ','

vim.o.autoindent = true
vim.o.autoread = true
-- vim.o.backspace = {'indent', 'eol', 'start'}
vim.o.breakindent = true
-- vim.o.clipboard = {'unnamed', 'unnamedplus'}
vim.o.clipboard = 'unnamedplus'
-- vim.o.completeopt = {'menuone', 'preview', 'noinsert', 'noselect'}
vim.o.confirm = true
vim.o.copyindent = true
vim.o.cursorline = true
vim.o.encoding = 'UTF-8'
-- vim.o.formatoptions+=j
vim.o.hidden = true
vim.o.history = 256
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.incsearch = true
vim.o.laststatus = 2
vim.o.lazyredraw = true
vim.o.list = true
-- vim.o.listchars= {'tab:>·', 'trail:·' , 'nbsp:~'}
vim.o.modelines = 0
vim.o.mouse = 'a'
vim.o.backup = false
vim.o.joinspaces = false
-- vim.o.path-=/usr/include
vim.o.preserveindent = true
vim.o.ruler = true
vim.o.scrolloff = 3
vim.o.shell = 'zsh'
vim.o.shortmess = 'atc'
vim.o.showbreak = '+++'
vim.o.showcmd = true
vim.o.showmatch = true
vim.o.smartcase = true
vim.o.smarttab = true
vim.o.spelllang = 'en_us'
vim.o.tags = 'tags;~'
vim.o.termguicolors = true
vim.o.title = true
vim.o.ttyfast = true
vim.o.updatetime = 1000
vim.o.visualbell = true
-- vim.o.wildcharm = '<C-Z>'
-- vim.o.wildignore+=*.o,*.pyc
vim.o.wildmenu = true
vim.o.wildmode = 'list:longest'

--
-- Mappings
--


local keymap = vim.api.nvim_set_keymap

local opts = {noremap = true}
keymap('n', '<c-l>', '<c-u>nohlsearch<cr><c-l>', opts)

-- fzf.vim
keymap('n', '<Leader>g', ':FzfRg<space>', {noremap = true, unique = true})
keymap('n', '<Leader>b', ':FzfBuffers<cr>', {noremap = true, unique = true})
keymap('n', '<Leader>f', ':FzfFiles<cr>', {noremap = true, unique = true})
keymap('n', '<Leader>h', ':FzfHelpTags<cr>', {noremap = true, unique = true})
keymap('n', 'h', ':call SearchCurrentWordWithFzf()<cr>', {noremap = true, silent=true, unique = true})

--keymap('n', '<Leader>d', ':execute NERDTreeToggle ' . getcwd()<cr>, {noremap = true, silent=true, unique=true})
keymap('n', '<Leader>t', ':execute NERDTreeFind<cr>', {noremap = true, silent=true, unique=true})

--
-- Window options
--

-- vim.wo

--
-- Buffer options

--vim.bo.expandtab = true
--vim.bo.shiftwidth = 2
--vim.bo.softtabstop = 2

-- Plugins

--require('packer').startup(function()
--	use 'foo/foo'
--end)

vim.lsp.start({
    name = 'pylsp',
    cmd = {'pylsp'},
    -- root_dir = vim.fs.dirname(
    --     vim.fs.find({'setup.py', 'pyproject.toml'}, { upward = true })[1]
    -- ),
})

vim.bo.omnifunc = 'v:lua.vim.lsp.omnifunc'
    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(args)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = args.buf })
      end,
    })
