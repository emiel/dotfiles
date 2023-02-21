vim9script

b:ale_fixers = ['black', 'reorder-python-imports']
b:ale_linters = ['flake8', 'pyright']

setlocal textwidth=120

def PythonRunFile(): void
    silent !clear
    execute "! python3 " .. bufname("%")
enddef

nnoremap <buffer> <unique> <silent> <LocalLeader>p <ScriptCmd> PythonRunFile()<CR>
