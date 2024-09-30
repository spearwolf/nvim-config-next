return {
  'maxmx03/fluoromachine.nvim',
  cond = not vim.g.vscode,
  lazy = false,
  priority = 1000,
  config = function ()
    require('fluoromachine').setup {
      glow = true,
      theme = 'fluoromachine',
      -- theme = 'delta',
      -- theme = 'retrowave',
      transparent = true,
    }
  end
}
