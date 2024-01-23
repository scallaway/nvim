local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
    return
end

local utils = require("utils")

local M = {}

M.setup = function(on_attach, capabilities)
    local lsp_setup = {
        on_attach = function(client, bufnr)
            -- Disable completion in favour of Jedi
            client.server_capabilities.completionProvider = false
            on_attach(client, bufnr)
        end,
        capabilities = capabilities,
        root_dir = function(fname)
            return lspconfig.util.root_pattern(
                ".git",
                "setup.py",
                "setup.cfg",
                "pyproject.toml",
                "requirements.txt"
            )(fname) or lspconfig.util.path.dirname(fname)
        end,
    }

    lspconfig.pyright.setup(lsp_setup)
end

return M
