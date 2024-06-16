return {
  -- "ThePrimeagen/git-worktree.nvim",
  -- Pinned to awerebea version due to ThePrimeagen branch being stale
  -- and missing fix for telescope api changes here:
  -- https://github.com/ThePrimeagen/git-worktree.nvim/issues/122
  "awerebea/git-worktree.nvim",
  branch = "handle_changes_in_telescope_api",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("git-worktree").setup()
  end,
  keys = {
    {
      "<leader>gl",
      "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>",
      desc = "List Worktrees",
    },
    {
      "<leader>ga",
      "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>",
      desc = "Add Worktrees",
    },
  },
}
