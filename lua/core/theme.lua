-- Use true colors
vim.o.termguicolors = true

vim.api.nvim_command("colorscheme kanagawa")
require("kanagawa").setup({})
require("kanagawa").load("dragon")
