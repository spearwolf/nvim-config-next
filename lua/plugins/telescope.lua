return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local builtin = require('telescope.builtin')

    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find Files' })
    vim.keymap.set('n', '<C-P>', builtin.find_files, { desc = 'Find Files' })

    vim.keymap.set('n', '<leader>lg', builtin.live_grep, { desc = 'Live Grep' })

    vim.keymap.set('n', '<C-K>b', builtin.buffers, { desc = 'Show Buffers' })
    vim.keymap.set('n', '<C-K>q', builtin.quickfix, { desc = 'Quickfix list' })
    vim.keymap.set('n', '<C-K>t', builtin.colorscheme, { desc = 'Select Colorscheme' })
    vim.keymap.set('n', '<C-K>r', builtin.lsp_references, { desc = 'List references (current word)' })
    vim.keymap.set('n', '<C-K>i', builtin.lsp_implementations, { desc = 'Goto implementation (current word)' })
    vim.keymap.set('n', '<C-K>d', builtin.lsp_definitions, { desc = 'Goto definition (current word)' })
    vim.keymap.set('n', '<C-K>T', builtin.lsp_type_definitions, { desc = 'Goto type definition (current word)' })
  end,
}
