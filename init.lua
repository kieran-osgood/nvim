-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.o.shell = "/bin/zsh"

-- MDX files will use the Markdown parser and queries.
vim.filetype.add({ extension = { mdx = "mdx" } })
vim.treesitter.language.register("markdown", "mdx")

vim.o.cmdheight = 1

require("telescope").load_extension("git_worktree")

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
-- )
