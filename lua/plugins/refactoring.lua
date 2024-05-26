return {
  "ThePrimeagen/refactoring.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    printf_statements = {
      -- add a custom printf statement for cpp
      ts = {
        'console.log("LOG:", "%s")',
      },
    },
  },
  config = function()
    require("refactoring").setup()

    vim.keymap.set("x", "<leader>re", function()
      require("refactoring").refactor("Extract Function")
    end, { desc = "Extract Function" })

    vim.keymap.set("x", "<leader>rf", function()
      require("refactoring").refactor("Extract Function To File")
    end, { desc = "Extract Function To File" })

    -- Extract function supports only visual mode
    vim.keymap.set("x", "<leader>rv", function()
      require("refactoring").refactor("Extract Variable")
    end, { desc = "Extract Variable" })

    -- Extract variable supports only visual mode
    vim.keymap.set("n", "<leader>rI", function()
      require("refactoring").refactor("Inline Function")
    end, { desc = "Inline Function" })

    -- Inline func supports only normal
    vim.keymap.set({ "n", "x" }, "<leader>ri", function()
      require("refactoring").refactor("Inline Variable")
    end, { desc = "Inline Variable" })
    -- Inline var supports both normal and visual mode

    vim.keymap.set("n", "<leader>rb", function()
      require("refactoring").refactor("Extract Block")
    end, { desc = "Extract Block" })

    vim.keymap.set("n", "<leader>rbf", function()
      require("refactoring").refactor("Extract Block To File")
    end, { desc = "Extract Block To File" })
    -- Extract block supports only normal mode
    -- You can also use below = true here to to change the position of the printf
    -- statement (or set two remaps for either one). This remap must be made in normal mode.
    vim.keymap.set("n", "<leader>rp", function()
      require("refactoring").debug.printf({ below = false })
    end)

    -- Print var

    vim.keymap.set({ "x", "n" }, "<leader>rv", function()
      require("refactoring").debug.print_var()
    end, { desc = "print_var" })
    -- Supports both visual and normal mode

    vim.keymap.set("n", "<leader>rc", function()
      require("refactoring").debug.cleanup({})
    end, { desc = "cleanup" })
    -- Supports only normal mode
  end,
}
