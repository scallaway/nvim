local utils = require("utils")

local status_ok, typescript = pcall(require, "typescript")
if not status_ok then
    return
end

local M = {}

vim.keymap.set("n", "ge", ":TypescriptGoToSourceDefinition<CR>")

M.setup = function(on_attach, capabilities)
    typescript.setup({
        server = {
            on_attach = on_attach,
            capabilities = capabilities,
        },
    })
end

return M
