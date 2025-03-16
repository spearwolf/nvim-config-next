return {
  "sontungexpt/witch",
  cond = not vim.g.vscode,
  priority = 1000,
  lazy = false,
  config = function(_, opts)
    require("witch").setup(opts)
  end,
}
