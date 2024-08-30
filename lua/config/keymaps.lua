-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

vim.keymap.set("n", ">", ">>")
vim.keymap.set("n", "<", "<<")

-- vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Search and replace current position word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Undotree
vim.keymap.set("n", "<leader>uu", vim.cmd.UndotreeToggle)

-- Twilight
vim.keymap.set("n", "<leader>tW", "<cmd>Twilight<CR>", { desc = "Toggle Twilight" })

-- local ls = require("luasnip")
--
-- vim.keymap.set({ "i", "s" }, "<C-H>", function()
--   ls.jump(1)
-- end, { silent = true })
--
-- vim.keymap.set({ "i", "s" }, "<C-J>", function()
--   ls.jump(-1)
-- end, { silent = true })

-- Can be used to move diagnostic messages into the qflist when they're not focusable
vim.keymap.set("n", "<leader>qf", vim.diagnostic.setqflist, { desc = "Move to QuickFix List" })
vim.keymap.set(
  "n",
  "<leader><leader>",
  "<cmd>Telescope git_files recurse_submodules=true<CR>",
  { desc = "Find Files (git files recursive)" }
)

vim.keymap.set("i", "<Tab><Tab>", 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false,
})
vim.g.copilot_no_tab_map = true
