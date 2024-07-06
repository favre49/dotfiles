-- Comment strings
local comment_strings = {
  lua = '--',
  python = '#',
  javascript = '//',
  typescript = '//',
  cpp = '//',
  c = '//',
  rust = '//',
}

-- Function that inserts a laindoc comment.
function insert_laindoc_comment(above)
  -- Get the current line number
  local line = vim.api.nvim_win_get_cursor(0)[1]
  local current_line = vim.api.nvim_buf_get_lines(0, line - 1, line, false)[1]

  -- Get the current filetype
  local ft = vim.bo.filetype

  local comment_str = comment_strings[ft] or '#'
  local indentation = current_line:match("^%s*")
  local comment_line = indentation .. comment_str .. ' laindoc: '

  if above then
    vim.api.nvim_buf_set_lines(0, line-1, line-1, false, {comment_line})
  else
    vim.api.nvim_buf_set_lines(0, line, line, false, {comment_line})
  end

  local new_line = above and line or line + 1
  local column = #comment_line
  vim.api.nvim_win_set_cursor(0, {new_line, column})

  vim.cmd('startinsert!')
end

-- Function that clears all laindoc comments
function clear_laindoc_comments()
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local filetype = vim.bo.filetype
  local comment_str = comment_strings[filetype] or '#'
  local pattern = "^%s*" .. vim.pesc(comment_str) .. "%s*laindoc:"
  local new_lines = {}
  local removed = 0
  for _, line in ipairs(lines) do
    if not line:match(pattern) then
      table.insert(new_lines, line)
    else
      removed = removed + 1
    end
  end
  vim.api.nvim_buf_set_lines(0, 0, -1, false, new_lines)
  print(removed .. " laindoc comment" .. (removed == 1 and "" or "s") .. " removed.")
end

-- Create the ClearLaindoc command
vim.api.nvim_create_user_command('ClearLaindoc', function()
  clear_laindoc_comments()
end, {})


