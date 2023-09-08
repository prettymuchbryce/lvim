local Treesitter = {}

Treesitter.config = function()
  if not lvim.builtin.treesitter.active then
    return
  end

  -- if you don't want all the parsers change this to a table of the ones you want
  lvim.builtin.treesitter.ensure_installed = {
    "norg",
    "norg_meta",
    "norg_table",
    "javascript",
    "typescript",
    "rust",
    "go",
    "lua",
    "yaml",
    "make",
    "markdown",
    "markdown_inline"
  }

  lvim.builtin.treesitter.ignore_install = {
    "haskell",
    "rome",
    "angularls",
    "ember",
    "denols",
    "ansiblels"
  }
end

return Treesitter
