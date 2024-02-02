vim9script

b:ale_fix_on_save = 0
b:ale_fixers = ['ruff_format', 'isort']
b:ale_linters = ['vim-lsp', 'pylsp', 'pyright', 'ruff']

# Smart.pr appears to default to flake8's default (79)
setlocal textwidth=79

def PythonRunFile(): void
    silent !clear
    execute "! python3 " .. bufname("%")
enddef

nnoremap <buffer> <unique> <silent> <LocalLeader>p <ScriptCmd> PythonRunFile()<CR>
