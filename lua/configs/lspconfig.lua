local utils = require("utils")

local mason_status_ok, mason = pcall(require, "mason")
if not mason_status_ok then
  return
end

mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_uninstalled = "✗",
      package_pending = "⟳",
    },
  },
})

local formatting_group = vim.api.nvim_create_augroup("LspFormatting", {})
local diagnostics_group = vim.api.nvim_create_augroup("LspDiagnostics", {})

local on_attach = function(client, bufnr)
  -- commands
  utils.buf_command(bufnr, "LspHover", vim.lsp.buf.hover)
  utils.buf_command(bufnr, "LspDiagPrev", vim.diagnostic.goto_prev)
  utils.buf_command(bufnr, "LspDiagNext", vim.diagnostic.goto_next)
  utils.buf_command(bufnr, "LspDiagLine", vim.diagnostic.open_float)
  utils.buf_command(bufnr, "LspDiagQuickfix", vim.diagnostic.setqflist)
  utils.buf_command(bufnr, "LspDef", vim.lsp.buf.definition)
  utils.buf_command(bufnr, "LspRef", vim.lsp.buf.references)

  -- bindings
  utils.buf_map(bufnr, "n", "K", ":LspHover<CR>")
  utils.buf_map(bufnr, "n", "[a", ":LspDiagPrev<CR>")
  utils.buf_map(bufnr, "n", "]a", ":LspDiagNext<CR>")
  utils.buf_map(bufnr, "n", "<Leader>a", ":LspDiagLine<CR>")

  utils.buf_map(bufnr, "n", "gr", ":LspRef<CR>")
  utils.buf_map(bufnr, "n", "gd", ":LspDef<CR>")
  utils.buf_map(bufnr, "n", "ga", ":LspAct<CR>")
  utils.buf_map(bufnr, "v", "ga", "<Esc><cmd> LspRangeAct<CR>")

  utils.buf_map(bufnr, "n", "gL", ":vsp<CR>:LspDef<CR>")

  -- Disable diagnostics in node_modules folder
  vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    pattern = { "**/node_modules/**", "node_modules", "/node_modules/*" },
    callback = function()
      vim.diagnostic.disable(0)
    end,
    group = diagnostics_group,
  })

  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = formatting_group, buffer = bufnr })
    -- vim.api.nvim_create_autocmd("BufWritePre", {
    --   group = formatting_group,
    --   buffer = bufnr,
    --   callback = function()
    --     lsp_formatting(bufnr)
    --   end,
    -- })
  end
end

vim.diagnostic.config({
  -- Don't show the signs in the gutter (to prevent code moving left and right)
  signs = false,

  -- Update the warnings in real time if possible
  update_in_insert = true,
})

for _, server in ipairs({
  -- "angular",
  "bash",
  "clangd",
  "docker",
  "efm",
  "eslint",
  "go",
  "intelephense",
  "pyright",
  "jedi",
  "lua",
  "rust",
  "typescript",
  "svelte",
  "vimls",
  "nil-ls",
  "csharp",
}) do
  require("configs.lsp." .. server).setup(on_attach)
end
