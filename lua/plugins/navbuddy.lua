return {
  "neovim/nvim-lspconfig",
  lazy = false,
  dependencies = {
    {
      "SmiteshP/nvim-navbuddy",
      dependencies = {
        "SmiteshP/nvim-navic",
        "MunifTanjim/nui.nvim",
      },
      opts = { lsp = { auto_attach = true } },
    },
  },
  -- your lsp config or other stuff
  keys = {
    { "<leader>cy", "<cmd>lua require('nvim-navbuddy').open()<CR>", desc = "Open Navbuddy" },
  },
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local lspconfig = require("lspconfig")

    -- lspconfig.tsserver.setup({
    --   capabilities = capabilities,
    -- })
    -- lspconfig.html.setup({
    --   capabilities = capabilities,
    -- })
    -- lspconfig.lua_ls.setup({
    --   capabilities = capabilities,
    -- })
  end,
}
