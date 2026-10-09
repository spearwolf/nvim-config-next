require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
  },
  sections = {
    lualine_x = {
      'encoding',
      { 'fileformat', symbols = { unix = '🐧' } },
      'filetype',
    },
  },
}
