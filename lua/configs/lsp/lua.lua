local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  return
end

local M = {}

M.setup = function(on_attach, capabilities)
  lspconfig.lua_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
        telemetry = {
          enable = false,
        },
      },
    },
  })
end

return M
