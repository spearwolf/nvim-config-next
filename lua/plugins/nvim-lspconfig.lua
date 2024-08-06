return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "yioneko/nvim-vtsls",
  },
  config = function () 
    require("lspconfig.configs").vtsls = require("vtsls").lspconfig -- set default server config, optional but recommended
    require("lspconfig").vtsls.setup{}
  end,
}
