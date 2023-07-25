local status_ok, copilot = pcall(require, "copilot")
if not status_ok then
    return
end

vim.keymap.set("i", "<C-K>", ":Copilot suggestion accept_line", { noremap = true })

copilot.setup({
    suggestion = {
        auto_trigger = true,
        keymap = {
            accept = "<C-k>",
        },
    },
    filetypes = {
        text = false,
    },
})
