--
-- Global options
--

vim.opt.autoindent = true
vim.opt.autoread = true
vim.opt.background = "light"
vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.backup = true
vim.opt.backupdir = vim.fn.expand("~/.backup/nvim")
vim.opt.breakindent = true
vim.opt.clipboard:prepend({ "unnamed", "unnamedplus" })
vim.opt.completeopt = { "menuone", "popup", "noinsert", "noselect" }
vim.opt.confirm = true
vim.opt.copyindent = true
vim.opt.cursorline = true
vim.opt.hidden = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.joinspaces = false
vim.opt.laststatus = 2
vim.opt.list = true
vim.opt.listchars = { nbsp = "~", tab = ">·", trail = "·" }
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
vim.opt.tags = "tags;~"
vim.opt.termguicolors = true
vim.opt.title = true
vim.opt.ttyfast = true
vim.opt.updatetime = 500 -- ms before CursorHold fires
vim.opt.visualbell = true
vim.opt.wildignore:append({ "*.o", "*.pyc" })
vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full"
vim.opt.winborder = "double"

--
-- Mappings
--

vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

-- Stop highlighting search matches and clear/redraw screen.
vim.keymap.set("n", "<c-l>", ":nohlsearch<cr><c-l>")

-- ALE
vim.keymap.set("n", "<Leader>Ad", "<Plug>(ale_detail)", { unique = true })
vim.keymap.set("n", "<Leader>Af", "<Plug>(ale_fix)", { unique = true })
vim.keymap.set("n", "<c-j>", "<Plug>(ale_next_wrap)", { unique = true })
vim.keymap.set("n", "<c-k>", "<Plug>(ale_previous_wrap)", { unique = true })

-- Dash
vim.keymap.set("n", "<Leader>D", "<Plug>DashSearch", { unique = true, silent = true })

-- fzf.vim
vim.keymap.set("n", "<Leader>g", ":FzfRg<space>", { unique = true })
vim.keymap.set("n", "<Leader>b", ":FzfBuffers<CR>", { unique = true })
vim.keymap.set("n", "<Leader>f", ":FzfFiles<CR>", { unique = true })
vim.keymap.set("n", "<Leader>h", ":FzfHelptags<CR>", { unique = true })
--NOTE: `K` conflicts with default LSP key binding
vim.keymap.set(
  "n",
  "K",
  ":execute 'FzfRg' expand('<cword>')<CR>",
  { unique = true, silent = true }
)

-- NERDTree
vim.keymap.set(
  "n",
  "<Leader>d",
  ":execute 'NERDTreeToggle' getcwd()<CR>",
  { unique = true, silent = true }
)
vim.keymap.set("n", "<Leader>t", ":NERDTreeFind<CR>", { silent = true, unique = true })

-- vim-test
vim.keymap.set("n", "<Leader>Tf", ":TestFile<CR>", { silent = true, unique = true })
vim.keymap.set("n", "<Leader>Tn", ":TestNearest<CR>", { silent = true, unique = true })

--
-- Automatic commands
--

-- Jump to last position in file after opening. Nice!
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
  group = vim.api.nvim_create_augroup("emiel.init", {}),
  callback = function(args)
    local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
    local lcount = vim.api.nvim_buf_line_count(args.buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

--
-- Language Servers
--

vim.api.nvim_create_autocmd({ "LspAttach" }, {
  group = vim.api.nvim_create_augroup("emiel.lsp", {}),
  callback = function(ev)
    local opts = { buffer = ev.buf }

    --
    -- Alread default on LspAttach in 0.11 - listed for reference, do NOT remap:
    --
    -- - "gra" (Normal and Visual mode) is mapped to |vim.lsp.buf.code_action()|
    -- - "gri" is mapped to |vim.lsp.buf.implementation()|
    -- - "grn" is mapped to |vim.lsp.buf.rename()|
    -- - "grr" is mapped to |vim.lsp.buf.references()|
    -- - "grt" is mapped to |vim.lsp.buf.type_definition()|
    -- - "grx" is mapped to |vim.lsp.codelens.run()|
    -- - "gO" is mapped to |vim.lsp.buf.document_symbol()|
    -- - CTRL-S (Insert mode) is mapped to |vim.lsp.buf.signature_help()|
    --
    -- Custom keymaps:
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    -- `K` is taken by FzfRg mapping, so hover lives on `gh`
    vim.keymap.set("n", "gh", vim.lsp.buf.hover, opts)

    -- Clear formatexpr so we can use 'gq' and not delegate to LSP.
    vim.bo[opts.buffer].formatexpr = ""
  end,
})

vim.lsp.config("elm-ls", {
  cmd = { "elm-language-server" },
  filetypes = { "elm" },
  root_markers = { "elm.json", ".git" },
})

vim.lsp.config("lua-ls", {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = { ".luarc.json", ".luarc.jsonc", ".git" },
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})

vim.lsp.config("ocaml-ls", {
  cmd = { "ocamllsp", "--stdio" },
  filetypes = { "ocaml" },
  root_markers = { "dune-project" },
})

vim.lsp.config("purescript-ls", {
  cmd = { "purescript-language-server", "--stdio" },
  filetypes = { "purescript" },
})

vim.lsp.config("pyright-ls", {
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },
  root_markers = {
    ".git",
    "pyproject.toml",
    "pyrightconfig.json",
  },
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "openFilesOnly",
      },
    },
  },
})

