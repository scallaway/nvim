local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
    return
end

local M = {}

M.setup = function(on_attach, capabilities)
    lspconfig.jedi_language_server.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        initializationOptions = {
            diagnostics = {
                enable = true,
                didOpen = true,
                didChange = true,
                didSave = true,
            },
            hover = {
                enable = true,
                disable = {},
            },
        },
    })
end

return M
