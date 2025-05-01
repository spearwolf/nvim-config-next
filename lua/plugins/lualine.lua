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
        -- theme = 'codedark',
        theme = 'dracula',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
         'packer', 'NvimTree' ,
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 250,
          tabline = 250,
          winbar = 250,
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
        lualine_a = { { 'mode', separator = { right = '' }, right_padding = 2 } },
        lualine_b = { 'branch', 'diagnostics', 'filename' },
        lualine_c = {
          '%=', --[[ add your center components here in place of this comment ]]
        },
        lualine_x = {},
        lualine_y = { 'filetype', 'encoding', 'fileformat', 'progress' },
        lualine_z = {
          { 'location', separator = { left = '' }, left_padding = 2 },
        },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          '%=', { 'filename', separator = {  left = '', right = '' }, left_padding = 2, right_padding = 2 },
        },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {}
    }
  end,
}
