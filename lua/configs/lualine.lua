local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

lualine.setup({
  options = {
    theme = "catppuccin",
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "searchcount", "diff", "diagnostics" },
    lualine_c = {
      {
        "filename",
        file_status = true, -- Displays file status (readonly status, modified status)
        newfile_status = true, -- Display new file status (new file means no write after created)
        path = 1,
      },
      -- "filename",
      -- Show LSP progress
      require("lsp-progress").progress,
    },
    lualine_x = { "filetype", "filesize" },
    lualine_y = {},
    lualine_z = { "location" },
  },
})

-- listen lsp-progress event and refresh lualine
vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
vim.api.nvim_create_autocmd("User", {
  group = "lualine_augroup",
  pattern = "LspProgressStatusUpdated",
  callback = require("lualine").refresh,
})
