return {
  "mg979/vim-visual-multi",
  lazy = false,
  branch = "master",
  init = function()
    vim.g.VM_maps = {
      ["Find Under"] = "",
      -- ["Add Cursor Up"] = "∆",
      -- ["Add Cursor Down"] = "˚",
      --
      ["Add Cursor Up"] = "<C-S-Up>",
      ["Add Cursor Down"] = "<C-S-Down>",
    }
  end,

  {
    "smoka7/multicursors.nvim",
    event = "VeryLazy",
    dependencies = {
      "smoka7/hydra.nvim",
    },
    opts = {},
    cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
    keys = {
      {
        mode = { "v", "n" },
        "<Leader>m",
        "<cmd>MCstart<cr>",
        desc = "Create a selection for selected text or word under the cursor",
      },
    },
  },
}
