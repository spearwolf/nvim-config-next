require("config.common")
require("config.lazy")
require("utils")

local ok, _ = pcall(require, 'hosts.' .. hostname())
if not ok then
  require('hosts.default')
end

vim.cmd [[
  source $HOME/.config/nvim/vim/keys.vim
]]

if not vim.g.vscode and not vim.g.neovide then
  vim.g.clipboard = {
    name = 'OSC 52',
    copy = {
      ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
      ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
    },
    paste = {
      ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
      ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
    },
  }
end

local lsp_rename = function()
  vim.lsp.buf.rename();
end

local lsp_code_actions = function()
  vim.lsp.buf.code_action();
end

vim.keymap.set('n', '<leader>rn', lsp_rename, { desc = 'Rename (lsp)' })
vim.keymap.set({ 'n', 'v' }, '<leader>ca', lsp_code_actions, { desc = 'Code Actions (lsp)' })

-- some of the following keymaps here
-- inspired by https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

-- Move Lines
vim.keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
vim.keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })

if vim.g.vscode then
  -- vscode specials
  require("config.vscode")
else
  -- vscode emulation
  --
  function goto_next_reference(wrap)
    if wrap == nil then
      wrap = vim.o.wrapscan
      end
    require('illuminate.goto').goto_next_reference(wrap)
  end

  function goto_prev_reference(wrap)
    if wrap == nil then
      wrap = vim.o.wrapscan
    end
    require('illuminate.goto').goto_prev_reference(wrap)
  end

  vim.keymap.set('n', '<F7>', goto_next_reference, { desc = 'Next Occurence' })
  -- vim.keymap.set('n', '<S-F7>', goto_prev_reference, { desc = 'Prev Occurence' })
end

