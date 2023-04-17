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
vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<cr>")
vim.keymap.set("n", "<leader>o", "<cmd>NvimTreeFindFile<cr>")

-- TROUBLE --
vim.keymap.set("n", "<C-e>", "<cmd>TroubleToggle document_diagnostics<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<C-t>", "<cmd>TroubleToggle workspace_diagnostics<cr>", { silent = true, noremap = true })

-- SPECTRE
vim.keymap.set("n", "<LEADER>S", function()
    require("spectre").open()
end)
