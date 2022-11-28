local status_ok, mason = pcall(require, "mason")
if not status_ok then
    return
end

return mason.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_uninstalled = "✗",
            package_pending = "⟳",
        },
    },
})
