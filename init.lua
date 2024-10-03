-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.o.shell = "/bin/zsh"

-- MDX files will use the Markdown parser and queries.
vim.filetype.add({ extension = { mdx = "mdx" } })
vim.treesitter.language.register("markdown", "mdx")

vim.o.cmdheight = 1

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
-- local rainbow_delimiters = require("rainbow-delimiters")

-- -- @type rainbow_delimiters.config
-- vim.g.rainbow_delimiters = {
--   strategy = {
--     [""] = rainbow_delimiters.strategy["global"],
--     vim = rainbow_delimiters.strategy["local"],
--   },
--   query = {
--     [""] = "rainbow-delimiters",
--     lua = "rainbow-blocks",
--   },
--   priority = {
--     [""] = 110,
--     lua = 210,
--   },
--   highlight = {
--     "RainbowDelimiterRed",
--     "RainbowDelimiterYellow",
--     "RainbowDelimiterBlue",
--     "RainbowDelimiterOrange",
--     "RainbowDelimiterGreen",
--     "RainbowDelimiterViolet",
--     "RainbowDelimiterCyan",
--   },
-- }

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

require("telescope").load_extension("worktrees")

require("mini.cursorword").setup({
  delay = 20,
})

vim.api.nvim_create_autocmd({ "ColorScheme", "VimEnter" }, {
  group = vim.api.nvim_create_augroup("Color", {}),
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "LspReferenceRead", { fg = "#FF0000", underline = true })
    vim.api.nvim_set_hl(0, "LspReferenceWrite", { fg = "#FF0000", underline = true })
    vim.api.nvim_set_hl(0, "LspReferenceText", { fg = "#FF0000", underline = true })
  end,
})

-- write a vim.cmd to underline the cursor word
-- vim.cmd("hi CursorLine cterm=underline gui=underline")
-- vim.api.nvim_set_hl(0, "CursorLine", { underline = true })
-- vim.cmd("hi! link MiniCursorword Visual")
-- vim.cmd("hi! MiniCursorwordCurrent gui=nocombine guifg=NONE guibg=NONE")
--
-- vim.cmd("highlight Visual cterm=NONE ctermbg=76 ctermfg=16 gui=NONE guibg=#5fd700 guifg=#000000")
-- vim.cmd("highlight StatusLine cterm=NONE ctermbg=231 ctermfg=160 gui=NONE guibg=#ffffff guifg=#d70000")
-- vim.cmd("highlight Normal cterm=NONE ctermbg=17 gui=NONE guibg=#00005f")
-- vim.cmd("highlight NonText cterm=NONE ctermbg=17 gui=NONE guibg=#00005f")

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "json", "jsonc", "json5" },
  callback = function()
    vim.opt_local.conceallevel = 3
    vim.opt.conceallevel = 3
  end,
})
