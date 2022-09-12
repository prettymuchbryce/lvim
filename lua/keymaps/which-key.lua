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
  n = { "<cmd>NewNote<cr>", "Create a new note" },
  o = { "<cmd>OpenNotes<cr>", "Open notes" },
}

-- Build Go Files
lvim.builtin.which_key.mappings["G"] = {
  name = "Go commands",
  b = { "<cmd>GoBuild<cr>", "Build Go files" },
  r = { "<cmd>GoReferrers<cr>", "Go Referrers" },
  i = { "<cmd>GoImplements<cr>", "Go Implements" },
}
