-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Function to set a random highlight color for LineNr
function SetRandomLineNrColor()
  math.randomseed(os.time())

  local colors = {
    "#b4befe", -- Lavender
    "#eba0ac", -- Maroon
    "#d2fac5", -- Green
    "#f2cdcd", -- Flamingo
    "#cba6f7", -- Mauve
    "#fcc6a7", -- Peach
    "#89b4fa", -- Blue
    "#89dceb", -- Sky
  }

  local index = math.random(#colors)
  vim.api.nvim_set_hl(0, "LineNr", { fg = colors[index], bold = true })
end

-- Ensure the random color is selected each time Neovim starts
vim.cmd("autocmd VimEnter * lua SetRandomLineNrColor()")

-- Setting highlights for lines above and below
vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#6e738d", bold = false })
vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#6e738d", bold = false })

vim.g.neovide_scale_factor = 1.0
local change_scale_factor = function(delta)
  vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
end
vim.keymap.set("n", "<C-=>", function()
  change_scale_factor(1.25)
end)
vim.keymap.set("n", "<C-->", function()
  change_scale_factor(1 / 1.25)
end)

if vim.g.neovide then
  -- vim.g.neovide_cursor_vfx_mode = "railgun"
  vim.keymap.set("n", "<D-s>", ":w<CR>") -- Save
  vim.keymap.set("v", "<D-c>", '"+y') -- Copy
  vim.keymap.set("n", "<D-v>", '"+P') -- Paste normal mode
  vim.keymap.set("v", "<D-v>", '"+P') -- Paste visual mode
  vim.keymap.set("c", "<D-v>", "<C-R>+") -- Paste command mode
  vim.keymap.set("i", "<D-v>", '<ESC>l"+Pli') -- Paste insert mode
end

-- Allow clipboard copy paste in neovim
vim.api.nvim_set_keymap("", "<D-v>", "+p<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("!", "<D-v>", "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<D-v>", "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<D-v>", "<C-R>+", { noremap = true, silent = true })
