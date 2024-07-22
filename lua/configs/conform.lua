local status_ok, conform = pcall(require, "conform")
if not status_ok then
  return
end

conform.setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "ruff" },
    rust = { "rustfmt" },
    svelte = {
      "prettierd",
      "eslint_d",
    },
    javascript = {
      "prettierd",
      "eslint_d",
    },
    typescript = {
      "prettierd",
      "eslint_d",
    },
    javascriptreact = {
      "prettierd",
      "eslint_d",
    },
    typescriptreact = {
      "prettierd",
      "eslint_d",
    },
    html = {
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
