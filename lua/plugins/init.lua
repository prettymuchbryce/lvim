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
  -- Utils
  --
  {
    "Bryley/neoai.nvim",
    require = { "MunifTanjim/nui.nvim" },
    cmd = {
      "NeoAI",
      "NeoAIOpen",
      "NeoAIClose",
      "NeoAIToggle",
      "NeoAIContext",
      "NeoAIContextOpen",
      "NeoAIContextClose",
      "NeoAIInject",
      "NeoAIInjectCode",
      "NeoAIInjectContext",
      "NeoAIInjectContextCode",
    },
    config = function()
      require("neoai").setup({
        models = {
          {
            name = "openai",
            model = "gpt-4",
            params = nil
          }
        },
      })
    end,
  },
  {
    "michaelb/sniprun",
    -- FYI https://github.com/michaelb/sniprun/issues/180#issuecomment-1262698648
    build = 'sh ./install.sh'
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
  {
    "Mofiqul/vscode.nvim",
    config = function()
      require("vscode").load('dark')
    end,
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
