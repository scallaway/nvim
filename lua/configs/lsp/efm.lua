local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
    return
end

local M = {}

-- It's sad that we can't just store "formatters" and "linters" under variables
-- from require("efmls-configs.formatters.*") and
-- require("efmls-configs.linters.*")

local format_eslint_d = require("efmls-configs.formatters.eslint_d")
local lint_eslint_d = require("efmls-configs.linters.eslint_d")

local languages = {
    lua = {
        require("efmls-configs.formatters.stylua"),
        require("efmls-configs.linters.luacheck"),
    },

    python = {
        require("efmls-configs.linters.flake8"),
        require("efmls-configs.formatters.black"),
        require("efmls-configs.formatters.isort"),
        -- require("efmls-configs.formatters.ruff"),
    },

    html = { format_eslint_d },

    javascript = {
        format_eslint_d,
        lint_eslint_d,
    },
    javascriptreact = {
        format_eslint_d,
        lint_eslint_d,
    },
    typescript = {
        format_eslint_d,
        lint_eslint_d,
    },
    typescriptreact = {
        format_eslint_d,
        lint_eslint_d,
    },

    rust = {
        require("efmls-configs.formatters.rustfmt"),
    },

    cpp = {
        require("efmls-configs.formatters.clang_format"),
    },

    json = {
        require("efmls-configs.formatters.jq"),
    },

    toml = {
        require("efmls-configs.formatters.taplo"),
    },

    protolint = { require("efmls-configs.formatters.protolint") },
}

M.setup = function(on_attach, capabilities)
    lspconfig.efm.setup({
        filetypes = vim.tbl_keys(languages),
        settings = {
            rootMarkers = { ".git/" },
            languages = languages,
        },
        init_options = {
            documentFormatting = true,
            documentRangeFormatting = true,
        },
        on_attach = on_attach,
        capabilities = capabilities,
    })
end

return M
