local utils = require("utils")

local configs = {
  ["angularls"] = {},
  ["bashls"] = {},
  ["biome"] = {},
  ["clangd"] = {},
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
          require("efmls-configs.linters.flake8"),
        },
      },
    },
  },
  ["eslint"] = {
    settings = {
      experimental = {
        useFlatConfig = false,
      },
    },
  },
  ["gopls"] = {},
  ["intelephense"] = {},
  ["jedi_language_server"] = {
    init_options = {
      diagnostics = {
        enable = true,
      },
      hover = {
        enable = true,
      },
    },
  },
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
}

return configs
