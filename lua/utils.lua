function hostname()
  local cmd = io.popen ("/bin/hostname")
  local hostname = cmd:read("*a") or ""
  cmd:close()
  hostname = string.gsub(hostname, "\n$", "")
  return hostname
end
