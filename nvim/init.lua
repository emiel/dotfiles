--
-- Global options
--

vim.opt.autoindent = true
vim.opt.autoread = true
vim.opt.backspace = {"indent", "eol", "start"}
vim.opt.backup = true
vim.opt.backupdir = "~/.backup/nvim"
vim.opt.breakindent = true
vim.opt.clipboard:prepend({"unnamed", "unnamedplus"})
vim.opt.completeopt = {"menuone", "preview", "noinsert", "noselect"}
vim.opt.confirm = true
vim.opt.copyindent = true
vim.opt.cursorline = true
vim.opt.formatoptions:remove({"j"})
vim.opt.hidden = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.joinspaces = false
vim.opt.laststatus = 2
vim.opt.lazyredraw = true
vim.opt.list = true
vim.opt.listchars = { nbsp = "~", tab = ">·", trail = "·", }
vim.opt.modelines = 0
vim.opt.mouse = "a"
vim.opt.preserveindent = true
vim.opt.ruler = true
vim.opt.scrolloff = 3
vim.opt.shell = "zsh"
vim.opt.shortmess:append("C")
vim.opt.showbreak = "=↳ "
vim.opt.showcmd = true
vim.opt.showmatch = true
vim.opt.smartcase = true
vim.opt.smarttab = true
vim.opt.spelllang = "en_us"
vim.opt.statusline = "%<%f %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%) %P"
vim.opt.tags = "tags;~"
vim.opt.termguicolors = true
vim.opt.title = true
vim.opt.ttyfast = true
vim.opt.updatetime = 1000
vim.opt.visualbell = true
vim.opt.wildignore:append({"*.o", "*.pyc"})
vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full"

--
-- Mappings
--

vim.g.mapleader = ","
vim.g.localmapleader = '\\'

local keymap = vim.api.nvim_set_keymap

local opts = {noremap = true}

-- Stop highlighting in addition to clearing and redrawing the screen.
keymap("n", "<c-l>", "<c-u>nohlsearch<cr><c-l>", opts)

--
-- Plugins
--

-- ALE
keymap("n", "<Leader>Ad", "<Plug>(ale_detail)", { unique = true })
keymap("n", "<Leader>Af", "<Plug>(ale_fix)", { unique = true })
keymap("n", "<c-j>", "<Plug>(ale_next_wrap)", { unique = true })
keymap("n", "<c-k>", "<Plug>(ale_previous_wrap)", { unique = true })

-- Dash
keymap("n", "<Leader>D", "<Plug>DashSearch", { unique = true, silent = true})

-- fzf.vim
keymap("n", "<Leader>g", ":FzfRg<space>", {noremap = true, unique = true})
keymap("n", "<Leader>b", ":FzfBuffers<CR>", {noremap = true, unique = true})
keymap("n", "<Leader>f", ":FzfFiles<CR>", {noremap = true, unique = true})
keymap("n", "<Leader>h", ":FzfHelpTags<CR>", {noremap = true, unique = true})
keymap("n", "<Leader>K", ":execute 'FzfRg' expand('<cword>')<CR><cr>", {noremap = true, unique = true, silent = true})

-- NERDTree
keymap("n", "<Leader>d", ":execute 'NERDTreeToggle' getcwd()<CR>", {noremap = true, unique = true, silent=true})
keymap("n", "<Leader>t", ":NERDTreeFind<CR>", {noremap = true, silent=true, unique=true})

-- vim-test
keymap("n", "<Leader>Tf", ":TestFile<CR>", { noremap = true, silent = true, unique=true})
keymap("n", "<Leader>Tn", ":TestNearest<CR>", { noremap = true, silent = true, unique=true})

--
-- Window options
--

-- vim.wo

--
-- Buffer options

-- vim.bo.expandtab = true
-- vim.bo.shiftwidth = 2
-- vim.bo.softtabstop = 2

-- vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"
--     vim.api.nvim_create_autocmd("LspAttach", {
--       callback = function(args)
--         vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = args.buf })
--       end,
--     })

vim.diagnostic.config({
  -- virtual_lines = true,
  virtual_text = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

--
-- Language Servers
--

vim.lsp.enable({
  "lua-ls",
  "ocaml-ls",
  "purescript-ls",
  "pyright-ls",
  "ruff-ls",
  "tailwindcss-ls",
  "terraform-ls",
  "terramate-ls",
  "typescript-ls",
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
  end,
})

require("plug")

-- Color schemes should be loaded after plug#end(). We prepend it with
-- 'silent!' to ignore errors when it's not yet installed.
vim.cmd("silent! colorscheme dayfox")
