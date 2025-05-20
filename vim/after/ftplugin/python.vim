vim9script

b:ale_fix_on_save = 1
b:ale_fixers = ['ruff', 'ruff_format']
b:ale_linters = ['vim-lsp', 'pylsp', 'pyright', 'ruff']

# Default to Black line-length
setlocal textwidth=88

def PythonRunFile(): void
    silent !clear
    execute "! python3 " .. bufname("%")
enddef

# nnoremap <buffer> <unique> <silent> <LocalLeader>p <ScriptCmd> PythonRunFile()<CR>
