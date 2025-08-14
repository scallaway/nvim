local status_ok, conform = pcall(require, "conform")
if not status_ok then
  return
end

conform.setup({
  formatters_by_ft = {
    ["*"] = { "trim_whitespace" },
    lua = { "stylua" },
    rust = { "rustfmt" },
    svelte = {
      "eslint_d",
      "prettierd",
    },
    python = { "ruff_format" },
    javascript = {
      "biome",
    },
    typescript = {
      "biome",
    },
    javascriptreact = {
      "biome",
    },
    typescriptreact = {
      "biome",
    },
    html = {
      "prettierd",
    },
    json = {
      "prettierd",
    },
    jsonc = {
      "prettierd",
    },
  },
  notify_on_error = true,
  format_on_save = {
    -- I recommend these options. See :help conform.format for details.
    lsp_format = "fallback",
    timeout_ms = 2000,
  },
})
