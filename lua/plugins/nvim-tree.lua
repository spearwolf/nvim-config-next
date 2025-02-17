return {
  "nvim-tree/nvim-tree.lua",
  cond = not vim.g.vscode,
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  -- opts = {},
  config = function()
    local nvimtree = require("nvim-tree")

    -- custom on attach function to remove some default mappings and add custom ones
    local function my_on_attach(bufnr)
      local api = require("nvim-tree.api")

      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      -- default mappings
      api.config.mappings.default_on_attach(bufnr)

      -- add custom key mapping to search in directory with grug-far
      -- local lib = require("nvim-tree.lib")
      --
      -- vim.keymap.set("n", "z", function()
      --   local node = lib.get_node_at_cursor()
      --   local grugFar = require("grug-far")
      --   if node then
      --     -- get directory of current file if it's a file
      --     local path
      --     if node.type == "directory" then
      --       -- Keep the full path for directories
      --       path = node.absolute_path
      --     else
      --       -- Get the directory of the file
      --       path = vim.fn.fnamemodify(node.absolute_path, ":h")
      --     end
      --
      --     -- escape all spaces in the path with "\ "
      --     path = path:gsub(" ", "\\ ")
      --
      --     local prefills = {
      --       paths = path,
      --     }
      --
      --     -- instance check
      --     if not grugFar.has_instance("tree") then
      --       grugFar.grug_far({
      --         instanceName = "tree",
      --         prefills = prefills,
      --         staticTitle = "Find and Replace from Tree",
      --       })
      --     else
      --       grugFar.open_instance("tree")
      --       -- updating the prefills without clearing the search and other fields
      --       grugFar.update_instance_prefills("tree", prefills, false)
      --     end
      --   end
      -- end, opts("Search in directory"))
    end

    -- https://github.com/nvim-tree/nvim-tree.lua/blob/master/lua/nvim-tree.lua#L342
    nvimtree.setup({
      on_attach = my_on_attach,
      -- rest of your config
      sort = {
        sorter = "case_sensitive",
      },
      view = {
        width = 30,
      },
      filters = {
        dotfiles = true,
      },
    })
  end,
}
