--
-- Global options
--

vim.g.mapleader = ","

vim.opt.autoindent = true
vim.opt.autoread = true
-- vim.opt.backspace = {"indent", "eol", "start"}
vim.opt.breakindent = true
-- vim.opt.clipboard = {"unnamed", "unnamedplus"}
vim.opt.clipboard = "unnamedplus"
vim.opt.completeopt = {"menuone", "preview", "noinsert", "noselect"}
vim.opt.confirm = true
vim.opt.copyindent = true
vim.opt.cursorline = true
vim.opt.encoding = "UTF-8"
-- vim.opt.formatoptions+=j
vim.opt.hidden = true
vim.opt.history = 256
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.laststatus = 2
vim.opt.lazyredraw = true
vim.opt.list = true
-- vim.opt.listchars= {"tab:>·", "trail:·" , "nbsp:~"}
vim.opt.modelines = 0
vim.opt.mouse = "a"
vim.opt.backup = false
vim.opt.joinspaces = false
-- vim.opt.path-=/usr/include
vim.opt.preserveindent = true
vim.opt.ruler = true
vim.opt.scrolloff = 3
vim.opt.shell = "zsh"
vim.opt.shortmess = "atc"
vim.opt.showbreak = "+++"
vim.opt.showcmd = true
vim.opt.showmatch = true
vim.opt.smartcase = true
vim.opt.smarttab = true
vim.opt.spelllang = "en_us"
vim.opt.tags = "tags;~"
vim.opt.termguicolors = true
vim.opt.title = true
vim.opt.ttyfast = true
vim.opt.updatetime = 1000
vim.opt.visualbell = true
-- vim.opt.wildcharm = "<C-Z>"
-- vim.opt.wildignore+=*.o,*.pyc
vim.opt.wildmenu = true
vim.opt.wildmode = "list:longest"

--
-- Mappings
--

local keymap = vim.api.nvim_set_keymap

local opts = {noremap = true}
-- keymap("n", "<c-l>", "<c-u>nohlsearch<cr><c-l>", opts)

-- fzf.vim
-- keymap("n", "<Leader>g", ":FzfRg<space>", {noremap = true, unique = true})
-- keymap("n", "<Leader>b", ":FzfBuffers<cr>", {noremap = true, unique = true})
-- keymap("n", "<Leader>f", ":FzfFiles<cr>", {noremap = true, unique = true})
-- keymap("n", "<Leader>h", ":FzfHelpTags<cr>", {noremap = true, unique = true})
-- keymap("n", "h", ":call SearchCurrentWordWithFzf()<cr>", {noremap = true, silent=true, unique = true})

--keymap("n", "<Leader>d", ":execute NERDTreeToggle " . getcwd()<cr>, {noremap = true, silent=true, unique=true})
-- keymap("n", "<Leader>t", ":execute NERDTreeFind<cr>", {noremap = true, silent=true, unique=true})

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

vim.g.seoul256_background = 256

-- Color schemes should be loaded after plug#end(). We prepend it with
-- 'silent!' to ignore errors when it's not yet installed.
vim.cmd('silent! colorscheme seoul256-light')
