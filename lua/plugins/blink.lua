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
        preselect = true,
        auto_insert = true,
      },
    },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 1000,
    },
  },
  cmdline = {
    keymap = {
      -- Übernimmt den ersten Vorschlag UND führt den Befehl aus:
      ["<CR>"] = { "select_accept_and_enter", "fallback" },

      -- ODER: Übernimmt den Vorschlag nur in die Zeile (ohne Ausführung):
      -- ["<CR>"] = { "select_and_accept", "fallback" },
    },
  },
})
