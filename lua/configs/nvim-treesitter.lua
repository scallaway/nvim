local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

treesitter.setup({
  ensure_installed = {
    "css",
    "gitcommit",
    "gitignore",
    "javascript",
    "python",
    "rust",
    "typescript",
    "org",
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
    config = {
      javascript = {
        __default = "// %s",
        jsx_element = "{/* %s */}",
        jsx_fragment = "{/* %s */}",
        jsx_attribute = "// %s",
        comment = "// %s",
      },
      typescript = {
        __default = "// %s",
        jsx_element = "{/* %s */}",
        jsx_fragment = "{/* %s */}",
        jsx_attribute = "// %s",
        comment = "// %s",
      },
    },
  },
  rainbow = {
    enable = true,
    disable = { "html" },
    extended_mode = false,
    max_file_lines = nil,
  },
  autopairs = { enable = true },
  autotag = { enable = true },
  incremental_selection = { enable = true },
  indent = { enable = true },
  textsubjects = {
    enable = true,
    prev_selection = ",", -- (Optional) keymap to select the previous selection
    keymaps = {
      ["."] = "textsubjects-smart",
      [";"] = "textsubjects-container-outer",
      ["i;"] = {
        "textsubjects-container-inner",
        desc = "Select inside containers (classes, functions, etc.)",
      },
    },
  },
  -- WIP
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["a="] = {
          query = "@assignment.outer",
          desc = "Select outer part of an assignment",
        },
        ["i="] = {
          query = "@assignment.inner",
          desc = "Select inner part of an assignment",
        },
        ["l="] = {
          query = "@assignment.lhs",
          desc = "Select left hand side of an assignment",
        },
        ["r="] = {
          query = "@assignment.rhs",
          desc = "Select right hand side of an assignment",
        },

        ["aa"] = {
          query = "@parameter.outer",
          desc = "Select outer part of a parameter/argument",
        },
        ["ia"] = {
          query = "@parameter.inner",
          desc = "Select inner part of a parameter/argument",
        },

        ["ai"] = {
          query = "@conditional.outer",
          desc = "Select outer part of a conditional",
        },
        ["ii"] = {
          query = "@conditional.inner",
          desc = "Select inner part of a conditional",
        },

        ["al"] = {
          query = "@loop.outer",
          desc = "Select outer part of a loop",
        },
        ["il"] = {
          query = "@loop.inner",
          desc = "Select inner part of a loop",
        },

        ["af"] = {
          query = "@call.outer",
          desc = "Select outer part of a function call",
        },
        ["if"] = {
          query = "@call.inner",
          desc = "Select inner part of a function call",
        },

        ["am"] = {
          query = "@function.outer",
          desc = "Select outer part of a method/function definition",
        },
        ["im"] = {
          query = "@function.inner",
          desc = "Select inner part of a method/function definition",
        },

        ["ac"] = {
          query = "@class.outer",
          desc = "Select outer part of a class",
        },
        ["ic"] = {
          query = "@class.inner",
          desc = "Select inner part of a class",
        },
      },
    },
  },
})
