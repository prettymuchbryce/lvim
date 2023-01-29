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
  {
    "github/copilot.vim",
  },
  {
    "MattesGroeger/vim-bookmarks",
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
    dependencies = {
      "ray-x/guihua.lua"
    },
    config = function()
      require("plugins.gonvim").config()
    end,
  },
  {
    "hashivim/vim-terraform",
  },
  {
    "jghauser/follow-md-links.nvim",
  },
  --
  -- Git
  --
  {
    "ruifm/gitlinker.nvim",
    event = "BufRead",
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
    config = function()
      require("plugins.gitlinker").config()
    end,
  },
}
