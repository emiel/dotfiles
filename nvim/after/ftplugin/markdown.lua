vim.b.ale_linters = { "marksman" }
vim.b.ale_fixers = { "prettier" }

--
-- I usually prefer hard line wrapping because it looks consistent everywhere,
-- however, most of of the people and apps I interact with use soft line
-- wrapping and thus I find myself joining lines before sharing. So, here we do
-- our best to get a soft line wrapping setup.
--

vim.opt_local.breakindent = true
vim.opt_local.breakindentopt = "list:-1"
vim.opt_local.formatlistpat = [[^\s*[-*+]\s\+\|^\s*\d\+[.\)]\s\+]]
vim.opt_local.linebreak = true
vim.opt_local.list = false
vim.opt_local.showbreak = "NONE"
vim.opt_local.spell = true
vim.opt_local.textwidth = 0
vim.opt_local.wrap = true
vim.opt_local.wrapmargin = 0

vim.keymap.set("n", "j", "gj", { buffer = true })
vim.keymap.set("n", "k", "gk", { buffer = true })
vim.keymap.set("n", "0", "g0", { buffer = true })
vim.keymap.set("n", "$", "g$", { buffer = true })
