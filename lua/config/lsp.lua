require("mason").setup({})
require("mason-lspconfig").setup({
  automatic_enable = true,
})
require("mason-tool-installer").setup({
  ensure_installed = {
    "lua_ls",
    "gopls",
    "ts_ls",
    "jsonls",
    "stylua",
    "prettier",
    "goimports",
  },
})

-- vim.lsp.inlay_hint.enable(true)
vim.lsp.codelens.enable(true)

local icons = require("config.diagnostic-icons")

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = icons.error,
      [vim.diagnostic.severity.WARN] = icons.warn,
      [vim.diagnostic.severity.INFO] = icons.info,
      [vim.diagnostic.severity.HINT] = icons.hint,
    },
    linehl = {
      [vim.diagnostic.severity.ERROR] = "ErrorMsg",
    },
    numhl = {
      [vim.diagnostic.severity.WARN] = "WarningMsg",
    },
  },
})
