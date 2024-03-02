local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  return
end

local M = {}

M.setup = function(on_attach, capabilities)
  lspconfig.nil_ls.setup({})
end

return M

