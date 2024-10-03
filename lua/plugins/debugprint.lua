return {
  "andrewferrier/debugprint.nvim",
  dependencies = {
    "echasnovski/mini.nvim", -- Needed to enable :ToggleCommentDebugPrints for NeoVim <= 0.9
    "nvim-treesitter/nvim-treesitter", -- Needed to enable treesitter for NeoVim 0.8
  },
  -- Remove the following line to use development versions,
  -- not just the formal releases
  version = "*",
  opts = {
    -- The 'keys' and 'cmds' sections of this configuration are only needed if
    -- you want to take advantage of `lazy.nvim` lazy-loading.
    keymaps = {
      normal = {
        plain_below = "g?p",
        plain_above = "g?P",
        variable_below = "g/",
        variable_above = "g?V",
        variable_below_alwaysprompt = nil,
        variable_above_alwaysprompt = nil,
        textobj_below = "g?o",
        textobj_above = "g?O",
        toggle_comment_debug_prints = nil,
        delete_debug_prints = nil,
      },
      visual = {
        variable_below = "g?v",
        variable_above = "g?V",
      },
    },
    filetypes = {
      ["js"] = {
        left = 'console.info("',
        right = '")',
        mid_var = '", ',
        right_var = ")",
      },

      ["javascript"] = {
        left = 'console.info("',
        right = '")',
        mid_var = '", ',
        right_var = ")",
      },

      ["javascriptreact"] = {
        left = 'console.info("',
        right = '")',
        mid_var = '", ',
        right_var = ")",
      },

      ["typescript"] = {
        left = 'console.info("',
        right = '")',
        mid_var = '", ',
        right_var = ")",
      },

      ["typescriptreact"] = {
        left = 'console.info("',
        right = '")',
        mid_var = '", ',
        right_var = ")",
      },
    },
  },
}
