-- Basic settings
vim.opt.number = true
vim.opt.smartindent = true

vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true

vim.opt.cursorline = true

vim.opt.visualbell = true
vim.opt.errorbells = false

vim.opt.background = 'dark'
vim.cmd[[colorscheme PaperColor]]
vim.g.airline_theme = 'papercolor'
vim.opt.termguicolors = true

-- Load plugins
require('telescope').setup()
require('lualine').setup {
  options = {
    theme = 'PaperColor'
  }
}
require('hop').setup()
require('nvim-tree').setup()

function alt(key)
  -- return command in macOS, meta in other platforms
  return string.format('<D-%s>', key)
end

-- Locating related key mappings
local hop = require('hop')
vim.keymap.set('', '<C-f>', hop.hint_words)
vim.keymap.set('', '<C-j>', hop.hint_lines)

-- macOS related copy/paste key mappings
vim.keymap.set('n', alt('c'), '"+y')
vim.keymap.set('v', alt('c'), '"+y')
vim.keymap.set('n', alt('v'), '"+p')
vim.keymap.set('i', alt('v'), '<C-r>+')
vim.keymap.set('c', alt('v'), '<C-r>+')

-- Tab navigation key mappings
vim.keymap.set('', alt('t'), ':tabnew<CR>')
vim.keymap.set('', alt('w'), ':tabclose<CR>')
for i = 1,9 do
  vim.keymap.set('', alt(i), i .. 'gt')
end

-- Telescope key mappings
local tsb = require('telescope.builtin');
vim.keymap.set('', '<F8>', tsb.grep_string)
vim.keymap.set('', '<S-F8>', tsb.live_grep)
vim.keymap.set('', '<F2>', tsb.find_files)
