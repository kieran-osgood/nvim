return {
  "TobinPalmer/rayso.nvim",
  cmd = { "Rayso" },

  config = function()
    require("rayso").setup({

      options = {
        theme = "tailwind",
        dark_mode = true,
        padding = 16,
      },
    })
  end,
}
