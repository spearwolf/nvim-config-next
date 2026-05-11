return {
  "stevearc/conform.nvim",

  cond = not vim.g.vscode,

  event = { "BufWritePre" },
  cmd = { "ConformInfo" },

  keys = {
    {
      "<Leader>f",
      function()
        require("conform").format({ async = true, lsp_format = "fallback" })
      end,
      mode = { "n", "x" },
      desc = "Format buffer",
    },
  },

  opts = {
    formatters_by_ft = {
      astro = { "prettier" },
      css = { "prettier" },
      graphql = { "prettier" },
      html = { "prettier" },
      javascript = { "prettier" },
      javascriptreact = { "prettier" },
      json = { "prettier" },
      less = { "prettier" },
      markdown = { "prettier" },
      scss = { "prettier" },
      typescript = { "prettier" },
      typescriptreact = { "prettier" },
      yaml = { "prettier" },
    },

    -- Prettier CLI flags are the source of truth for formatting style
    -- (intentionally not stored in .prettierrc). Mirror prior MunifTanjim/prettier.nvim cli_options.
    formatters = {
      prettier = {
        prepend_args = {
          "--arrow-parens", "avoid",
          "--no-bracket-spacing",
          "--no-bracket-same-line",
          "--end-of-line", "lf",
          "--html-whitespace-sensitivity", "strict",
          "--quote-props", "as-needed",
          "--semi",
          "--single-quote",
          "--trailing-comma", "all",
          "--experimental-ternaries",
          "--astro-allow-shorthand",
          "--astro-skip-frontmatter",
        },
      },
    },
  },
}
