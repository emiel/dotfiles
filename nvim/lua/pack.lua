local vim = vim

vim.pack.add({
  "https://github.com/cespare/vim-toml",
  "https://github.com/chrisbra/matchit",
  "https://github.com/dense-analysis/ale",
  "https://github.com/dense-analysis/neural",
  "https://github.com/EdenEast/nightfox.nvim",
  "https://github.com/hashivim/vim-terraform",
  "https://github.com/isobit/vim-caddyfile",
  "https://github.com/junegunn/fzf",
  "https://github.com/junegunn/fzf.vim",
  "https://github.com/junegunn/goyo.vim",
  "https://github.com/kaarmu/typst.vim",
  "https://github.com/kepano/flexoki-neovim",
  "https://github.com/leafgarland/typescript-vim",
  "https://github.com/nemanjamalesija/ts-expand-hover.nvim",
  "https://github.com/NLKNguyen/papercolor-theme",
  "https://github.com/nvim-mini/mini.nvim",
  "https://github.com/pappasam/papercolor-theme-slim",
  "https://github.com/PhilT/vim-fsharp",
  "https://github.com/preservim/nerdtree",
  "https://github.com/purescript-contrib/purescript-vim",
  "https://github.com/rhysd/committia.vim",
  "https://github.com/rizzatti/dash.vim",
  "https://github.com/shinglyu/vim-codespell",
  "https://github.com/tpope/vim-commentary",
  "https://github.com/tpope/vim-fugitive",
  "https://github.com/MeanderingProgrammer/render-markdown.nvim",
  "https://github.com/tpope/vim-git",
  "https://github.com/tpope/vim-rhubarb",
  "https://github.com/tpope/vim-surround",
  "https://github.com/tpope/vim-vinegar",
})

-- nvim only
vim.pack.add({ "https://www.github.com/nvim-lua/plenary.nvim" })
vim.pack.add({
  {
    src = "https://www.github.com/olimorris/codecompanion.nvim",
    version = vim.version.range("^19.0.0"),
  },
})
