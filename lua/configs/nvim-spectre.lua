local status_ok, nvim_spectre = pcall(require, "spectre")
if not status_ok then
    return
end

nvim_spectre.setup()
