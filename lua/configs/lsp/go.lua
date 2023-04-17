local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
    return
end

local M = {}

M.setup = function(on_attach, capabilities)
    lspconfig.gopls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
    })
end

return M
