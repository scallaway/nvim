-- Use true colors
vim.o.termguicolors = true

require("catppuccin").setup({
  flavour = "mocha",
  transparent_background = true,
  styles = {
    functions = {
      "bold",
    },
    strings = {
      "italic",
    },
  },
})

vim.cmd.colorscheme("catppuccin")
