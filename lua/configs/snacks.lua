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
  explorer = { enabled = false },
  git = { enabled = false },
  indent = {
    enabled = false,
    only_scope = true, -- only show indent guides of the scope
    only_current = true, -- only show indent guides in the current window
    animate = {
      enabled = false,
    },
  },
  input = { enabled = false },
  picker = { enabled = false },
  notifier = { enabled = true },
  quickfile = { enabled = true },
  scope = { enabled = false },
  scroll = { enabled = false },
  words = { enabled = true },
  statuscolumn = {
    -- This doesn't seem to work properly
    enabled = false,
    -- {
    --   left = { "mark", "sign" }, -- priority of signs on the left (high to low)
    --   right = { "fold", "git" }, -- priority of signs on the right (high to low)
    --   folds = {
    --     open = false, -- show open fold icons
    --     git_hl = false, -- use Git Signs hl for fold icons
    --   },
    --   git = {
    --     -- patterns to match Git signs
    --     patterns = { "GitSign", "MiniDiffSign" },
    --   },
    --   refresh = 50, -- refresh at most every 50ms
    -- },
  },
  styles = {
    notification = {
      wo = { wrap = true }, -- Wrap notifications
    },
  },
})
