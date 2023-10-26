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

    -- Utils
    "nvim-lua/plenary.nvim",

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
            require("configs.cmp")
        end,
    },
    "L3MON4D3/LuaSnip",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lua",

    -- Utils
    -- "nvim-lua/plenary.nvim",
    {
        "creativenull/efmls-configs-nvim",
        dependencies = { "neovim/nvim-lspconfig" },
    },
    "tpope/vim-surround",
    {
        "stevearc/oil.nvim",
        config = function()
            require("configs.oil")
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
        "numToStr/Comment.nvim",
        config = function()
            require("configs.comment")
        end,
    },

    -- Git
    "tpope/vim-fugitive",

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
}

local opts = {}

require("lazy").setup(plugins, opts)
