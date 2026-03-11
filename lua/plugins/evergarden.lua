return {
  'everviolet/nvim', name = 'evergarden',
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- Colorscheme plugin is loaded first before any other plugins
  cond = not vim.g.vscode,
  opts = {
    theme = {
      variant = 'fall', -- 'winter'|'fall'|'spring'|'summer'
      accent = 'green',
    },
    editor = {
      transparent_background = false,
      sign = { color = 'none' },
      float = {
        color = 'mantle',
        solid_border = false,
      },
      completion = {
        color = 'surface0',
      },
    },
  }
}
