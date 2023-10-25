local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end

vim.keymap.set("n", "<C-p>", function()
    -- Use Ctrl+P to search through file names
    require("telescope.builtin").find_files()
end)
vim.keymap.set("n", "<C-f>", function()
    -- Use Ctrl-F to ripgrep through files
    require("telescope.builtin").live_grep()
end)

telescope.setup({
    pickers = {
        find_files = {
            previewer = false,
        },
    },
    defaults = {
        layout_config = {
            width = 0.50,
            height = 0.50,
            preview_cutoff = 120,
        },
        file_ignore_patterns = {
            "%.min.*",
            "**/static/*",
        },
    },
})
