vim9script

var lspServers = [
  {
    name: 'haskell-ls',
    path: '/opt/homebrew/bin/haskell-language-server-wrapper',
    args: ['--lsp'],
    rootSearch: ['stack.yaml', 'cabal.project'],
    filetype: ['haskell'],
  },
  {
    name: 'ocaml-ls',
    path: expand('$HOME/.opam/default/bin/ocamllsp'),
    args: ['--stdio'],
    filetype: ['ocaml'],
  },
  {
    name: 'purescript-ls',
    path: '/opt/homebrew/bin/purescript-language-server',
    args: ['--stdio'],
    filetype: ['purescript'],
  },
  {
    name: 'ruff-ls',
    path: '/opt/homebrew/bin/ruff',
    args: ['server'],
    filetype: ['python'],
    rootSearch: ['pyproject.toml'],
  },
  {
    name: 'pyright-ls',
    path: '/opt/homebrew/bin/pyright-langserver',
    args: ['--stdio'],
    filetype: ['python'],
    rootSearch: ['pyrightconfig.json', 'pyproject.toml'],
    workspaceConfig: {
        python: {
            pythonPath: './.venv/bin/python'
        }
    },
  },
  {
    name: 'tailwindcss-ls',
    path: '/opt/homebrew/bin/tailwindcss-language-server',
    args: ['--stdio'],
    filetype: ['typescript.tsx', 'typescriptreact'],
  },
  {
    name: 'tofu-ls',
    path: '/opt/homebrew/bin/tofu-ls',
    args: ['serve'],
    filetype: ['terraform', 'tf'],
  },
  {
    name: 'toml-ls',
    path: '/opt/homebrew/bin/tombi',
    args: ['lsp'],
    filetype: ['toml'],
  },
  {
    name: 'typescript-ls',
    path: '/opt/homebrew/bin/typescript-language-server',
    args: ['--stdio'],
    filetype: ['javascript', 'typescript', 'typescript.tsx', 'typescriptreact'],
  },
]


autocmd User LspSetup call LspAddServer(lspServers)

var lspOptions = {
    aleSupport: true,
    # showDiagOnStatusLine: true,
}

autocmd User LspSetup call LspOptionsSet(lspOptions)

# autocmd User LspAttached 

nnoremap gd <Cmd>LspGotoDefinition<CR>
nnoremap gh <Cmd>LspHover<CR>
nnoremap gi <Cmd>LspGotoImpl<CR>
nnoremap gn <Cmd>LspRename<CR>
nnoremap gp <Cmd>LspPeekDefinition<CR>
nnoremap gr <Cmd>LspShowReferences<CR>
nnoremap gt <Cmd>LspGotoTypeDef<CR>
