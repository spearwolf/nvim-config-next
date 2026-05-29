local cmp = require("blink.cmp")
-- cmp.build():wait(60000)
cmp.setup({
  -- See :h blink-cmp-config-keymap for defining your own keymap
  keymap = {
    preset = "enter", -- "super-tab",
    ["<Tab>"] = false,
    ["<S-Tab>"] = false,
  },

  appearance = {
    -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
    -- Adjusts spacing to ensure icons are aligned
    nerd_font_variant = "mono",
  },

  -- https://main.cmp.saghen.dev/configuration/completion.html
  completion = {
    list = {
      selection = {
        preselect = false,
        auto_insert = false,
      },
    },
  },
})
