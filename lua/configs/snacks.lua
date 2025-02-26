local status_ok, snacks = pcall(require, "snacks")
if not status_ok then
  return
end

snacks.setup({
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
  animate = { enabled = false },
  bigfile = { enabled = true },
  dashboard = { enabled = false },
  explorer = { enabled = true },
  git = { enabled = false },
  indent = { enabled = false },
  input = { enabled = false },
  picker = { enabled = false },
  notifier = { enabled = true },
  quickfile = { enabled = false },
  scope = { enabled = false },
  scroll = { enabled = false },
  statuscolumn = { enabled = false },
  words = { enabled = true },
})
