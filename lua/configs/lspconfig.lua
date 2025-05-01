local utils = require("utils")

local on_attach = function(_, bufnr)
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
end

local capabilities = require("blink.cmp").get_lsp_capabilities()

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
  -- "oxlint",
  "biome",
}) do
  require("configs.lsp." .. server).setup(on_attach, capabilities)
end
