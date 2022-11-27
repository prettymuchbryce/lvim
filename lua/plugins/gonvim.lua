local GoNvim = {}

GoNvim.config = function()
  vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)
  require("go").setup()
end

return GoNvim
