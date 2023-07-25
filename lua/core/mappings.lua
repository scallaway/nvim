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
vim.keymap.set("n", "<C-n>", ":Ex<CR>")

-- SPECTRE
vim.keymap.set("n", "<LEADER>S", function()
    require("spectre").open()
end)

-- TERMINAL
vim.keymap.set("t", "<C-l>", "<C-\\><C-n>")
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- Human Error Correction (because typos are common at speed)
vim.api.nvim_create_user_command("W", "w", {})
vim.api.nvim_create_user_command("Q", "q", {})
vim.api.nvim_create_user_command("WQ", "wq", {})
vim.api.nvim_create_user_command("Wq", "wq", {})
vim.api.nvim_create_user_command("Wqa", "wqa", {})
vim.api.nvim_create_user_command("WQa", "wqa", {})
vim.api.nvim_create_user_command("Noh", "noh", {})
