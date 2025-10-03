local status_ok, conform = pcall(require, "conform")
if not status_ok then
  return
end

function verify_formatters()
  -- Check if biome config exists in current project
  local biome_config = vim.fs.find({ "biome.json", "biome.jsonc" }, {
    upward = true,
    path = vim.fn.expand("%:p:h"),
  })[1]

  if biome_config then
    return { "biome", "biome-organize-imports" }
  else
    return { "eslint_d" }
  end
end

conform.setup({
  formatters_by_ft = {
    ["*"] = { "trim_whitespace" },
    lua = { "stylua" },
    rust = { "rustfmt" },
    svelte = {
      "eslint",
      "prettierd",
    },
    python = { "ruff_format" },
    javascript = { "biome", "biome-organize-imports" },
    javascriptreact = { "biome", "biome-organize-imports" },
    typescript = { "biome", "biome-organize-imports" },
    typescriptreact = { "biome", "biome-organize-imports" },
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
    -- lsp_format = "fallback",
    lsp_format = "never",
    timeout_ms = 2000,
  },
})
