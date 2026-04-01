vim9script

# Why can't this be const?
var lspServers = [
  {
    name: 'harper-ls',
    path: exepath('harper-ls'),
    args: ['--stdio'],
    rootSearch: ['.harper-dictionary.txt', '.git'],
    filetype: [
        'asciidoc',
        'gitcommit',
        'markdown',
        'typst',
    ],
    workspaceConfig: {
      "harper-ls": {
        linters: {
          SpellCheck: false
        }
      }
    }
  },
  {
    name: 'haskell-ls',
    path: exepath('haskell-language-server-wrapper'),
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
    name: 'lua-ls',
    path: exepath('lua-language-server'),
    filetype: ['lua'],
    workspaceConfig: {
      Lua: {
        diagnostics: {
          globals: ['vim'],
        },
        hint: {
         enable: true,
        },
        runtime: {
          version: 'LuaJIT',
        },
      },
    }
  },
  {
    name: 'purescript-ls',
    path: exepath('purescript-language-server'),
    args: ['--stdio'],
    filetype: ['purescript'],
  },
  # Conflicts with pyright-ls (no LspHover...)
  # {
  #   name: 'ruff-ls',
  #   path: exepath('ruff'),
  #   args: ['server'],
  #   filetype: ['python'],
  #   rootSearch: ['pyproject.toml'],
  # },
  {
    name: 'pyright-ls',
    path: exepath('pyright-langserver'),
    args: ['--stdio'],
    filetype: ['python'],
    rootSearch: ['pyrightconfig.json', 'pyproject.toml'],
    workspaceConfig: {
        python: {
            pythonPath: './.venv/bin/python'
        }
    },
  },
  # {
  #   name: 'tailwindcss-ls',
  #   path: exepath('tailwindcss-language-server'),
  #   args: ['--stdio'],
  #   filetype: ['typescript.tsx', 'typescriptreact'],
  #   rootSearch: ['tailwind.config.ts', 'tailwind.config.js'],
  # },
  {
    name: 'tofu-ls',
    path: exepath('tofu-ls'),
    args: ['serve'],
    filetype: ['terraform', 'tf'],
  },
  {
    name: 'toml-ls',
    path: exepath('tombi'),
    args: ['lsp'],
    filetype: ['toml'],
  },
  {
    name: 'typescript-ls',
    path: exepath('typescript-language-server'),
    args: ['--stdio'],
    filetype: ['javascript', 'typescript', 'typescript.tsx', 'typescriptreact'],
  },
]


autocmd User LspSetup call LspAddServer(lspServers)

const lspOptions = {
  aleSupport: true,
}

autocmd User LspSetup call LspOptionsSet(lspOptions)


#
# Try to follow neovim defaults here.
# https://neovim.io/doc/user/lsp/#_defaults
#

# neovim global defaults
#
# gra: gr = "go reference", a = action
nnoremap gra <Cmd>LspCodeAction<CR>
# gri: gr = "go reference", i = implemetation
nnoremap gri <Cmd>LspGotoImpl<CR>
# gri: gr = "go reference", n = name
nnoremap grn <Cmd>LspRename<CR>
# gri: gr = "go reference", r = references
nnoremap grr <Cmd>LspShowReferences<CR>
# grt: gr = "go reference", t = type definition
nnoremap grt <Cmd>LspGotoTypeDef<CR>
# grx: gr = "go reference", x = ?
nnoremap grx <Cmd>LspCodeLens<CR>
# gO: g = "go", O = outline
nnoremap gO <Cmd>LspDocumentSymbol<CR>

# custom buffer keymaps
autocmd User LspAttached {
    # goto definition
    nnoremap <buffer> <silent> gd <Cmd>LspGotoDefinition<CR>
    # goto declaration
    nnoremap <buffer> <silent> gD <Cmd>LspGotoDeclaration<CR>
    # goto implemetation
    nnoremap <buffer> <silent> gi <Cmd>LspGotoImpl<CR>
    # goto type (definition)
    nnoremap <buffer> <silent> gt <Cmd>LspGotoTypeDef<CR>
    # goto references
    nnoremap <buffer> <silent> gr <Cmd>LspShowReferences<CR>
    # ??
    nnoremap <buffer> <silent> gh <Cmd>LspHover<CR>
    # organize imports
    nnoremap <buffer> <silent> loi <Cmd>LspOrganizeImports<CR>
    # peek definition
    nnoremap <buffer> <silent> lpd <Cmd>LspPeekDefinition<CR>
    # peek declaration
    nnoremap <buffer> <silent> lpD <Cmd>LspPeekDeclaration<CR>
    # peek implementation
    nnoremap <buffer> <silent> lpi <Cmd>LspPeekImpl<CR>
    # peek type (definition)
    nnoremap <buffer> <silent> lpt <Cmd>LspPeekTypeDef<CR>
}
