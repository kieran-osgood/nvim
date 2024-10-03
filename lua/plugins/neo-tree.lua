return {
  {
    "vhyrro/luarocks.nvim",
    priority = 1001, -- this plugin needs to run before anything else
    opts = {
      rocks = { "magick" },
    },
  },
  {
    "3rd/image.nvim",
    dependencies = { "luarocks.nvim" },
  },
  {
    "saifulapm/neotree-file-nesting-config",
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      "3rd/image.nvim",
      {
        "s1n7ax/nvim-window-picker",
        version = "2.*",
        config = function()
          require("window-picker").setup({
            hint = "floating-big-letter",
            show_prompt = true,
            filter_rules = {
              include_current_win = false,
              autoselect_one = true,
              -- filter using buffer options
              bo = {
                -- if the file type is one of following, the window will be ignored
                filetype = { "neo-tree", "neo-tree-popup", "notify" },
                -- if the buffer type is one of following, the window will be ignored
                buftype = { "terminal", "quickfix" },
              },
            },
          })
        end,
      },
    },
    config = function(_, opts)
      -- Adding rules from plugin
      opts.nesting_rules = require("neotree-file-nesting-config").nesting_rules
      require("neo-tree").setup(opts)
    end,
    opts = {
      hide_root_node = true,
      retain_hidden_root_indent = true,

      default_component_configs = {
        indent = {
          indent_size = 2,
          padding = 1, -- extra padding on left hand side
          -- indent guides
          with_markers = true,
          indent_marker = "│",
          last_indent_marker = "└",
          highlight = "NeoTreeIndentMarker",
          -- expander config, needed for nesting files
          with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
          expander_collapsed = "",
          expander_expanded = "",
          expander_highlight = "NeoTreeExpander",
        },
      },
      commands = {
        system_open = function(state)
          local node = state.tree:get_node()
          local path = node:get_id()
          -- macOs: open file in default application in the background.
          vim.fn.jobstart({ "xdg-open", "-g", path }, { detach = true })
          -- Linux: open file in default application
          vim.fn.jobstart({ "xdg-open", path }, { detach = true })

          -- Windows: Without removing the file from the path, it opens in code.exe instead of explorer.exe
          local p
          local lastSlashIndex = path:match("^.+()\\[^\\]*$") -- Match the last slash and everything before it
          if lastSlashIndex then
            p = path:sub(1, lastSlashIndex - 1) -- Extract substring before the last slash
          else
            p = path -- If no slash found, return original path
          end
          vim.cmd("silent !start explorer " .. p)
        end,
      },
      event_handlers = {
        {
          event = "file_opened",
          handler = function()
            require("neo-tree.command").execute({ action = "close" })
          end,
        },

        {
          event = "neo_tree_buffer_enter",
          handler = function()
            vim.cmd("highlight! Cursor blend=100")
          end,
        },
        {
          event = "neo_tree_buffer_leave",
          handler = function()
            vim.cmd("highlight! Cursor guibg=#5f87af blend=0")
          end,
        },
      },
      filesystem = {
        filtered_items = {
          show_hidden_count = true,
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_by_name = {
            ".git",
            ".DS_Store",
            ".idea",
            "dist",
            "node_modules",
          },
          never_show = {
            ".DS_Store",
          },
          window = {
            mappings = {
              ["o"] = "system_open",
            },
          },
        },
      },
      window = {
        mapping_options = {
          noremap = true,
          nowait = true,
        },
        mappings = {
          ["P"] = {
            "toggle_preview",
            config = {
              use_float = true,
              use_image_nvim = true,
            },
          },
          ["<space>"] = {
            "toggle_node",
            nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use
          },
        },
      },
    },
  },
}
