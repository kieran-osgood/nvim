return {
  -- {
  --   "ThePrimeagen/harpoon",
  --   branch = "harpoon2",
  --   dependencies = { "nvim-lua/plenary.nvim" },
  --
  --   config = function()
  --     local harpoon = require("harpoon")
  --
  --     -- REQUIRED
  --     harpoon:setup()
  --     -- REQUIRED
  --
  --     vim.keymap.set("n", "<leader>a", function()
  --       harpoon:list():add()
  --     end, { desc = "Add to Harpoon" })
  --
  --     vim.keymap.set("n", ";", function()
  --       harpoon.ui:toggle_quick_menu(harpoon:list())
  --     end, { desc = "(Harpoon) Toggle Quick Menu" })
  --
  --     vim.keymap.set("n", "<M-h>", function()
  --       harpoon:list():select(1)
  --     end, { desc = "(Harpoon) Select 1" })
  --
  --     vim.keymap.set("n", "<M-t>", function()
  --       harpoon:list():select(2)
  --     end, { desc = "(Harpoon) Select 2" })
  --
  --     vim.keymap.set("n", "<M-n>", function()
  --       harpoon:list():select(3)
  --     end, { desc = "(Harpoon) Select 3" })
  --
  --     vim.keymap.set("n", "<M-s>", function()
  --       harpoon:list():select(4)
  --     end, { desc = "(Harpoon) Select 4" })
  --
  --     -- Toggle previous & next buffers stored within Harpoon list
  --     vim.keymap.set("n", "<M-S-P>", function()
  --       harpoon:list():prev()
  --     end, { desc = "(Harpoon) Prev" })
  --
  --     vim.keymap.set("n", "<M-S-N>", function()
  --       harpoon:list():next()
  --     end, { desc = "(Harpoon) Next" })
  --
  --     -- basic telescope configuration
  --     local conf = require("telescope.config").values
  --     local function toggle_telescope(harpoon_files)
  --       local file_paths = {}
  --       for _, item in ipairs(harpoon_files.items) do
  --         table.insert(file_paths, item.value)
  --       end
  --
  --       require("telescope.pickers")
  --         .new({}, {
  --           prompt_title = "Harpoon",
  --           finder = require("telescope.finders").new_table({
  --             results = file_paths,
  --           }),
  --           previewer = conf.file_previewer({}),
  --           sorter = conf.generic_sorter({}),
  --         })
  --         :find()
  --     end
  --
  --     vim.keymap.set("n", "<C-e>", function()
  --       toggle_telescope(harpoon:list())
  --     end, { desc = "(Harpoon) Open in Telescope" })
  --   end,
  -- },

  {
    "otavioschwanck/arrow.nvim",
    opts = {
      show_icons = true,
      buffer_leader_key = "m", -- Per Buffer Mappings
      separate_by_branch = true, -- Bookmarks will be separated by git branch
      save_key = "cwd", -- what will be used as root to save the bookmarks. Can be also `git_root`.
    },
  },
}
