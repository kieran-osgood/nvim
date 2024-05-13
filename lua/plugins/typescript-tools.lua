return {
  "pmizio/typescript-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  opts = {
    complete_function_calls = true,
    disable_member_code_lens = false,
    expose_as_code_action = "all",
    tsserver_format_options = {
      allowIncompleteCompletions = false,
      allowRenameOfImportPath = false,
    },
    tsserver_file_preferences = {
      includeInlayParameterNameHints = "all",
      includeCompletionsForModuleExports = true,
    },
    on_attach = function(client, bufnr)
      require("twoslash-queries").attach(client, bufnr)
    end,
  },
}
