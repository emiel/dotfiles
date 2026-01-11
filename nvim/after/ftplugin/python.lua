vim.b.ale_fix_on_save = 1
vim.b.ale_fixers = { "ruff", "ruff_format" }
vim.b.ale_linters = { "vim-lsp", "pylsp", "pyright", "ruff" }

-- Default to Black line-length
vim.opt_local.textwidth = 88

vim.opt_local.makeprg = "python3 %"

-- def PythonRunFile(): void
--     silent !clear
--     execute "! python3 " .. bufname("%")
-- enddef

-- nnoremap <buffer> <unique> <silent> <LocalLeader>p <ScriptCmd> PythonRunFile()<CR>
