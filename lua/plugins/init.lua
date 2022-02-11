-- ==================
-- LunarVim built-in
-- ==================
--
-- Dasboard
require("plugins.dashboard").config()
-- Nvim-tree
require("plugins.nvim-tree").config()
-- Treesitter
require("plugins.treesitter").config()


--
-- ==================
-- Additional plugins
-- ==================
--
lvim.plugins = {
  --
  -- Debug
  --

  --
  -- Diagnostics
  --
  {
    "ray-x/lsp_signature.nvim",
    event = "InsertEnter",
    config = function()
      require("lsp_signature").setup()
    end,
  },
  --
  -- Navigation
  --
  {
    "tpope/vim-surround"
  },
  --
  -- Language-specific plugins
  --
  {
    "leafgarland/typescript-vim"
  },
  {
    "simrat39/rust-tools.nvim",
    config = function()
      require("rust-tools").setup({})
    end,
  },

  --
  -- Git
  --
  {
    "ruifm/gitlinker.nvim",
    event = "BufRead",
    config = function()
      require("plugins.gitlinker").config()
    end,
    requires = "nvim-lua/plenary.nvim",
  },
  --
  -- Themes
  --
  {
    "folke/tokyonight.nvim",
    config = function()
      require("themes.tokyonight").config()
    end,
  },
}
