local colors = {
  blue   = '#80a0ff',
  cyan   = '#79dac8',
  black  = '#080808',
  white  = '#c6c6c6',
  red    = '#ff5189',
  violet = '#d183e8',
  grey   = '#303030',
}

local bubbles_theme = {
  normal = {
    a = { fg = colors.black, bg = colors.violet },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.white },
  },

  insert = { a = { fg = colors.black, bg = colors.blue } },
  visual = { a = { fg = colors.black, bg = colors.cyan } },
  replace = { a = { fg = colors.black, bg = colors.red } },

  inactive = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.white },
  },
}

return {
  "nvim-lualine/lualine.nvim",
  cond = not vim.g.vscode,
  config = function()
    require('lualine').setup {
      options = {
        icons_enabled = true,
        -- https://github.com/nvim-lualine/lualine.nvim/blob/master/THEMES.md
        -- theme = 'onedark',
        -- theme = 'papercolor_dark',
        -- theme = 'solarized_dark',
        -- theme = 'horizon',
        -- theme = 'nightfly',
        -- theme = 'lackluster',
        -- theme = 'powerline_dark',
        theme = bubbles_theme,
        -- component_separators = { left = '', right = ''},
        -- section_separators = { left = '', right = ''},
        component_separators = '',
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        }
      },
      -- sections = {
      --   lualine_a = {'mode'},
      --   lualine_b = {'branch', 'diff', 'diagnostics'},
      --   lualine_c = {'filename'},
      --   lualine_x = {'encoding', 'fileformat', 'filetype'},
      --   lualine_y = {'progress'},
      --   lualine_z = {'location'}
      -- },
      -- inactive_sections = {
      --   lualine_a = {},
      --   lualine_b = {},
      --   lualine_c = {'filename'},
      --   lualine_x = {'location'},
      --   lualine_y = {},
      --   lualine_z = {}
      -- },
      sections = {
        lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
        lualine_b = { 'filename', 'branch' },
        lualine_c = {
          '%=', --[[ add your center components here in place of this comment ]]
        },
        lualine_x = {},
        lualine_y = { 'filetype', 'progress' },
        lualine_z = {
          { 'location', separator = { right = '' }, left_padding = 2 },
        },
      },
      inactive_sections = {
        lualine_a = { 'filename' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' },
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {}
    }
  end,
}
