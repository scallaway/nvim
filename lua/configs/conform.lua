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
      "eslint",
      "prettierd",
      stop_after_first = true,
    },
    javascript = {
      "eslint",
      "prettierd",
      stop_after_first = true,
    },
    typescript = {
      "eslint",
      "prettierd",
      stop_after_first = true,
    },
    javascriptreact = {
      "eslint",
      "prettierd",
      stop_after_first = true,
    },
    typescriptreact = {
      "eslint",
      "prettierd",
      stop_after_first = true,
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
