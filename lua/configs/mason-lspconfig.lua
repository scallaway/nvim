local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
  return
end

mason_lspconfig.setup({
  ensure_installed = {
    "lua_ls",
    "ts_ls",
    "pyright",
    "rust_analyzer",
    "biome",
    "eslint",
    "efm",
    -- "stylua",
  },
  automatic_installation = true,
})
