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
    -- keymaps = {
    --   normal = {
    --     plain_below = "g?p",
    --     plain_above = "g?P",
    --     variable_below = "g?v",
    --     variable_above = "g?V",
    --     -- variable_above_alwaysprompt = nil,
    --     -- variable_below_alwaysprompt = true,
    --     textobj_below = "g?o",
    --     textobj_above = "g?O",
    --     delete_debug_prints = "g?d",
    --     toggle_comment_debug_prints = "g?c",
    --   },
    --   visual = {
    --     variable_below = "g?v",
    --     variable_above = "g?V",
    --   },
    -- },
    commands = {
      toggle_comment_debug_prints = "ToggleCommentDebugPrints",
      delete_debug_prints = "DeleteDebugPrints",
    },
  },
  -- The 'keys' and 'cmds' sections of this configuration are only needed if
  -- you want to take advantage of `lazy.nvim` lazy-loading.
  -- keys = {
  --   { "g?p", mode = "n" },
  --   { "g?P", mode = "n" },
  --   { "g?v", mode = "n" },
  --   { "g?V", mode = "n" },
  --   { "g?o", mode = "n" },
  --   { "g?O", mode = "n" },
  --   { "g?v", mode = "x" },
  --   { "g?V", mode = "x" },
  -- },
  cmd = {
    "ToggleCommentDebugPrints",
    "DeleteDebugPrints",
  },
}
