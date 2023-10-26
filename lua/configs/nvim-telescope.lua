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
            theme = "ivy",
            previewer = false,
        },
        live_grep = {
            layout_config = {
                width = 0.75,
                height = 24,
                preview_width = 100,
            },
        },
    },
    defaults = {
        file_ignore_patterns = {
            "%.min.*",
            "**/static/*",
        },
    },
})
