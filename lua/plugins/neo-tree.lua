require("neo-tree").setup({
  use_libuv_file_watcher = true,
  position = "right",
  window = {
    mappings = {
      ["P"] = {
        "toggle_preview",
        config = {
          use_float = false,
          -- use_image_nvim = true,
          -- use_snacks_image = true,
          -- title = 'Neo-tree Preview',
        },
      },
    },
  },
})
