return {
  "mason-org/mason-lspconfig.nvim",

  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
  },

  cond = not vim.g.vscode,

  lazy = false,
  priority = 90, -- make sure mason is loaded after lspconfig

  opts = {
    ensure_installed = { "astro", "vtsls", "lua_ls", "ts_ls", "eslint", "tailwindcss" },
    -- ensure_installed = { },
    automatic_installation = true,
    automatic_enable = true,
  },
}
-- return {
--   "williamboman/mason.nvim",
--   "williamboman/mason-lspconfig.nvim",
--
--   cond = not vim.g.vscode,
--
--   lazy = true,
--   priority = 200,
--
--   config = function ()
--     require("mason").setup()
--
--     require("mason-lspconfig").setup{
--       ensure_installed = { "astro", "vtsls", "lua_ls", "ts_ls", "tsserver", "eslint", "tailwindcss" },
--       -- ensure_installed = { },
--       automatic_installation = true,
--     }
--   end,
-- }
