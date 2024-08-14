-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.o.shell = "/bin/zsh"

-- MDX files will use the Markdown parser and queries.
vim.filetype.add({ extension = { mdx = "mdx" } })
vim.treesitter.language.register("markdown", "mdx")

vim.o.cmdheight = 1

-- require("telescope").load_extension("git_worktree")
require("telescope").load_extension("worktrees")

-- Sets colors to line numbers Above, Current and Below  in this order
vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#51B3EC", bold = true })
vim.api.nvim_set_hl(0, "LineNr", { fg = "white", bold = true })
vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#51B3EC", bold = true })
vim.o.pumheight = 100
-- vim.api.nvim_exec(
--   [[
-- let $GIT_EDITOR = "nvr -cc split --remote-wait +'set bufhidden=wipe'"
-- ]],
--   false
--
-- )

-- This module contains a number of default definitions
local rainbow_delimiters = require("rainbow-delimiters")

---@type rainbow_delimiters.config
vim.g.rainbow_delimiters = {
  strategy = {
    [""] = rainbow_delimiters.strategy["global"],
    vim = rainbow_delimiters.strategy["local"],
  },
  query = {
    [""] = "rainbow-delimiters",
    lua = "rainbow-blocks",
  },
  priority = {
    [""] = 110,
    lua = 210,
  },
  highlight = {
    "RainbowDelimiterRed",
    "RainbowDelimiterYellow",
    "RainbowDelimiterBlue",
    "RainbowDelimiterOrange",
    "RainbowDelimiterGreen",
    "RainbowDelimiterViolet",
    "RainbowDelimiterCyan",
  },
}

-- trying to conceal the quotes in json
-- vim.wo.conceallevel = vim.bo.readonly or vim.bo.buftype == "nofile" and 2 or 0

require("telescope").setup({
  defaults = {
    file_ignore_patterns = {
      "node_modules",
      "Alfred.alfredpreferences",
    },
    pickers = {
      git_files = { recurse_submodules = false },
    },
  },
})
