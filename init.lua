require("config.common")
require("config.lazy")

vim.cmd [[
  "colorscheme minicyan
  "colorscheme minischeme
  "colorscheme randomhue
  "colorscheme onedark
  "colorscheme cyberdream
  colorscheme falcon

  source $HOME/.config/nvim/vim/keys.vim
]]

local lsp_rename = function()
  vim.lsp.buf.rename();
end

vim.keymap.set('n', '<leader>rn', lsp_rename, { desc = 'Rename (lsp)' })

