local status_ok, conform = pcall(require, "conform")
if not status_ok then
  return
end

conform.setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "ruff_format" },
    rust = { "rustfmt" },
    svelte = {
      "prettierd",
      "eslint-lsp",
    },
    javascript = {
      "prettierd",
      "eslint-lsp",
    },
    typescript = {
      "prettierd",
      "eslint-lsp",
    },
    javascriptreact = {
      "prettierd",
      "eslint-lsp",
    },
    typescriptreact = {
      "prettierd",
      "eslint-lsp",
    },
    html = {
      "prettierd",
    },
    json = {
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
