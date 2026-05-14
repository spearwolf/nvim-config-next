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

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "💥", -- or 'E'
      [vim.diagnostic.severity.WARN] = "💀", -- or 'W'
      [vim.diagnostic.severity.INFO] = "🐸", -- or 'I'
      [vim.diagnostic.severity.HINT] = "👻", -- or 'H'
    },
    linehl = {
      [vim.diagnostic.severity.ERROR] = "ErrorMsg",
    },
    numhl = {
      [vim.diagnostic.severity.WARN] = "WarningMsg",
    },
  },
})
