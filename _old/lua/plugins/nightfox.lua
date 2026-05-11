return {
  "EdenEast/nightfox.nvim",
  cond = not vim.g.vscode,
  lazy = false,
  priority = 1000,
  config = function()
    require('nightfox').setup({
      options = {
        styles = {
          comments = "italic",
          -- keywords = "bold",
          -- types = "italic,bold",
        }
      }
    })
  end,
}
