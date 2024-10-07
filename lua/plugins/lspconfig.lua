return {
  "neovim/nvim-lspconfig",
  cond = not vim.g.vscode,
  dependencies = {
    "yioneko/nvim-vtsls",
    -- eslint
    "jose-elias-alvarez/null-ls.nvim",
    "MunifTanjim/eslint.nvim",
  },
  cond = not vim.g.vscode,
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

    -- eslint
    --
    local null_ls = require("null-ls")
    local eslint = require("eslint")

    null_ls.setup()

    eslint.setup({
      bin = 'eslint', -- or `eslint_d`
      code_actions = {
        enable = true,
        apply_on_save = {
          enable = true,
          types = { "directive", "problem", "suggestion", "layout" },
        },
        disable_rule_comment = {
          enable = true,
          location = "separate_line", -- or `same_line`
        },
      },
      diagnostics = {
        enable = true,
        report_unused_disable_directives = true,
        run_on = "type", -- or `save`
      },
    })

  end,
}
