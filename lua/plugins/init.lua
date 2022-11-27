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
  -- Plugin Development
  --
  {
    "MunifTanjim/nui.nvim"
  },
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
  {
    "ray-x/go.nvim",
    requires = "ray-x/guihua.lua",
    config = function()
      require("gonvim").config()
    end,
  },
  {
    "hashivim/vim-terraform",
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
  {
    "jghauser/follow-md-links.nvim"
  }
}
