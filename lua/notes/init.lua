local api = vim.api
local NOTE_DIR = "/Users/bryce/notes"
local NOTE_HOME = "/Users/bryce/notes/README.md"

local template = [[
---
title: %s
date: %s
---

]]

local timestamp_enabled = false

function OpenNotes()
  -- Change directory to notes
  vim.cmd("cd " .. NOTE_DIR)

  -- Open file in buffer
  vim.cmd("edit " .. vim.fn.fnameescape(NOTE_HOME))

  -- Open nvimtree
  vim.cmd("NvimTreeOpen")

  -- Select the file buffer (NvimTreeOpen changes the current window)
  local tabpage = api.nvim_get_current_tabpage()
  local win_ids = api.nvim_tabpage_list_wins(tabpage)
  for _, id in ipairs(win_ids) do
    if NOTE_HOME == api.nvim_buf_get_name(api.nvim_win_get_buf(id)) then
      -- if mode == "preview" then return end
      api.nvim_set_current_win(id)
      break
    end
  end
end

function NewNote()
  local name = vim.fn.input("Note Name: ")
  local current_date = os.date("%Y-%m-%d")
  local filename = string.format("%s/%s-%s.md", NOTE_DIR, current_date, name)
  local hydrated_template = string.format(template, name, current_date)
  local file = io.open(filename, "w")
  -- Write new note file
  file:write(hydrated_template)
  file:close()

  -- Change directory to notes
  vim.cmd("cd " .. NOTE_DIR)

  -- Open file in buffer
  vim.cmd("edit " .. vim.fn.fnameescape(filename))

  -- Open nvimtree
  vim.cmd("NvimTreeOpen")

  -- Select the file buffer (NvimTreeOpen changes the current window)
  local tabpage = api.nvim_get_current_tabpage()
  local win_ids = api.nvim_tabpage_list_wins(tabpage)
  for _, id in ipairs(win_ids) do
    if filename == api.nvim_buf_get_name(api.nvim_win_get_buf(id)) then
      -- if mode == "preview" then return end
      api.nvim_set_current_win(id)
      break
    end
  end

  -- Go to end of file
  vim.cmd("$")

  -- Insert mode
  vim.cmd("startinsert")
end

function InsertTimestamp()
  if timestamp_enabled and api.nvim_get_mode().mode == "i" then
    local current_line = api.nvim_get_current_line()
    -- Check length of current line
    if #current_line == 1 then
      local timestamp = tostring(os.date("%I:%M %p"))

      -- Move cursor to beginning of line
      api.nvim_command("normal! 0")

      -- Insert timestamp at the begining of the line and move cursor to end of the line
      api.nvim_put({ timestamp }, "c", false, true)

      -- Insert a separator in the form " – "
      api.nvim_put({ " – " }, "c", false, true)

      -- Start inserting at the very end of the current line using `nvim_call_function` with 'cursor'
      local cursor_pos = api.nvim_win_get_cursor(0)
      local line = cursor_pos[1]
      local col = cursor_pos[2]
      api.nvim_call_function('cursor', { line, col + 2 })
    end
  end
end

api.nvim_command("augroup timestamp")
api.nvim_command("autocmd!")
api.nvim_command("autocmd CursorMovedI * lua InsertTimestamp()")
api.nvim_command("augroup END")

function ToggleTimestampMode()
  timestamp_enabled = not timestamp_enabled
end

vim.cmd [[
  command! ToggleTimestampMode lua ToggleTimestampMode()
  command! NewNote lua NewNote()
  command! OpenNotes lua OpenNotes()
]]
