return {
  "williamboman/mason.nvim",
  -- "williamboman/mason-lspconfig.nvim",

  cond = not vim.g.vscode,

  lazy = false,
  priority = 200,

  -- config = function ()
  --   require("mason").setup()
  --
  --   require("mason-lspconfig").setup{
  --     ensure_installed = { "astro", "vtsls" },
  --     automatic_installation = true,
  --   }
  -- end,
}
