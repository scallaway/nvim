-- Rebind Ctrl+L to ESC
vim.keymap.set("i", "<C-l>", "<ESC>")
vim.keymap.set("v", "<C-l>", "<ESC>")

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
vim.api.nvim_create_user_command("Vsp", "vsp", {})
vim.api.nvim_create_user_command("Sp", "sp", {})
