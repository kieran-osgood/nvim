return {
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  --   branch = "master",
  -- },
  {
    "https://github.com/jake-stewart/multicursor.nvim",
    branch = "1.0",
    config = function()
      local mc = require("multicursor-nvim")

      mc.setup()

      -- Add cursors above/below the main cursor.
      vim.keymap.set({ "n", "v" }, "<up>", function()
        mc.addCursor("k")
      end, { desc = "addCursor up" })

      vim.keymap.set({ "n", "v" }, "<down>", function()
        mc.addCursor("j")
      end, { desc = "addCursor down" })

      -- Add a cursor and jump to the next word under cursor.
      vim.keymap.set({ "n", "v" }, "<c-n>", function()
        mc.addCursor("*")
      end)

      -- Jump to the next word under cursor but do not add a cursor.
      vim.keymap.set({ "n", "v" }, "<c-h>", function()
        mc.skipCursor("*")
      end)

      -- Rotate the main cursor.
      vim.keymap.set({ "n", "v" }, "<left>", mc.nextCursor, { desc = "nextCursor" })
      vim.keymap.set({ "n", "v" }, "<right>", mc.prevCursor, { desc = "prevCursor" })

      -- Delete the main cursor.
      vim.keymap.set({ "n", "v" }, "<leader>x", mc.deleteCursor, { desc = "deleteCursor" })

      -- Add and remove cursors with control + left click.
      vim.keymap.set("n", "<c-leftmouse>", mc.handleMouse, { desc = "handleMouse" })

      vim.keymap.set({ "n", "v" }, "<c-q>", function()
        if mc.cursorsEnabled() then
          -- Stop other cursors from moving.
          -- This allows you to reposition the main cursor.
          mc.disableCursors()
        else
          mc.addCursor()
        end
      end)

      vim.keymap.set("n", "<leader>m", function()
        if not mc.cursorsEnabled() then
          mc.enableCursors()
        elseif mc.hasCursors() then
          mc.clearCursors()
        else
          -- Default <esc> handler.
          mc.clearCursors()
        end
      end, { desc = "Clear Cursors" })

      -- Align cursor columns.
      vim.keymap.set("n", "<leader>a", mc.alignCursors, { desc = "alignCursors" })

      -- Split visual selections by regex.
      vim.keymap.set("v", "S", mc.splitCursors, { desc = "splitCursors" })

      -- Append/insert for each line of visual selections.
      vim.keymap.set("v", "I", mc.insertVisual, { desc = "insertVisual" })
      vim.keymap.set("v", "A", mc.appendVisual, { desc = "appendVisual" })

      -- match new cursors within visual selections by regex.
      vim.keymap.set("v", "M", mc.matchCursors, { desc = "matchCursors" })

      -- Rotate visual selection contents.
      vim.keymap.set("v", "<leader>t", function()
        mc.transposeCursors(1)
      end)
      vim.keymap.set("v", "<leader>T", function()
        mc.transposeCursors(-1)
      end)

      -- Customize how cursors look.
      vim.api.nvim_set_hl(0, "MultiCursorCursor", { link = "Cursor" })
      vim.api.nvim_set_hl(0, "MultiCursorVisual", { link = "Visual" })
      vim.api.nvim_set_hl(0, "MultiCursorDisabledCursor", { link = "Visual" })
      vim.api.nvim_set_hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
    end,
  },
}
