require("packer").startup(function()
    -- Plugin Loader
    use("wbthomason/packer.nvim")

    -- Language Server installer
    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim")

    -- LSP
    use({
        "neovim/nvim-lspconfig",
        config = function()
            require("configs.lspconfig")
        end,
    })

    -- Autocompletion
    use({
        "hrsh7th/nvim-cmp",
        config = function()
            require("configs/cmp")
        end,
    })
    use("L3MON4D3/LuaSnip")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-cmdline")
    use("hrsh7th/cmp-nvim-lua")
    use({
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("configs.copilot")
        end,
    })

    -- snippets
    use("rafamadriz/friendly-snippets")

    -- Utils
    use("nvim-lua/plenary.nvim")
    use("jose-elias-alvarez/null-ls.nvim")
    use("tpope/vim-surround")
    use({
        "windwp/nvim-autopairs",
        config = function()
            require("configs/autopairs")
        end,
    })
    use("tpope/vim-vinegar")

    -- Sessions
    use("rmagatti/auto-session")

    -- Customisation
    use({ "scallaway/onedark.nvim", branch = "method-style" }) -- remove branch when on upstream
    use("kyazdani42/nvim-web-devicons")

    -- Code
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function()
            require("configs.nvim-treesitter")
        end,
    })
    use({
        "folke/todo-comments.nvim",
        config = function()
            require("configs.todo-comments")
        end,
    })
    use({
        "christoomey/vim-sort-motion",
    })
    use("jose-elias-alvarez/typescript.nvim")
    use({
        "numToStr/Comment.nvim",
        config = function()
            require("configs.comment")
        end,
    })
    -- Fix commenting in TS contexts (with embedded languages)
    use({
        "JoosepAlviste/nvim-ts-context-commentstring",
    })

    -- Git
    use("tpope/vim-fugitive")
    use({
        "lewis6991/gitsigns.nvim",
        config = function()
            require("configs.git-signs")
        end,
    })

    -- Searching
    use("nvim-telescope/telescope.nvim")
    use({
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
        config = function()
            require("configs.nvim-telescope")
        end,
    })
    use("tpope/vim-abolish")
    use({
        "nvim-pack/nvim-spectre",
        config = function()
            require("configs.nvim-spectre")
        end,
    })
    use("duane9/nvim-rg")
end)
