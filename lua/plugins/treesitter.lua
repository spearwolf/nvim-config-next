return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function () 
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = {
        "angular",
        "astro",
        "bash",
        "cmake",
        "cpp",
        "c_sharp",
        "css",
        "csv",
        "dart",
        "diff",
        "doxygen",
        "dtd",
        "editorconfig",
        "gitattributes",
        "gitcommit",
        "git_config",
        "gitignore",
        "git_rebase",
        "glsl",
        "go",
        "graphql",
        "html",
        "idl",
        "java",
        "javascript",
        "jsdoc",
        "json",
        "json5",
        "jsonc",
        "lua",
        "python",
        "rust",
        "scss",
        "ssh_config",
        "svelte",
        "toml",
        "typescript",
        "vim",
        "vimdoc",
        "vue",
        "xml",
        "yaml",
      },
      sync_install = false,
      highlight = { enable = not vim.g.vscode },
      indent = { enable = true },  
    })
  end
}