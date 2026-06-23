require("conform").setup({
  format_on_save = function()
    local lsp_format_opt = "fallback"
    return {
      timeout_ms = 500,
      lsp_format = lsp_format_opt,
    }
  end,
  formatters_by_ft = {
    javascript = { "biome", "biome-organize-imports" },
    javascriptreact = { "biome", "biome-organize-imports" },
    typescript = { "biome", "biome-organize-imports" },
    typescriptreact = { "biome", "biome-organize-imports" },
    json = { "biome" },
    go = { "gofmt" },
    rust = { "rustfmt" },
  },
})
