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

local lsp_status_ok, _ = pcall(require, "lspconfig")
if not lsp_status_ok then
  return
end

local cmp_status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_status_ok then
  return
end

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    filter = function(client)
      return client.name == "efm"
    end,
    bufnr = bufnr,
    timeout_ms = 10000,
  })
end

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
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = formatting_group,
      buffer = bufnr,
      callback = function()
        lsp_formatting(bufnr)
      end,
    })
  end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

vim.diagnostic.config({
  -- Don't show the signs in the gutter (to prevent code moving left and right)
  signs = false,

  -- Update the warnings in real time if possible
  update_in_insert = true,
})

for _, server in ipairs({
  "bash",
  "clangd",
  "docker",
  "efm",
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
  require("configs.lsp." .. server).setup(on_attach, capabilities)
end
