-- Format buffer when buffer/file is saved
lvim.format_on_save = true

-- Lint buffer when buffer/file is saved
lvim.lint_on_save = true

-- Leader key
lvim.leader = "space"

-- Keymap timeout
vim.opt.timeoutlen = 100

-- Relative row numbers
vim.opt.relativenumber = true

-- Debug LunarVim
lvim.debug = false

-- Enable Dashboard and Terminal
lvim.builtin.alpha.active = true
lvim.builtin.terminal.active = true

-- Specify languages allowed in markdown code blocks
vim.g.markdown_fenced_languages = { "javascript", "rust", "typescript", "sh", "go" }

-- Temporary until bufferline fixes this
lvim.builtin.bufferline.options.indicator_icon = nil
lvim.builtin.bufferline.options.indicator = { style = "icon", icon = "▎" }

-- Set dotenv type
vim.cmd[[ au BufRead,BufNewFile *.env set filetype=dotenv ]]
