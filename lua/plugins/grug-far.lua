return {
  'MagicDuck/grug-far.nvim',
  config = function()
    require('grug-far').setup({
      -- ... options, see Configuration section below ...
      -- ... there are no required options atm...
      -- ... engine = 'ripgrep' is default, but 'astgrep' can be specified...
    });

    local rename = function()
      require('grug-far').grug_far({
        prefills = { search = vim.fn.expand("<cword>") }
      });
    end;

    vim.keymap.set('n', '<leader>rn', rename, {})
  end
}
