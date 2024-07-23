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
      "eslint",
    },
    javascript = {
      "prettierd",
      "eslint",
    },
    typescript = {
      "prettierd",
      "eslint",
    },
    javascriptreact = {
      "prettierd",
      "eslint",
    },
    typescriptreact = {
      "prettierd",
      "eslint",
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
