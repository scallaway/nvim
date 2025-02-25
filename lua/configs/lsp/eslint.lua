local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  return
end

local M = {}

M.setup = function(on_attach, capabilities)
  lspconfig.eslint.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      experimental = {
        useFlatConfig = false,
      },
    },
  })
end

return M
