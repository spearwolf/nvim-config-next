return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "yioneko/nvim-vtsls",
  },
  config = function () 
    require("lspconfig.configs").vtsls = require("vtsls").lspconfig -- set default server config, optional but recommended
    require("lspconfig").vtsls.setup{
      settings = {
        typescript = {
          inlayHints = {
            parameterNames = { enabled = "literals" },
            parameterTypes = { enabled = true },
            variableTypes = { enabled = true },
            propertyDeclarationTypes = { enabled = true },
            functionLikeReturnTypes = { enabled = true },
            enumMemberValues = { enabled = true },
          }
        },
      }
    }
    vim.lsp.commands["editor.action.showReferences"] = function(command, ctx)
      local locations = command.arguments[3]
      local client = vim.lsp.get_client_by_id(ctx.client_id)
      if locations and #locations > 0 then
        local items = vim.lsp.util.locations_to_items(locations, client.offset_encoding)
        vim.fn.setloclist(0, {}, " ", { title = "References", items = items, context = ctx })
        vim.api.nvim_command("lopen")
      end
    end
  end,
}
