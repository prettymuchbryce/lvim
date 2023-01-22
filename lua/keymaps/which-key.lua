-- Which-key: +Git
lvim.builtin.which_key.mappings["gy"] = { "<cmd>lua require('gitlinker').get_buf_range_url('n')<cr>", "Gitlinker" }

-- Which-key: +Terminal
lvim.builtin.which_key.mappings["t"] = {
  name = "+Terminal",
  b = { "<cmd>split term://zsh<cr>", "Terminal to below" },
  r = { "<cmd>vsplit term://zsh<cr>", "Terminal to right" },
}

-- Which-key: +Notes
lvim.builtin.which_key.mappings["N"] = {
  name = "+Notes",
  t = { "<cmd>ToggleTimestampMode<cr>", "Toggle timestamp mode" },
  n = { "<cmd>NewNote<cr>", "Create a new note" },
  o = { "<cmd>OpenNotes<cr>", "Open notes" },
}
