vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local set = vim.opt

set.compatible = false
set.termguicolors = true

vim.cmd [[
  source common.vim
]]

