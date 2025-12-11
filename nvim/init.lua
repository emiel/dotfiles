--
-- Global options
--

vim.opt.autoindent = true
vim.opt.autoread = true
vim.opt.backspace = {"indent", "eol", "start"}
vim.opt.backup = true
vim.opt.backupdir = vim.fn.expand("~/.backup/nvim")
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

-- Stop highlighting search matches and clear/redraw screen.
vim.keymap.set("n", "<c-l>", ":nohlsearch<cr><c-l>")

-- ALE
vim.keymap.set("n", "<Leader>Ad", "<Plug>(ale_detail)", { unique = true })
vim.keymap.set("n", "<Leader>Af", "<Plug>(ale_fix)", { unique = true })
vim.keymap.set("n", "<c-j>", "<Plug>(ale_next_wrap)", { unique = true })
vim.keymap.set("n", "<c-k>", "<Plug>(ale_previous_wrap)", { unique = true })

-- Dash
vim.keymap.set("n", "<Leader>D", "<Plug>DashSearch", { unique = true, silent = true})

-- fzf.vim
vim.keymap.set("n", "<Leader>g", ":FzfRg<space>", {unique = true})
vim.keymap.set("n", "<Leader>b", ":FzfBuffers<CR>", {unique = true})
vim.keymap.set("n", "<Leader>f", ":FzfFiles<CR>", {unique = true})
vim.keymap.set("n", "<Leader>h", ":FzfHelpTags<CR>", {unique = true})
--NOTE: `K` conflicts with default LSP key binding
vim.keymap.set("n", "K", ":execute 'FzfRg' expand('<cword>')<CR>", {unique = true, silent = true})

-- NERDTree
vim.keymap.set("n", "<Leader>d", ":execute 'NERDTreeToggle' getcwd()<CR>", {unique = true, silent=true})
vim.keymap.set("n", "<Leader>t", ":NERDTreeFind<CR>", {silent=true, unique=true})

-- vim-test
vim.keymap.set("n", "<Leader>Tf", ":TestFile<CR>", {silent = true, unique=true})
vim.keymap.set("n", "<Leader>Tn", ":TestNearest<CR>", {silent = true, unique=true})

--
-- Automatic commands
--

local augroup_vimrc = vim.api.nvim_create_augroup('vimrc', { clear = true });

-- Jump to last position in file after opening. Nice!
vim.api.nvim_create_autocmd(
  { 'BufReadPost' },
  {
    pattern = '*',
    group = augroup_vimrc,
    command = vim.cmd([[
      if line("'\"") > 0 && line("'\"") <= line('$')
        exe "normal! g`\""
      endif
  ]])
  }
)

vim.diagnostic.config({
  -- virtual_lines = true,
  severity_sort = true,
})

--
-- Language Servers
--

-- nnoremap gd <Cmd>LspGotoDefinition<CR>
-- nnoremap gh <Cmd>LspHover<CR>
-- nnoremap gi <Cmd>LspGotoImpl<CR>
-- nnoremap gn <Cmd>LspRename<CR>
-- nnoremap gp <Cmd>LspPeekDefinition<CR>
-- nnoremap gr <Cmd>LspShowReferences<CR>
-- nnoremap gt <Cmd>LspGotoTypeDef<CR>

vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gh", vim.lsp.buf.hover)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
vim.keymap.set("n", "gn", vim.lsp.buf.rename)
vim.keymap.set("n", "gr", vim.lsp.buf.references)
vim.keymap.set("n", "gt", vim.lsp.buf.type_definition)


vim.lsp.config('lua-ls', {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
})

vim.lsp.config("ocaml-ls", {
  cmd = { 'ocamllsp', '--stdio' },
  filetypes = { 'ocaml' },
  root_markers = { 'dune-project' },
})

vim.lsp.config("purescript-ls", {
  cmd = { 'purescript-language-server', '--stdio' },
  filetypes = { 'purescript' },
})

vim.lsp.config("pyright-ls", {
  cmd = { 'pyright-langserver', '--stdio' },
  filetypes = { 'python' },
  root_markers = {
    '.git',
    'pyproject.toml',
    'pyrightconfig.json',
  },
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = 'openFilesOnly',
      },
    },
  }
})

vim.lsp.config("ruff-ls", {
  cmd = { 'ruff', 'server' },
  filetypes = { 'python' },
  root_markers = { 'pyproject.toml' },
})

vim.lsp.config("tailwindcss-ls", {
  cmd = { 'tailwindcss-language-server', '--stdio' },
  filetypes = { 'typescript.tsx', 'typescriptreact' },
})

vim.lsp.config("terraform-ls", {
  cmd = { 'terraform-ls', 'serve' },
  filetypes = { 'terraform' },
})

vim.lsp.config("terramate-ls", {
  cmd = { 'terramate-ls', 'serve' },
  filetypes = { 'terramate' },
})

vim.lsp.config("typescript-ls", {
  cmd = { 'typescript-language-server', '--stdio' },
  filetypes = { 'typescript', 'typescript.tsx', 'typescriptreact' },
  root_markers = { 'tsconfig.json' },
})

vim.lsp.enable({
  -- "lua-ls",
  "ocaml-ls",
  "purescript-ls",
  "pyright-ls",
  -- "ruff-ls",
  "tailwindcss-ls",
  -- "terraform-ls",
  -- "terramate-ls",
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

--
-- Plugins
--

require("plug")

--
-- Color Scheme
--

-- Color schemes should be loaded after plug#end(). We prepend it with
-- 'silent!' to ignore errors when it's not yet installed.
vim.cmd("silent! colorscheme dayfox")

--
-- ALE
--

vim.g.ale_completion_enabled = 0
vim.g.ale_disable_lsp = 1
vim.g.ale_echo_msg_format = '[%linter%] %code: %%s'
vim.g.ale_fix_on_save = 1
vim.g.ale_lint_on_save = 0
vim.g.ale_sign_error = 'E>'
vim.g.ale_sign_info = 'I>'
vim.g.ale_sign_warning = 'W>'
vim.g.ale_virtualtext_cursor = 'current'

--
-- fzf.vim
--

vim.g.fzf_command_prefix = 'Fzf'

-- if executable('rg')
--   $FZF_DEFAULT_COMMAND = "rg --files --hidden --glob '!{node_modules,.git}'"
-- endif

-- def FzfRgSuper(query: string, fullscreen: bool)
--   const command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
--   const initial_command = printf(command_fmt, shellescape(query))
--   const reload_command = printf(command_fmt, '{q}')
--   const spec = {'options': ['--phony', '--query', query, '--bind', 'change:reload:' .. reload_command]}

--   fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), fullscreen)
-- enddef

-- command! -nargs=* -bang FzfRG call FzfRgSuper(<q-args>, <bang>0)

--
-- NERDTree
--

vim.g.NERDTreeHijackNetrw = 1
vim.g.NERDTreeIgnore = {'^__pycache__$'}
vim.g.NERDTreeWinSize = 41 -- NERDTree default is 31
