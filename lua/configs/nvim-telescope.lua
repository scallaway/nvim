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
    defaults = {
        prompt_prefix = " ",
        selection_caret = "❯ ",
        path_display = { "truncate" },
        selection_strategy = "reset",
        sorting_strategy = "descending",
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = {
                prompt_position = "bottom",
                preview_width = 0.55,
                results_width = 0.8,
            },
            vertical = {
                mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
        },
        file_ignore_patterns = {
            "%.min.*",
            "**/static/blog/*",
        },
    },
})

telescope.load_extension("fzf")
