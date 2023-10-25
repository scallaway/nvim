local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    -- Some defaults
    "tpope/vim-sensible",

    -- Language Server installer
    "williamboman/mason.nvim",

    -- LSP
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("configs.lspconfig")
        end,
        opts = {
            format = { timeout_ms = 10000 },
        },
    },

    -- Autocompletion
    {
        "hrsh7th/nvim-cmp",
        config = function()
            require("configs/cmp")
        end,
    },
    "L3MON4D3/LuaSnip",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lua",
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("configs.copilot")
        end,
    },

    -- Utils
    "nvim-lua/plenary.nvim",
    {
        "creativenull/efmls-configs-nvim",
        dependencies = { "neovim/nvim-lspconfig" },
    },
    "tpope/vim-surround",
    {
        "stevearc/oil.nvim",
        config = function()
            require("configs/oil")
        end,
    },

    -- Customisation
    "rebelot/kanagawa.nvim",
    "kyazdani42/nvim-web-devicons",

    -- Code
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("configs.nvim-treesitter")
        end,
    },
    {
        "folke/todo-comments.nvim",
        config = function()
            require("configs.todo-comments")
        end,
    },
    {
        "christoomey/vim-sort-motion",
    },
    "jose-elias-alvarez/typescript.nvim",
    {
        "numToStr/Comment.nvim",
        config = function()
            require("configs.comment")
        end,
    },
    -- Fix commenting in TS contexts (with embedded languages)
    {
        "JoosepAlviste/nvim-ts-context-commentstring",
    },

    -- Git
    "tpope/vim-fugitive",

    -- Searching
    "nvim-telescope/telescope.nvim",
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
        config = function()
            require("configs.nvim-telescope")
        end,
    },
    {
        "nvim-pack/nvim-spectre",
        config = function()
            require("configs.nvim-spectre")
        end,
    },
    "duane9/nvim-rg",
}

local opts = {}

require("lazy").setup(plugins, opts)
