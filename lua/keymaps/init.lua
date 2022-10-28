-- Configure which-key plugin keymaps
require "keymaps.which-key"

-- Ergonomic navigation
lvim.keys.normal_mode["j"] = "h"
lvim.keys.normal_mode["k"] = "j"
lvim.keys.normal_mode["l"] = "k"
lvim.keys.normal_mode[";"] = "l"
lvim.keys.visual_mode["j"] = "h"
lvim.keys.visual_mode["k"] = "j"
lvim.keys.visual_mode["l"] = "k"
lvim.keys.visual_mode[";"] = "l"
lvim.keys.normal_mode["<C-w>j"] = "<C-w>h"
lvim.keys.normal_mode["<C-w>k"] = "<C-w>j"
lvim.keys.normal_mode["<C-w>l"] = "<C-w>k"
lvim.keys.normal_mode["<C-w>;"] = "<C-w>l"
lvim.keys.normal_mode["<C-l>"] = ":bprevious<CR>"
lvim.keys.normal_mode["<C-k>"] = ":bnext<CR>"
vim.keymap.set("i", "kj", "<ESC>", { silent = true })

-- These don't work for some reason. Shifting text in visual mode.
-- lvim.keys.visual_mode["<shift-j>"] = "<shift-h>"
-- lvim.keys.visual_mode["<shift-k>"] = "<shift-j>"
-- lvim.keys.visual_mode["<shift-l>"] = "<shift-k>"
-- lvim.keys.visual_mode["<shift-;>"] = "<shift-l>"

-- Close buffer
lvim.keys.normal_mode["<C-x>"] = ":bp|bd #<CR>"

-- Open current file in nvimtree
lvim.keys.normal_mode["<C-H>"] = ":NvimTreeFindFile<CR>"

-- Open nvimtree
lvim.keys.normal_mode["<C-n>"] = ":NvimTreeToggle<CR>"

-- Find file in telescope
lvim.keys.normal_mode["<C-p>"] = ":Telescope find_files<CR>"

-- Grep through all files in telescope
lvim.keys.normal_mode["<C-f>"] = ":Telescope live_grep<CR>"

-- nvim-tree mappings
local tree_cb = require("nvim-tree.config").nvim_tree_callback
lvim.builtin.nvimtree.setup.view.mappings.list = {
  { key = { "<CR>", "o", "<2-LeftMouse>" }, cb = tree_cb("edit") },
  { key = { "<2-RightMouse>", "<C-]>" }, cb = tree_cb("cd") },
  { key = "<C-v>", cb = tree_cb("vsplit") },
  { key = "<C-x>", cb = tree_cb("split") },
  { key = "<C-t>", cb = tree_cb("tabnew") },
  { key = "<", cb = tree_cb("prev_sibling") },
  { key = ">", cb = tree_cb("next_sibling") },
  { key = "P", cb = tree_cb("parent_node") },
  { key = "<BS>", cb = tree_cb("close_node") },
  { key = "<S-CR>", cb = tree_cb("close_node") },
  { key = "<Tab>", cb = tree_cb("preview") },
  { key = "K", cb = tree_cb("first_sibling") },
  { key = "J", cb = tree_cb("last_sibling") },
  { key = "I", cb = tree_cb("toggle_ignored") },
  { key = "H", cb = tree_cb("toggle_dotfiles") },
  { key = "R", cb = tree_cb("refresh") },
  { key = "a", cb = tree_cb("create") },
  { key = "d", cb = tree_cb("remove") },
  { key = "r", cb = tree_cb("rename") },
  { key = "<C-r>", cb = tree_cb("full_rename") },
  { key = "x", cb = tree_cb("cut") },
  { key = "c", cb = tree_cb("copy") },
  { key = "p", cb = tree_cb("paste") },
  { key = "y", cb = tree_cb("copy_name") },
  { key = "Y", cb = tree_cb("copy_path") },
  { key = "gy", cb = tree_cb("copy_absolute_path") },
  { key = "[c", cb = tree_cb("prev_git_item") },
  { key = "]c", cb = tree_cb("next_git_item") },
  { key = "-", cb = tree_cb("dir_up") },
  { key = "s", cb = tree_cb("system_open") },
  { key = "q", cb = tree_cb("close") },
  { key = "g?", cb = tree_cb("toggle_help") },
}
