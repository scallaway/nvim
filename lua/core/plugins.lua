require("packer").startup(function()
    -- Plugin Loader
    use("wbthomason/packer.nvim")

    -- For performance
    use("lewis6991/impatient.nvim")

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
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-cmdline")
    use("hrsh7th/cmp-nvim-lua")
    use("saadparwaiz1/cmp_luasnip")
    use("onsails/lspkind.nvim")

    -- snippets
    use("L3MON4D3/LuaSnip")
    use("rafamadriz/friendly-snippets")

    -- Language Server installer
    use({
        "williamboman/mason.nvim",
        config = function()
            require("configs.mason")
        end,
    })
    use({
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("configs.mason-lspconfig")
        end,
    })

    -- Utils
    use("nvim-lua/plenary.nvim")
    use("jose-elias-alvarez/null-ls.nvim")
    use("tpope/vim-surround")
    use("jiangmiao/auto-pairs")

    -- Customisation
    use("navarasu/onedark.nvim")
    use({
        "nvim-lualine/lualine.nvim",
        config = function()
            require("configs.lualine")
        end,
    })
    use("arkav/lualine-lsp-progress")
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
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("configs.trouble")
        end,
    })
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
            require("configs.gitsigns")
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

    -- File tree
    use({
        "kyazdani42/nvim-tree.lua",
        config = function()
            require("configs.nvim-tree")
        end,
    })

    -- Code runing
    use({
        "michaelb/sniprun",
        run = "bash install.sh",
    })
end)
