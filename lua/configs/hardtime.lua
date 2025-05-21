local status_ok, hardtime = pcall(require, "hardtime")
if not status_ok then
  return
end

hardtime.setup({
  callback = function(text)
    vim.notify(text)
  end,
})
