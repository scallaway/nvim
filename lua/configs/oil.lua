local status_ok, oil = pcall(require, "oil")
if not status_ok then
    return
end

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Keymaps
vim.keymap.set("n", "<LEADER>o", ":Oil<CR>")
vim.keymap.set("n", "<C-n>", ":Oil . <CR>")
vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })

oil.setup({
    view_options = {
        show_hidden = true,
    },
    use_default_keymaps = false,
    keymaps = {
        ["<CR>"] = "actions.select",
        ["<C-l>"] = "actions.refresh",
    },
    skip_confirm_for_simple_edits = true,
})
