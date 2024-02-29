-- Use true colors
vim.o.termguicolors = true

require("kanagawa").setup({
  functionStyle = {
    bold = true,
  },
  colors = {
    theme = {
      all = {
        ui = {
          bg_gutter = "none",
        },
      },
    },
  },
  background = {
    dark = "dragon",
  },
})
-- vim.api.nvim_command("colorscheme kanagawa")
vim.cmd("colorscheme kanagawa")
