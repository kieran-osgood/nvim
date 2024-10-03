return {
  {
    "haydenmeade/neotest-jest",
  },
  {
    "nvim-neotest/neotest",
    event = "LspAttach",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      --
      "marilari88/neotest-vitest",
    },
    opts = {
      adapters = {
        ["neotest-vitest"] = {},
        ["neotest-jest"] = {
          jestCommand = "npm test --",
          jestConfigFile = "jest.config.js",
          cwd = function()
            return vim.fn.getcwd()
          end,
        },
      },
    },

    status = { virtual_text = true },
    output = { open_on_run = true },

    quickfix = {
      open = function()
        if LazyVim.has("trouble.nvim") then
          require("trouble").open({ mode = "quickfix", focus = false })
          return
        else
          vim.cmd("copen")
        end
      end,
    },
  },
}
