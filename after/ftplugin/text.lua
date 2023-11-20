vim.opt.textwidth = 79

-- Disable CMP in this file
local cmp = require("cmp")
cmp.setup.buffer({
    sources = { ... },
})
