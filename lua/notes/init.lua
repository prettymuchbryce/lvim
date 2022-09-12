local api = vim.api
local NOTE_DIR = "/Users/bryce/notes"
local NOTE_HOME = "/Users/bryce/notes/README.md"

local template = [[
---
title: %s
date: %s
---

]]

function open_notes()
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

function new_note()
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

function show_ui()
  local Split = require("nui.split")
  local event = require("nui.utils.autocmd").event

  local split = Split({
    relative = "editor",
    position = "bottom",
    size = "20%",
  })

  -- mount/open the component
  split:mount()

  -- unmount component when cursor leaves buffer
  split:on(event.BufLeave, function()
    split:unmount()
  end)

  --  local items = ["x"]
  local buf = api.nvim_win_get_buf(split.bufnr)
  vim.api.nvim_buf_set_lines(buf, -1, -1, true, {"abc", "def"})
end


vim.cmd [[
  command! NewNote lua new_note()
  command! OpenNotes lua open_notes()
  command! Showy lua show_ui()
]]
