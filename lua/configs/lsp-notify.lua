local status_ok, lsp_notify = pcall(require, "nvim-lsp-notify")
if not status_ok then
  return
end

lsp_notify.setup({
  notify = require("notify"),
})
