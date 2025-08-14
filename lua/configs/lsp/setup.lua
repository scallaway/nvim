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

vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gr", vim.lsp.buf.references)
vim.keymap.set("n", "<Leader>a", vim.diagnostic.open_float)

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then
      return
    end

    if client.name == "jedi_language_server" then
      client.server_capabilities.definitionProvider = false
      client.server_capabilities.hoverProvider = false
    end
  end,
})

for server, config in pairs(require("configs.lsp.servers")) do
  vim.lsp.config(server, config)
  vim.lsp.enable(server)
end
