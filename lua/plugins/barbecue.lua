return {
  "utilyre/barbecue.nvim",
  name = "barbecue",
  version = "*",
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons", -- optional dependency
  },
  config = function()
    require("barbecue").setup{};
    require("barbecue.ui").toggle(true)

    local function toggle()
      require("barbecue.ui").toggle()
    end

    vim.keymap.set('n', '<F4>', toggle, {
      desc = 'Toggle barbecue ui'
    })
  end,
}
