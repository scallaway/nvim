local status_ok, lsp_progress = pcall(require, "lsp-progress")
if not status_ok then
  return
end

lsp_progress.setup({})
