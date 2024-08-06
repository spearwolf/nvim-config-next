require("config.common")
require("config.lazy")

vim.cmd [[
  "colorscheme minicyan
  "colorscheme minischeme
  "colorscheme randomhue
  colorscheme onedark
  "colorscheme cyberdream
  "colorscheme falcon

  source $HOME/.config/nvim/vim/keys.vim
]]

local lsp_rename = function()
  vim.lsp.buf.rename();
end

local lsp_code_actions = function()
  vim.lsp.buf.code_action();
end

-- local lsp_codelens = function()
--   vim.lsp.buf.codelens.display();
-- end

vim.keymap.set('n', '<leader>rn', lsp_rename, { desc = 'Rename (lsp)' })
vim.keymap.set('n', '<leader>ca', lsp_code_actions, { desc = 'Code Actions (lsp)' })
vim.keymap.set('x', '<leader>ca', lsp_code_actions, { desc = 'Code Actions (lsp)' })

