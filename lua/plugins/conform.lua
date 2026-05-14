require("conform").setup({
  format_on_save = function(bufnr)
    local lsp_format_opt = "fallback"
    return {
      timeout_ms = 500,
      lsp_format = lsp_format_opt,
    }
  end,
  formatters_by_ft = {
    javascript = { "biome" },
    javascriptreact = { "biome" },
    typescript = { "biome" },
    typescriptreact = { "biome" },
    go = { "gofmt" },
    rust = { "rustfmt" },
  },
})
