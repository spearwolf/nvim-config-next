return {
  'MagicDuck/grug-far.nvim',
  config = function()
    require('grug-far').setup({
      -- ... options, see Configuration section below ...
      -- ... there are no required options atm...
      -- ... engine = 'ripgrep' is default, but 'astgrep' can be specified...
    });

    local function ripgrep_recursive()
      require('grug-far').grug_far({
        prefills = {
          search = vim.fn.expand("<cword>"),
        }
      });
    end;

    local function rename_local()
      require('grug-far').grug_far({
        prefills = {
          search = vim.fn.expand("<cword>"),
          paths = vim.fn.expand("%"),
        }
      });
    end;

    vim.keymap.set('n', '<leader>rg', ripgrep_recursive, {});
    vim.keymap.set('n', '<leader>rn', rename_local, {});
  end
}
