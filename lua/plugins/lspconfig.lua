return {
  "neovim/nvim-lspconfig",
  cond = not vim.g.vscode,

  dependencies = {
    "yioneko/nvim-vtsls",
    -- eslint & prettier
    "jose-elias-alvarez/null-ls.nvim",
    "MunifTanjim/eslint.nvim",
    "MunifTanjim/prettier.nvim",
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

    -- eslint & prettier
    --
    local null_ls = require("null-ls")
    local eslint = require("eslint")
    local prettier = require("prettier")

    null_ls.setup({
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/rangeFormatting") then
          vim.keymap.set("x", "<Leader>f", function()
            vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
          end, { buffer = bufnr, desc = "[lsp] format" })
        end
      end,
    })

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

    prettier.setup({
      bin = 'prettier', -- or `'prettierd'` (v0.23.3+)
      filetypes = {
        "css",
        "graphql",
        "html",
        "javascript",
        "javascriptreact",
        "json",
        "less",
        "markdown",
        "scss",
        "typescript",
        "typescriptreact",
        "yaml",
      },
      cli_options = {
        arrow_parens = "always",
        bracket_spacing = false,
        -- bracket_same_line = false,
        -- embedded_language_formatting = "auto",
        end_of_line = "lf",
        -- html_whitespace_sensitivity = "css",
        -- jsx_bracket_same_line = false,
        -- jsx_single_quote = false,
        -- print_width = 80,
        -- prose_wrap = "preserve",
        -- quote_props = "as-needed",
        -- semi = true,
        -- single_attribute_per_line = false,
        -- single_quote = false,
        tab_width = 2,
        trailing_comma = "es5",
        use_tabs = false,
        -- vue_indent_script_and_style = false,
      },
    })

  end,
}
