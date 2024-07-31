return {
  {

    "Juksuu/worktrees.nvim",
    config = function()
      require("worktrees").setup()
    end,

    keys = {
      {
        "<leader>gl",
        function(opts)
          require("telescope").extensions.worktrees.list_worktrees(opts)
        end,
        desc = "List Worktrees",
      },
      {
        "<leader>ga",
        function()
          require("worktrees").new_worktree()
        end,
        desc = "Add Worktrees",
      },
    },
  },
}
