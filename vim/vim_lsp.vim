vim9script

#
# vim-lsp
#
g:lsp_hover_ui = 'float'

# Setting to 1 breaks "Auto-import" in pyright
g:lsp_use_native_client = 0

# Disable 'A> ' (actions) from showing up in the sign column
g:lsp_document_code_action_signs_enabled = 0

g:lsp_enable_lua = 1
g:lsp_log_file = '/tmp/vim-lsp.log'
g:lsp_log_verbose = 1

#
# Bug in pyright-langserver: You must set 'workspace_config' so a
# 'workspace/didChangeConfiguration' is sent! Not sure what the LSP protocol
# says about this.
#
if executable('pyright-langserver')
    def LspRegisterPyright()
        lsp#register_server({
            'name': 'pyright-langserver',
            'cmd': ['pyright-langserver', '--stdio'],
            'root_uri': (server_info) => lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'pyproject.toml')),
            'initialization_options': v:null,
            'allowlist': ['python'],
            'workspace_config': {},
            'config': {},
        })
    enddef

    autocmd User lsp_setup LspRegisterPyright()
endif

# if executable('ruff')
#     def LspRegisterRuff()
#         lsp#register_server({
#             'name': 'ruff',
#             'cmd': ['ruff', 'server'],
#             'root_uri': (server_info) => lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'pyproject.toml')),
#             'initialization_options': v:null,
#             'allowlist': ['python'],
#             'workspace_config': {},
#             'config': {},
#         })
#     enddef

#     autocmd User lsp_setup LspRegisterRuff()
# endif

if executable('purescript-language-server')
    def LspRegisterPureScript()
        lsp#register_server({
            'name': 'purescript-language-server',
            'cmd': ['purescript-language-server', '--stdio'],
            'allowlist': ['purescript'],
            'workspace_config': {
                'purescript.addNpmPath': v:true,
                'purescript.addSpagoSources': v:true,
                'purescript.buildCommand': 'spago build --purs-args --json-errors'
            }
        })
    enddef

    autocmd User lsp_setup LspRegisterPureScript()
endif

if executable('typescript-language-server')
    def LspRegisterTypeScript()
        lsp#register_server({
            'name': 'typescript-language-server',
            'cmd': ['typescript-language-server', '--stdio'],
            'root_uri': (server_info) => lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json')),
            'allowlist': ['typescript', 'typescript.tsx', 'typescriptreact'],
         })
    enddef

    autocmd User lsp_setup LspRegisterTypeScript()
endif

if executable('ocamllsp')
    def LspRegisterOcaml()
        lsp#register_server({
            'name': 'ocamllsp',
            'cmd': ['ocamllsp', '--stdio'],
            'root_uri': (server_info) => lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'dune-project')),
            'allowlist': ['ocaml'],
         })
    enddef

    autocmd User lsp_setup LspRegisterOcaml()
endif

if executable('terraform-ls')
    def LspRegisterTerraform()
        lsp#register_server({
            'name': 'terraform-ls',
            'cmd': ['terraform-ls', 'serve'],
            'allowlist': ['terraform'],
         })
    enddef

    autocmd User lsp_setup LspRegisterTerraform()
endif

if executable('terramate-ls')
    def LspRegisterTerramate()
        lsp#register_server({
            'name': 'terramate-ls',
            'cmd': ['terramate-ls', 'serve'],
            'allowlist': ['terramate'],
         })
    enddef

    autocmd User lsp_setup LspRegisterTerramate()
endif

if executable('tailwindcss-language-server')
    def LspRegisterTailwind()
        lsp#register_server({
            'name': 'tailwindcss-language-server',
            'cmd': ['tailwindcss-language-server', '--stdio'],
            'allowlist': ['typescript.tsx', 'typescriptreact'],
         })
    enddef

    autocmd User lsp_setup LspRegisterTailwind()
endif

def OnLspBufferEnabled()
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=number
    if exists('+tagfunc')
        setlocal tagfunc=lsp#tagfunc
    endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gh <plug>(lsp-hover)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gn <plug>(lsp-rename)
    nmap <buffer> gp <plug>(lsp-peek-definition)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gt <plug>(lsp-type-definition)
enddef

augroup lsp_install
    # Remove all lsp_install autocommands
    autocmd!

    # Invoke OnLspBufferEnabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled OnLspBufferEnabled()
augroup END

