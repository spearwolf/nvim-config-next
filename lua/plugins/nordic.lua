return {
  "AlexvZyl/nordic.nvim",
  cond = not vim.g.vscode,
  lazy = false,
  priority = 1000,
  config = function()
    require('nordic').load()
  end,
}
