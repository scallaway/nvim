local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  return
end

local M = {}

local languages = {
  lua = {
    require("efmls-configs.linters.luacheck"),
  },

  python = {
    require("efmls-configs.linters.flake8"),
  },
}

M.setup = function(on_attach, capabilities)
  lspconfig.efm.setup({
    filetypes = vim.tbl_keys(languages),
    settings = {
      rootMarkers = { ".git/" },
      languages = languages,
    },
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

return M
