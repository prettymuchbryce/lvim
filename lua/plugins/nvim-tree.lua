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
  lvim.builtin.nvimtree.setup.view.relativenumber = true
  lvim.builtin.nvimtree.setup.filters.custom = {}

  -- Open nvimtree by default
  local function open_nvim_tree()
    -- open the tree
    require("nvim-tree.api").tree.open()
  end
  vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
end

return NvimTree
