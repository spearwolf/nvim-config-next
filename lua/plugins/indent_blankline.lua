return {
  "lukas-reineke/indent-blankline.nvim",
  cond = not vim.g.vscode,
  main = "ibl",
  opts = {},
  -- config = function()
  --   if not vim.g.vscode then
  --     require("ibl").setup{}
  --   end
  -- end,
}
