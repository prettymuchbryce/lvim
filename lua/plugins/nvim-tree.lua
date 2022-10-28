local NvimTree = {}

NvimTree.config = function()
  if not lvim.builtin.nvimtree.active then
    return
  end

  lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
  lvim.builtin.nvimtree.setup.view.side = "left"
  lvim.builtin.nvimtree.setup.view.width = 40
  lvim.builtin.nvimtree.setup.git.ignore = false
  lvim.builtin.nvimtree.setup.actions.open_file.resize_window = true

  -- Open nvimtree by default
  lvim.builtin.nvimtree.setup.open_on_setup_file = true
  lvim.builtin.nvimtree.setup.open_on_setup = true
end

return NvimTree
