local status_ok, conform = pcall(require, "conform")
if not status_ok then
  return
end

conform.setup({
  formatters_by_ft = {
    ["*"] = { "codespell" },
    ["_"] = { "trim_whitespace" },
    lua = { "stylua" },
    python = { "ruff_format" },
    rust = { "rustfmt" },
    svelte = {
      "prettierd",
      "eslint-lsp",
    },
    javascript = {
      "biome-organize-imports",
      "prettierd",
      "eslint-lsp",
    },
    typescript = {
      "biome-organize-imports",
      "prettierd",
      "eslint-lsp",
    },
    javascriptreact = {
      "biome-organize-imports",
      "prettierd",
      "eslint-lsp",
    },
    typescriptreact = {
      "biome-organize-imports",
      "prettierd",
      "eslint-lsp",
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
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})
