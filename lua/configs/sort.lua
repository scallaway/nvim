local status_ok, sort = pcall(require, "sort")
if not status_ok then
  return
end

vim.cmd([[
  nnoremap <silent> gs <Cmd>Sort<CR>
  vnoremap <silent> gs <Esc><Cmd>Sort<CR>
]])

sort.setup({})
