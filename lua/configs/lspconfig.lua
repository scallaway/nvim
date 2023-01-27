local utils = require("utils")

local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
    return
end

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
    return
end

local lsp_formatting = function(bufnr)
    vim.lsp.buf.format({
        filter = function(client)
            return client.name == "null-ls"
        end,
        bufnr = bufnr,
    })
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local on_attach = function(client, bufnr)
    -- commands
    utils.buf_command(bufnr, "LspHover", vim.lsp.buf.hover)
    utils.buf_command(bufnr, "LspDiagPrev", vim.diagnostic.goto_prev)
    utils.buf_command(bufnr, "LspDiagNext", vim.diagnostic.goto_next)
    utils.buf_command(bufnr, "LspDiagLine", vim.diagnostic.open_float)
    utils.buf_command(bufnr, "LspDiagQuickfix", vim.diagnostic.setqflist)
    utils.buf_command(bufnr, "LspSignatureHelp", vim.lsp.buf.signature_help)
    utils.buf_command(bufnr, "LspDef", vim.lsp.buf.definition)
    utils.buf_command(bufnr, "LspTypeDef", vim.lsp.buf.type_definition)
    utils.buf_command(bufnr, "LspRef", vim.lsp.buf.references)

    -- bindings
    utils.buf_map(bufnr, "n", "K", ":LspHover<CR>")
    utils.buf_map(bufnr, "n", "[a", ":LspDiagPrev<CR>")
    utils.buf_map(bufnr, "n", "]a", ":LspDiagNext<CR>")
    utils.buf_map(bufnr, "n", "<Leader>a", ":LspDiagLine<CR>")
    utils.buf_map(bufnr, "i", "<C-x><C-x>", "<cmd> LspSignatureHelp<CR>")

    utils.buf_map(bufnr, "n", "gr", ":LspRef<CR>")
    utils.buf_map(bufnr, "n", "gh", ":LspTypeDef<CR>")
    utils.buf_map(bufnr, "n", "gd", ":LspDef<CR>")
    utils.buf_map(bufnr, "n", "ga", ":LspAct<CR>")
    utils.buf_map(bufnr, "v", "ga", "<Esc><cmd> LspRangeAct<CR>")

    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
                lsp_formatting(bufnr)
            end,
        })
    end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

for _, server in ipairs({
    "null-ls",
    "pyright",
    "svelte",
    "tsserver",
    "rust",
    "docker",
    "clangd",
}) do
    require("configs.lsp." .. server).setup(on_attach, capabilities)
end
