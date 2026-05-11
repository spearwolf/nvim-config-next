-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup()

-- map <silent> <F3> <Esc>:NvimTreeToggle<CR>
vim.keymap.set("n", "<F3>", "<cmd>NvimTreeToggle<CR>")
