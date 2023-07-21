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

-- netrw --
vim.keymap.set("n", "<LEADER>o", ":Vex %:h<CR>")

-- TROUBLE --
vim.keymap.set("n", "<C-e>", "<cmd>TroubleToggle document_diagnostics<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<C-t>", "<cmd>TroubleToggle workspace_diagnostics<cr>", { silent = true, noremap = true })

-- SPECTRE
vim.keymap.set("n", "<LEADER>S", function()
    require("spectre").open()
end)

-- TERMINAL
vim.keymap.set("t", "<C-l>", "<C-\\><C-n>")
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
