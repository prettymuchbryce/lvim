local Telescope = {}

Telescope.config = function()
  if not lvim.builtin.telescope.active then
    return
  end

  lvim.builtin.telescope.extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    },
  }
  lvim.builtin.telescope.on_config_done = function()
    -- Use fzf for better performance
    require("telescope").load_extension "fzf"
  end
  lvim.builtin.telescope.defaults.layout_strategy = "horizontal"
  lvim.builtin.telescope.defaults.layout_config.preview_cutoff = 80
  lvim.builtin.telescope.defaults.layout_config.width = 0.95
  local actions = require "telescope.actions"
  local mappings = {
    i = {
      ["<C-k>"] = actions.move_selection_next,
      ["<C-l>"] = actions.move_selection_previous,
      ["<C-x>"] = actions.close,
      ["<C-n>"] = actions.cycle_history_next,
      ["<C-p>"] = actions.cycle_history_prev,
      ["<CR>"] = actions.select_default + actions.center,
    },
    n = {
      ["<C-k>"] = actions.move_selection_next,
      ["<C-l>"] = actions.move_selection_previous,
      ["<C-n>"] = actions.cycle_history_next,
      ["<C-p>"] = actions.cycle_history_prev,
    },
  }
  lvim.builtin.telescope.defaults.mappings = mappings
end

return Telescope
