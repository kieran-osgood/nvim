return {

  -- testing out mini surround as a replacement
  {
    "https://github.com/echasnovski/mini.surround",
    config = function()
      require("mini.surround").setup()
    end,
  },

  {
    -- -- https://github.com/kylechui/nvim-surround
    -- "kylechui/nvim-surround",
    -- version = "*",
    -- event = "VeryLazy",
    --
    -- config = function()
    --   require("nvim-surround").setup({
    --     -- Configuration here, or leave empty to use defaults
    --   })
    -- end,
  },
}
