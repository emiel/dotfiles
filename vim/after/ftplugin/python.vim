vim9script

b:ale_fixers = ['black', 'reorder-python-imports']
b:ale_linters = ['vim-lsp', 'flake8', 'pylsp', 'pyright', 'ruff']

# Disable fix on save for now (smart.pr)
b:fix_on_save = 0

# Smart.pr appears to default to flake8's default (79)
setlocal textwidth=79

def PythonRunFile(): void
    silent !clear
    execute "! python3 " .. bufname("%")
enddef

nnoremap <buffer> <unique> <silent> <LocalLeader>p <ScriptCmd> PythonRunFile()<CR>