-- "ruff" is also run as part of ALE
-- vim.lsp.config("ruff-ls", {
--   cmd = { "ruff", "server" },
--   filetypes = { "python" },
--   root_markers = { "pyproject.toml" },
-- })

vim.lsp.config("tailwindcss-ls", {
  cmd = { "tailwindcss-language-server", "--stdio" },
  filetypes = { "typescriptreact" },
  root_markers = { "tailwind.config.ts", "tailwind.config.js" },
})

vim.lsp.config("terraform-ls", {
  cmd = { "terraform-ls", "serve" },
  filetypes = { "terraform" },
})

vim.lsp.config("terramate-ls", {
  cmd = { "terramate-ls", "serve" },
  filetypes = { "terramate" },
})

-- vim.lsp.config("typescript-ls", {
--   cmd = { "typescript-language-server", "--stdio" },
--   filetypes = { "typescript", "typescriptreact" },
--   root_markers = { "tsconfig.json" },
-- })

vim.lsp.config("vtsls", {
  cmd = { "vtsls", "--stdio" },
  filetypes = { "typescript", "typescriptreact" },
  root_markers = { "tsconfig.json" },
})

vim.lsp.enable({
  "elm-ls",
  "lua-ls",
  "ocaml-ls",
  "purescript-ls",
  "pyright-ls",
  -- "ruff-ls",
  "tailwindcss-ls",
  "terraform-ls",
  -- "terramate-ls",
  -- "typescript-ls",
  "vtsls",
})

--
-- Plugins
--

require("pack")

--
-- Color Scheme
--

-- vim.g.PaperColor_Theme_Options = {
--   theme = {
--     default = {
--       transparent_background = 1,
--     },
--   },
-- }

-- Ensure the background transparency is reapplied whenever the colorscheme changes.
-- vim.api.nvim_create_autocmd("ColorScheme", {
--   pattern = "*",
--   callback = function()
--     vim.cmd("highlight Normal guibg=NONE ctermbg=NONE")
--     vim.cmd("highlight NormalNC guibg=NONE ctermbg=NONE")
--   end,
-- })

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = { "PaperColorSlim", "PaperColorSlimLight" },
  callback = function()
    vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
  end,
})

-- Color schemes should be loaded after plug#end(). We prepend it with
-- 'silent!' to ignore errors when it's not yet installed.
-- vim.cmd("silent! colorscheme PaperColor")
-- vim.cmd("silent! colorscheme flexoki-light")
vim.cmd("silent! colorscheme PaperColorSlimLight")

-- Ensure cursor highlights predictibly
-- vim.opt.guicursor = "n-v-sm:block-Cursor,i-ci-c-ve:ver25-Cursor,r-cr-o:hor20-Cursor"

--
-- nvim diagnostics
--
vim.diagnostic.config({
  float = {
    source = true,
    border = "double",
    -- generic
    close_events = { "CursorMoved", "InsertEnter" },
  },
  update_in_insert = false, -- don't update diagnostics while typing
  severity_sort = true, -- sort diagnostics by severity
})

vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" })
  end,
})

--
-- ALE
--

vim.g.ale_completion_enabled = 0
vim.g.ale_disable_lsp = 1
vim.g.ale_echo_msg_format = "[%linter%] %code: %%s"
vim.g.ale_fix_on_save = 1
vim.g.ale_lint_on_save = 0
vim.g.ale_sign_error = "E>"
vim.g.ale_sign_info = "I>"
vim.g.ale_sign_warning = "W>"
vim.g.ale_virtualtext_cursor = "current"

vim.g.ale_use_neovim_diagnostics_api = 1
-- vim.g.ale_use_neovim_lsp_api = 0
--

--
-- fzf.vim
--

vim.g.fzf_command_prefix = "Fzf"

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
vim.g.NERDTreeIgnore = { "^__pycache__$" }
vim.g.NERDTreeWinSize = 41 -- NERDTree default is 31

--
-- Mini completion
--
require("mini.completion").setup()

--
-- Code Companion
--
require("codecompanion").setup({
  display = {
    chat = {
      window = {
        position = "right",
      },
    },
  },
  interactions = {
    chat = {
      adapter = "mistral",
    },
    inline = {
      adapter = "mistral",
    },
  },
  opts = {
    log_level = "ERROR",
  },
})

vim.keymap.set("n", "<Leader>C", ":CodeCompanionChat Toggle<CR>", { unique = true })

--
-- TS expand hover
--

require("ts_expand_hover").setup({
  keymaps = {
    hover = "gh", -- normal mode key to open hover float
    expand = "+", -- expand type one level (inside float)
    collapse = "-", -- collapse type one level (inside float)
    close = { "q", "<Esc>" }, -- close float and return to source
  },
  float = {
    border = "rounded", -- "rounded", "single", "double", "none"
    max_width = 80,
    max_height = 30,
  },
})
