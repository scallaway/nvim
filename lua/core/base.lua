-- Set a ruler at 80 chars
vim.opt.colorcolumn = "80"

-- Highlight the current line
-- vim.opt.cursorline = true

-- Enable mouse support
vim.opt.mouse = "a"

-- Copy the previous indentation on autoindenting
vim.opt.copyindent = true

-- Highlight the current search
vim.opt.hlsearch = true

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

-- Reduce the updatetime of vim
vim.opt.updatetime = 100

-- Disable word wrapping
vim.opt.wrap = false

vim.g.mapleader = " "

vim.opt.guicursor = ""

vim.opt.splitright = true
vim.opt.splitbelow = true

-- Better experience with session plugin
vim.o.sessionoptions =
  "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- Set the default width to be 2 spaces
vim.opt.shiftwidth = 2

-- Keep the sign column open at all times to prevent code shift with git signs
vim.opt.signcolumn = "yes"
