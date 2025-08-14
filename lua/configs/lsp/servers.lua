local configs = {
  ["angularls"] = {},
  ["asm_lsp"] = {},
  ["bashls"] = {},
  ["biome"] = {},
  ["clangd"] = {},
  ["copilot"] = {},
  ["csharp_ls"] = {},
  ["dockerls"] = {},
  ["efm"] = {
    filetypes = { "lua", "python" },
    settings = {
      rootMarkers = { ".git/" },
      languages = {
        lua = {
          require("efmls-configs.linters.luacheck"),
        },

        python = {
          require("efmls-configs.linters.ruff"),
        },
      },
    },
  },
  -- ["eslint"] = {},
  ["gopls"] = {},
  ["intelephense"] = {},
  ["jedi_language_server"] = {},
  ["lua_ls"] = {
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
        telemetry = {
          enable = false,
        },
      },
    },
  },
  ["nix_ls"] = {},
  ["pyright"] = {},
  ["rust"] = {},
  ["svelte"] = {},
  ["ts_ls"] = {},
  ["vimls"] = {},
  ["zls"] = {},
}

return configs
