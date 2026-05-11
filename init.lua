-- my personal neovim v0.12+ config
-- created by spearwolf, may'26

-- recommended setup (outside of neovim, inside your terminal):
-- $ npm i -g neovim tree-sitter-cli

vim.g.mapleader = ","
vim.g.maplocalleader = ","

vim.cmd [[
  source $HOME/.config/nvim/common.vim
]]

vim.opt.compatible = false
vim.opt.laststatus = 3
vim.opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
vim.opt.termguicolors = true
vim.opt.timeoutlen = vim.g.vscode and 1000 or 500

vim.pack.add({
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/vague-theme/vague.nvim',
  'https://github.com/stevearc/aerial.nvim',
  'https://github.com/Saghen/blink.lib',
  { src = 'https://github.com/Saghen/blink.cmp', version = vim.version.range('*') },
})

vim.cmd.colorscheme('vague')

require('plugins.aerial')
require('plugins.blink')

