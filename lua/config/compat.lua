-- Translates the legacy vim.validate{<table>} form into the new
-- vim.validate(name, value, validator, optional) calls so MunifTanjim/eslint.nvim
-- (which still uses the old API) doesn't trigger the Nvim 1.0 deprecation warning.

local original_validate = vim.validate

vim.validate = function(...)
  if select("#", ...) == 1 then
    local spec = select(1, ...)
    if type(spec) == "table" then
      for name, entry in pairs(spec) do
        if type(entry) == "table" then
          original_validate(name, entry[1], entry[2], entry[3])
        else
          return original_validate(...)
        end
      end
      return
    end
  end
  return original_validate(...)
end
