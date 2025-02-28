local status_ok, trouble = pcall(require, "trouble")
if not status_ok then
  return
end

trouble.setup({
  mode = "document_diagnostics",
})

vim.keymap.set(
  "n",
  "<LEADER>tt",
  "<cmd>Trouble diagnostics toggle<CR>",
  { silent = true }
)

-- vim.keymap.set(
--   "n",
--   "<LEADER>tq",
--   "<cmd>Trouble quickfix toggle<CR>",
--   { silent = true }
-- )
vim.keymap.set(
  "n",
  "<LEADER>tb",
  "<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
  { silent = true }
)
