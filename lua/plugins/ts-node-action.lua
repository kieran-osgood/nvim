return {
  "ckolkey/ts-node-action",
  dependencies = { "nvim-treesitter" },
  opts = {},
  init = function()
    vim.keymap.set({ "n" }, "<leader>M", require("ts-node-action").node_action, { desc = "Trigger Node Action" })
  end,
  keys = {
    { "K", "<cmd>NodeAction<cr>", desc = "Trigger Node Action" },
  },
}
