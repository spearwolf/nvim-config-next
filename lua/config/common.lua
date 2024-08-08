vim.g.mapleader = ","
-- vim.g.maplocalleader = "\\"
vim.g.maplocalleader = ","

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local set = vim.opt

set.compatible = false
set.termguicolors = true

vim.cmd [[
  source $HOME/.config/nvim/vim/common.vim
]]

local opt = vim.opt

opt.timeoutlen = vim.g.vscode and 1000 or 500 -- Lower than default (1000) to quickly trigger which-key
