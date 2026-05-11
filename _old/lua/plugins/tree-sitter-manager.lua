return {
  "romus204/tree-sitter-manager.nvim",

  cond = not vim.g.vscode,

  lazy = false,
  priority = 80, -- after lspconfig (100) and mason (90)

  config = function()
    require("tree-sitter-manager").setup({
      auto_install = true,
      highlight = true,
      ensure_installed = {
        "astro",
        "bash",
        "cpp",
        "css",
        "diff",
        "editorconfig",
        "gitcommit",
        "git_config",
        "gitignore",
        "git_rebase",
        "glsl",
        "go",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "json5",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "rust",
        "scss",
        "ssh_config",
        "typescript",
        "tsx",
        "vim",
        "vimdoc",
        "yaml",
      },
    })
  end,
}
