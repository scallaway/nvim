vim.opt.textwidth = 79
vim.opt.shiftwidth = 2
vim.opt.number = false
vim.opt.relativenumber = false

-- Disable CMP in this file
local cmp = require("cmp")
cmp.setup.buffer({
    sources = { ... },
})
