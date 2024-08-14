return {
  {
    "https://github.com/Juksuu/worktrees.nvim",
    config = function()
      require("worktrees").setup()
    end,

    keys = {
      {
        "<leader>gl",
        function(opts)
          require("telescope").extensions.worktrees.list_worktrees(opts)
        end,
        desc = "(Worktrees) List Trees",
      },

      {
        "<leader>gA",
        function()
          require("worktrees").new_worktree(true)
        end,
        desc = "(Worktrees) Add Existing Branch",
      },

      {
        "<leader>ga",
        function()
          require("worktrees").new_worktree()
        end,
        desc = "(Worktrees) Add New Branch",
      },
    },
  },
}
