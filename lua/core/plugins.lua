if vim.g.vscode then
    return
end

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

local utils = require("utils")

local plugins = {
    -- Some defaults
    "tpope/vim-sensible",

    -- Utils
    "nvim-lua/plenary.nvim",

    -- Language Server installer
    {
        "williamboman/mason.nvim",
        config = function()
            require("configs.mason")
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
        },
        config = function()
            require("configs.mason-lspconfig")
        end,
    },

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
            require("configs.cmp")
        end,
    },
    "L3MON4D3/LuaSnip",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lua",
    {
        "onsails/lspkind.nvim",
        config = function()
            require("configs.lspkind")
        end,
    },

    -- Utils
    -- "nvim-lua/plenary.nvim",
    {
        "creativenull/efmls-configs-nvim",
        dependencies = { "neovim/nvim-lspconfig" },
    },
    {
        "kylechui/nvim-surround",
        event = "VeryLazy",
        config = function()
            require("configs.surround")
        end,
    },
    {
        "stevearc/oil.nvim",
        config = function()
            require("configs.oil")
        end,
    },

    -- Customisation
    "rebelot/kanagawa.nvim",
    {
        "nvim-tree/nvim-web-devicons",
        config = function()
            require("configs.web-devicons")
        end,
    },

    -- Code
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("configs.nvim-treesitter")
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
    },
    {
        "folke/todo-comments.nvim",
        config = function()
            require("configs.todo-comments")
        end,
    },
    {
        "numToStr/Comment.nvim",
        config = function()
            require("configs.comment")
        end,
    },

    -- Git
    {
        "tpope/vim-fugitive",
        config = function()
            require("configs.fugitive")
        end,
    },
    "airblade/vim-gitgutter",

    -- Searching
    {
        "nvim-telescope/telescope.nvim",
        config = function()
            require("configs.nvim-telescope")
        end,
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
        dependencies = {
            "nvim-telescope/telescope.nvim",
        },
    },
    "duane9/nvim-rg",

    -- Notes
    {
        "preservim/vim-markdown",
        config = function()
            require("configs.nvim-markdown")
        end,
    },
}

-- Add any work-related plugins that are required
if utils.work_config ~= nil  then
  table.insert(plugins, utils.work_config.plugins)
end

local opts = {}

require("lazy").setup(plugins, opts)
