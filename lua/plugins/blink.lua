local cmp = require('blink.cmp')
cmp.build():wait(60000)
cmp.setup({
  -- See :h blink-cmp-config-keymap for defining your own keymap
  keymap = { preset = 'super-tab' },

  appearance = {
    -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
    -- Adjusts spacing to ensure icons are aligned
    nerd_font_variant = 'mono'
  },
})
