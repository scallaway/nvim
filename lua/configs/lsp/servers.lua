local configs = {
  ["angularls"] = {},
  ["asm_lsp"] = {},
  ["bashls"] = {},
  ["biome"] = {},
  ["ccls"] = {},
  ["clangd"] = {},
  ["copilot"] = {},
  ["csharp_ls"] = {},
  ["docker_compose_langauge_service"] = {},
  ["docker_language_server"] = {},
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
  ["mypy"] = {},
  ["nix_ls"] = {},
  ["pyright"] = {},
  ["rust"] = {},
  ["svelte"] = {},
  ["vimls"] = {},
  ["vtsls"] = {},
  ["zls"] = {},
}

return configs
