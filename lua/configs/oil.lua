local status_ok, oil = pcall(require, "oil")
if not status_ok then
    return
end

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

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
