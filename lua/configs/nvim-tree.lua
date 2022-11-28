local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    return
end

return nvim_tree.setup({
    auto_reload_on_write = true,
    create_in_closed_folder = true,
    disable_netrw = true,
    update_focused_file = {
        enable = false,
    },
})
