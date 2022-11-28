local utils = require("utils")
-- Rebind Ctrl+L to ESC
vim.keymap.set("i", "<C-l>", "<ESC>")

-- TELESCOPE --
vim.keymap.set("n", "<C-p>", function()
    -- Use Ctrl+P to search through file names
    require("telescope.builtin").find_files()
end)
vim.keymap.set("n", "<C-f>", function()
    -- Use Ctrl-F to ripgrep through files
    require("telescope.builtin").live_grep()
end)

-- NVIM-TREE --
vim.keymap.set("n", "<C-n>", function()
    -- Use Ctrl-N to toggle the tree
    require("nvim-tree").toggle()
end)
vim.keymap.set("n", "<leader>o", function()
    require("nvim-tree").find_file()
end)

-- TROUBLE --
vim.keymap.set("n", "<C-e>", "<cmd>TroubleToggle document_diagnostics<cr>", { silent = true, noremap = true })

-- SPECTRE
vim.keymap.set("n", "<LEADER>S", function()
    require("spectre").open()
end)
