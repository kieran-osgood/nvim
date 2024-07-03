return {
  {
    "https://github.com/dense-analysis/ale.git",
    config = function()
      local g = vim.g

      g.ale_linters = { javascript = { "standard" } }
      g.ale_fixers = { javascript = { "standard" } }

      g.ale_lint_on_save = 1
      g.ale_fix_on_save = 1
    end,
  },

  {
    "mhartington/formatter.nvim",
    config = function()
      -- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
      require("formatter").setup({
        -- Enable or disable logging
        logging = true,
        -- Set the log level
        log_level = vim.log.levels.WARN,
        -- All formatter configurations are opt-in
        filetype = {
          javascript = {
            require("formatter.filetypes.javascript").standard,
          },
          javascriptreact = {
            require("formatter.filetypes.javascript").standard,
          },
          js = {
            require("formatter.filetypes.javascript").standard,
          },
        },
      })
    end,
  },
}
