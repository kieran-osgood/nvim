return {
  {
    "shortcuts/no-neck-pain.nvim",
    version = "*",
    opts = {
      width = 120,

      mappings = {
        enabled = true,
      },
      buffers = {
        setNames = true,
      },
      --- @type table
      autocmds = {
        -- When `true`, enables the plugin when you start Neovim.
        -- If the main window is  a side tree (e.g. NvimTree) or a dashboard, the command is delayed until it finds a valid window.
        -- The command is cleaned once it has successfuly ran once.
        --- @type boolean
        enableOnVimEnter = true,
        -- When `true`, enables the plugin when you enter a new Tab.
        -- note: it does not trigger if you come back to an existing tab, to prevent unwanted interfer with user's decisions.
        --- @type boolean
        enableOnTabEnter = false,
        -- When `true`, reloads the plugin configuration after a colorscheme change.
        --- @type boolean
        reloadOnColorSchemeChange = false,
        -- When `true`, entering one of no-neck-pain side buffer will automatically skip it and go to the next available buffer.
        --- @type boolean
        skipEnteringNoNeckPainBuffer = false,
      },
    },
  },
  -- {
  --   "https://github.com/folke/zen-mode.nvim",
  --   opts = {
  --     -- your configuration comes here
  --     -- or leave it empty to use the default settings
  --     -- refer to the configuration section below
  --     plugins = {
  --       twilight = { enabled = false }, -- enable to start Twilight when zen mode opens
  --     },
  --   },
  -- },
}
