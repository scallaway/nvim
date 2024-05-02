vim.opt.textwidth = 79
vim.opt.shiftwidth = 2

vim.opt.spell = true
vim.opt.spelllang = "en_gb"

vim.opt.number = false

-- Disable CMP in this file
local cmp = require("cmp")
cmp.setup.buffer({
  sources = { ... },
})
