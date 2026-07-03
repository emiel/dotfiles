local vim = vim

vim.pack.add({
  "https://www.github.com/cespare/vim-toml",
  "https://www.github.com/chrisbra/matchit",
  "https://www.github.com/dense-analysis/ale",
  "https://www.github.com/dense-analysis/neural",
  "https://www.github.com/EdenEast/nightfox.nvim",
  "https://www.github.com/hashivim/vim-terraform",
  "https://www.github.com/isobit/vim-caddyfile",
  "https://www.github.com/junegunn/fzf",
  "https://www.github.com/junegunn/fzf.vim",
  "https://www.github.com/junegunn/goyo.vim",
  "https://www.github.com/kaarmu/typst.vim",
  "https://www.github.com/kepano/flexoki-neovim",
  "https://www.github.com/leafgarland/typescript-vim",
  "https://www.github.com/nemanjamalesija/ts-expand-hover.nvim",
  "https://www.github.com/NLKNguyen/papercolor-theme",
  "https://www.github.com/nvim-mini/mini.nvim",
  "https://www.github.com/pappasam/papercolor-theme-slim",
  "https://www.github.com/PhilT/vim-fsharp",
  "https://www.github.com/preservim/nerdtree",
  "https://www.github.com/purescript-contrib/purescript-vim",
  "https://www.github.com/rhysd/committia.vim",
  "https://www.github.com/rizzatti/dash.vim",
  "https://www.github.com/shinglyu/vim-codespell",
  "https://www.github.com/tpope/vim-commentary",
  "https://www.github.com/tpope/vim-fugitive",
  "https://www.github.com/tpope/vim-git",
  "https://www.github.com/tpope/vim-rhubarb",
  "https://www.github.com/tpope/vim-surround",
  "https://www.github.com/tpope/vim-vinegar",
})

-- nvim only
vim.pack.add({ "https://www.github.com/nvim-lua/plenary.nvim" })
vim.pack.add({
  {
    src = "https://www.github.com/olimorris/codecompanion.nvim",
    version = vim.version.range("^19.0.0"),
  },
})
