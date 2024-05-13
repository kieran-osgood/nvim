return {
  "dmmulroy/tsc.nvim",
  opts = {
    bin_path = vim.fn.findfile("node_modules/.bin/tsc"),
    use_trouble_qflist = true,
    auto_start_watch_mode = false,
    flags = {
      watch = true,
    },
  },
}
