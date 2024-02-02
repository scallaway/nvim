-- Use true colors
vim.o.termguicolors = true

vim.api.nvim_command("colorscheme kanagawa")
require("kanagawa").setup({
  colors = {
    theme = {
      all = {
        ui = {
          bg_gutter = "none",
        },
      },
    },
  },
})
require("kanagawa").load("dragon")
