return {
  "rcarriga/nvim-notify",

  cond = not vim.g.vscode,

  lazy = false,
  priority = 1000,

  config = function()
    -- vim.notify = require("notify")
    local _notify = require("notify")

    vim.notify = function(msg, ...)
      if msg:match("position_encoding param is required in vim.lsp.util.make_position_params.") then
        return
      end

      if msg:match("warning: multiple different client offset_encodings") then
        return
      end

      _notify(msg, ...)
    end

    -- require("notify").setup({
    --   background_colour = "#000000",
    --   stages = "fade_in_slide_out",
    --   timeout = 3000,
    --   max_width = 80,
    --   max_height = 20,
    -- })
  end,
}
