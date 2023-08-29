-- Use true colors
vim.o.termguicolors = true

require("onedark").setup({
    style = "dark",
    code_style = {
        comments = "italic",
        keywords = "none",
        functions = "bold",
        strings = "none",
        variables = "none",
        constants = "bold",
    },
})

require("onedark").load()
