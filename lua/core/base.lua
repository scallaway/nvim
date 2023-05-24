-- Use true colors
vim.opt.termguicolors = true

-- Set line numbers
vim.opt.number = true

-- Also display the relative numbers surrounding
vim.opt.relativenumber = true

-- Set a ruler at 80 chars
vim.opt.colorcolumn = "80"

-- Highlight the current line the cursor is on
vim.opt.cursorline = true

-- Enable mouse support
vim.opt.mouse = "a"

-- Copy the previous indentation on autoindenting
vim.opt.copyindent = true

-- Highlight the current search
vim.opt.hlsearch = true

-- Progressively highlight the current search
vim.opt.incsearch = true

-- Smart case-sensitive searching
vim.opt.smartcase = true

-- Case insensitive searching
vim.opt.ignorecase = true

-- Disable making a backup before overwriting a file
vim.opt.writebackup = false

-- Connection to the system clipboard
vim.opt.clipboard = "unnamedplus"

-- Options for insert mode completion
vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- Don't show the current mode in the command line
vim.opt.showmode = false

-- Reduce the updatetime of vim
vim.opt.updatetime = 100

-- Disable word wrapping
vim.opt.wrap = false

vim.g.mapleader = " "

vim.opt.guicursor = ""

vim.opt.splitright = true
vim.opt.splitbelow = true

-- Better experience with session plugin
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
