local status_ok, copilot = pcall(require, "copilot")
if not status_ok then
    return
end

copilot.setup({
    suggestion = {
        auto_trigger = true,
        keymap = {
            accept = "<A-l>",
        },
    },
    filetypes = {
        text = false,
    },
})
