return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require("telescope").setup({
      extensions = {
        aerial = {
          -- How to format the symbols
          format_symbol = function(symbol_path, filetype)
            if filetype == "json" or filetype == "yaml" then
              return table.concat(symbol_path, ".")
            else
              return symbol_path[#symbol_path]
            end
          end,
          -- Available modes: symbols, lines, both
          show_columns = "both",
        },
      },
    })

    require("telescope").load_extension("aerial")

    local builtin = require('telescope.builtin')

    if not vim.g.vscode then
      vim.keymap.set('n', '<C-P>', builtin.find_files, { desc = 'Find Files' })

      vim.keymap.set('n', '<leader>/', builtin.live_grep, { desc = 'Live Grep' })

      vim.keymap.set('n', '<C-K>a', vim.lsp.buf.code_action, { desc = 'Code Actions' })

      vim.keymap.set('n', '<C-K>b', builtin.buffers, { desc = 'Show Buffers' })
      vim.keymap.set('n', '<C-K>q', builtin.quickfix, { desc = 'Quickfix list' })
      vim.keymap.set('n', '<C-K>t', builtin.colorscheme, { desc = 'Select Colorscheme' })

      vim.keymap.set('n', '<M-S-F12>', builtin.lsp_references, { desc = 'List references (current word)' })

      vim.keymap.set('n', '<F12>', builtin.lsp_definitions, { desc = 'Goto definition (current word)' })

      vim.keymap.set('n', '<leader>ss', builtin.lsp_document_symbols, { desc = 'Show symbols (buffer)' })
      vim.keymap.set('n', '<leader>sS', builtin.lsp_workspace_symbols, { desc = 'Show symbols (workspace)' })

    end

    vim.keymap.set('n', 'gi', builtin.lsp_implementations, { desc = 'Goto implementation (current word)' })
    vim.keymap.set('n', 'gd', builtin.lsp_definitions, { desc = 'Goto definition (current word)' })
    vim.keymap.set('n', 'gD', builtin.lsp_type_definitions, { desc = 'Goto type definition (current word)' })
  end,
}
