vim.opt.textwidth = 79
vim.opt.shiftwidth = 2

vim.opt.spell = true
vim.opt.spelllang = "en_gb"

-- Disable CMP in this file
local cmp = require("cmp")
cmp.setup.buffer({
  sources = { ... },
})
