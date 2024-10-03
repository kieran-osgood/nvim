return {
  "folke/noice.nvim",
  opts = {
    presets = {
      lsp_doc_border = true,
    },

    routes = {
      {
        -- REMOVE THIS once this issue is fixed: https://github.com/yioneko/vtsls/issues/159
        filter = {
          event = "notify",
          find = "Request textDocument/inlayHint failed",
        },
        opts = { skip = true },
      },
    },
  },
}
