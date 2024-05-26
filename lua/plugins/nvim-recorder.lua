return {
  "chrisgrieser/nvim-recorder",
  dependencies = "rcarriga/nvim-notify",
  keys = {
    -- these must match the keys in the mapping config below
    { "q", desc = " Start Recording" },
    { "Q", desc = " Play Recording" },
  },
  config = function()
    require("recorder").setup({ mapping = { startStopRecording = "q", playMacro = "Q" } })

    local lualine_a = require("lualine").get_config().sections.lualine_a or {}
    table.insert(lualine_a, 1, {
      require("recorder").recordingStatus,
      separator = { left = "", right = "" },
    })

    -- local lualineY = require("lualine").get_config().sections.lualine_y or {}
    -- table.insert(lualineY, { require("recorder").displaySlots })

    require("lualine").setup({ sections = { lualine_a = lualine_a } })
  end,
}
