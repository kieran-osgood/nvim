---@function Function to render the MultiCursor statusline
---@return table status The MultiCursor status object
local function mc_statusline()
  local mc = require("multicursor-nvim")
  local status = {}
  if mc.hasCursors() then
    status.enabled = true
    if vim.fn.mode() == "v" then
      status.icon = "󰚕 "
      status.short_text = "V"
      status.text = "VISUAL"
      status.color = "lualine_a_visual"
    else
      status.icon = "󰬸 "
      status.short_text = "N"
      status.text = "NORMAL"
      status.color = "lualine_a_normal"
    end
  else
    status.enabled = false
    status.icon = "󰘪 "
    status.short_text = "NO"
    status.text = "SINGLE"
    status.color = "lualine_a_normal"
  end
  status.icon_short_text = status.icon .. status.short_text
  status.icon_text = status.icon .. status.text
  return status
end

return {
  "nvim-lualine/lualine.nvim",
  opts = function()
    -- local icons = require("lazyvim.config").icons
    -- local Util = require("lazyvim.util")

    return {
      options = {
        icons_enabled = true,
        -- theme = "catppuccin",
        -- theme = theme,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = true,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        },
      },
      sections = {
        lualine_a = {
          {
            "mode",
            icon = "",
            separator = { left = "", right = "" },
            color = {
              fg = "#1c1d21",
              bg = "#b4befe",
            },
          },
          { -- MultiCursors
            function()
              return mc_statusline().icon
            end,
            cond = function()
              return mc_statusline().enabled
            end,
            color = function()
              return mc_statusline().color
            end,
            padding = { left = 0, right = 0 },
            separator = { left = "", right = "" },
          },
        },
        lualine_b = {
          {
            "branch",
            icon = "",
            separator = { left = "", right = "" },
            color = {
              fg = "#1c1d21",
              bg = "#7d83ac",
            },
          },
          -- {
          --   "diff",
          --   separator = { left = "", right = "" },
          --   color = {
          --     fg = "#1c1d21",
          --     bg = "#7d83ac",
          --   },
          -- },
        },
        lualine_c = {
          {
            "diagnostics",
            separator = { left = "", right = "" },
            color = {
              bg = "#45475a",
            },
          },
          -- {
          --   "filename",
          -- },
        },
        -- lualine_x = { "filesize" },
        lualine_y = {
          {
            "searchcount",
            maxcount = 999,
            timeout = 500,
          },

          {
            "filetype",
            icons_enabled = false,
            color = {
              fg = "#1C1D21",
              bg = "#eba0ac",
            },
          },
        },
        lualine_z = {
          -- {
          --   "location",
          --   icon = "",
          --   color = {
          --     fg = "#1c1d21",
          --     bg = "#f2cdcd",
          --   },
          -- },
        },
      },
      inactive_sections = {
        -- lualine_a = {},
        -- lualine_b = {},
        -- lualine_c = { "filename" },
        -- lualine_x = {},
        -- lualine_y = {},
        -- lualine_z = {},
      },
      tabline = {},
      winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      inactive_winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      extensions = { "neo-tree", "lazy" },
    }
  end,
}
