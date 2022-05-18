local NvimTree = {}

NvimTree.config = function()
  if not lvim.builtin.nvimtree.active then
    return
  end

  lvim.builtin.nvimtree.show_icons.git = 1
  lvim.builtin.nvimtree.setup.view.side = "left"
  lvim.builtin.nvimtree.setup.view.width = 40
  lvim.builtin.nvimtree.setup.view.auto_resize = true
  lvim.builtin.nvimtree.setup.git.ignore = false
  lvim.builtin.nvimtree.setup.actions.open_file.resize_window = true
end

return NvimTree
