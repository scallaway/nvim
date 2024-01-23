local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end

local conf = require("telescope.config").values

vim.keymap.set("n", "<C-p>", function()
    -- Use Ctrl+P to search through file names
    require("telescope.builtin").find_files()
end)
vim.keymap.set("n", "<C-f>", function()
    -- Use Ctrl-F to ripgrep through files
    require("telescope.builtin").live_grep()
end)
vim.keymap.set("n", "<C-b>", function()
    -- Use <Leader>fb to search through buffers
    require("telescope.builtin").buffers()
end)

telescope.setup({
    pickers = {
        find_files = {
            theme = "ivy",
            previewer = false,
            layout_config = {
                height = 10,
            },
        },
        buffers = {
            theme = "ivy",
            previewer = false,
            layout_config = {
                height = 10,
            },
        },
        live_grep = {
            layout_config = {
                width = 0.75,
                height = 0.8,
                preview_width = 80,
            },
            vimgrep_arguments = table.insert(
                conf.vimgrep_arguments,
                "--fixed-strings"
            ),
        },
    },
    defaults = {
        file_ignore_patterns = {
            "%.min.*",
            "**/static/*",
        },
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
        },
    },
})

require("telescope").load_extension("fzf")
