local null_ls = require("null-ls")

local with_root_file = function(...)
    local files = { ... }
    return function(utils)
        return utils.root_has_file(files)
    end
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions
local completion = null_ls.builtins.completion

local sources = {
    -- Lua
    formatting.stylua,
    diagnostics.selene.with({
        condition = with_root_file("selene.toml"),
    }),

    -- TS/JS
    code_actions.eslint_d,
    diagnostics.eslint_d,
    formatting.eslint_d,
    formatting.prettierd.with({
        filetypes = {
            "css",
            "scss",
            "less",
            "html",
            "json",
            "yaml",
            "markdown",
            "graphql",
        },
    }),

    -- Python
    diagnostics.flake8.with({
        cwd = function(params)
            return vim.fn.fnamemodify(params.bufname, ":h")
        end,
        timeout = 10000,
    }),
    formatting.isort.with({
        cwd = function(params)
            return vim.fn.fnamemodify(params.bufname, ":h")
        end,
        timeout = 10000,
    }),
    formatting.black.with({
        cwd = function(params)
            return vim.fn.fnamemodify(params.bufname, ":h")
        end,
        timeout = 10000,
    }),

    -- Rust
    formatting.rustfmt,

    -- Git
    code_actions.gitsigns,

    -- C
    formatting.clang_format,
}

local M = {}

M.setup = function(on_attach, capabilities)
    null_ls.setup({
        sources = sources,
        on_attach = on_attach,
        capabilities = capabilities,
    })
end

return M
