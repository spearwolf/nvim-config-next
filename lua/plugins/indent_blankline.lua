return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  -- opts = {},
  config = function()
    if not vim.g.vscode then
      require("ibl").setup{}
    end
  end,
}
