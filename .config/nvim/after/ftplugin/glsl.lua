vim.keymap.set("n", "gh", function()
  local current_file = vim.api.nvim_buf_get_name(0)
  if current_file == "" then return end

  local uv = vim.loop
  local path = vim.fn.fnamemodify(current_file, ":p")
  local dir = vim.fn.fnamemodify(path, ":h")
  local basename = vim.fn.fnamemodify(path, ":t:r")
  local ext = vim.fn.fnamemodify(path, ":e")

  local alt_ext = nil
  if ext == "vert" then
    alt_ext = "frag"
  elseif ext == "frag" then
    alt_ext = "vert"
  else
    print("Not a .vert or .frag file.")
    return
  end

  local alt_file = dir .. "/" .. basename .. "." .. alt_ext
  if uv.fs_stat(alt_file) then
    vim.cmd("edit " .. alt_file)
  else
    print("Alternate file not found: " .. alt_file)
  end
end, { desc = "Switch between .vert and .frag", buffer = true })
