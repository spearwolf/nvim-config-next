function get_hostname()
  -- Holt den Hostnamen direkt vom System (funktioniert auf Linux, macOS und Windows)
  local name = vim.uv.os_gethostname()

  -- Falls du nur den Teil vor dem ersten Punkt willst (Short Hostname):
  return name:match("^([^.]+)")
end
