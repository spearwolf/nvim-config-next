return {
  'kosayoda/nvim-lightbulb',
  cond = not vim.g.vscode,
  config = function()
    require("nvim-lightbulb").setup({
      autocmd = { enabled = true }
    })
  end,
}
