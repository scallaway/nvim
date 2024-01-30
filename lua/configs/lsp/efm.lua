local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  return
end

local M = {}

-- It's sad that we can't just store "formatters" and "linters" under variables
-- from require("efmls-configs.formatters.*") and
-- require("efmls-configs.linters.*")

local format_prettier_d = require("efmls-configs.formatters.prettier_d")
local lint_eslint_d = require("efmls-configs.linters.eslint_d")

local languages = {
  lua = {
    require("efmls-configs.linters.luacheck"),
  },

  python = {
    -- require("efmls-configs.formatters.black"),
    -- require("efmls-configs.formatters.isort"),
    require("efmls-configs.formatters.ruff"),
  },

  html = { format_prettier_d },

  javascript = {
    -- format_eslint_d,
    lint_eslint_d,
  },
  javascriptreact = {
    lint_eslint_d,
  },
  typescript = {
    lint_eslint_d,
  },
  typescriptreact = {
    lint_eslint_d,
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
