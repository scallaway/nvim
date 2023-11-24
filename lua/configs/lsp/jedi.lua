local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
    return
end

local M = {}

M.setup = function(on_attach, capabilities)
    lspconfig.jedi_language_server.setup({
        on_attach = function(client, bufnr)
            client.server_capabilities.hoverProvider = false
            on_attach(client, bufnr)
        end,
        capabilities = capabilities,
        init_options = {
            diagnostics = {
                enable = true,
            },
        },
    })
end

return M
