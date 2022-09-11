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

-- macOS related copy/paste key mappings
vim.keymap.set('n', '<D-c>', '"+y')
vim.keymap.set('v', '<D-c>', '"+y')
vim.keymap.set('n', '<D-v>', '"+p')
vim.keymap.set('i', '<D-v>', '<C-r>+')
vim.keymap.set('c', '<D-v>', '<C-r>+')

-- Tab navigation key mappings
vim.keymap.set('', '<D-t>', ':tabnew<CR>')
vim.keymap.set('', '<D-w>', ':tabclose<CR>')
for i = 1,9 do
  vim.keymap.set('', string.format('<D-%d>', i), i .. 'gt')
end

-- Telescope key mappings
require('telescope').setup()
local tsb = require('telescope.builtin');
vim.keymap.set('', '<F8>', tsb.grep_string)
vim.keymap.set('', '<S-F8>', tsb.live_grep)
vim.keymap.set('', '<F2>', tsb.find_files)

require('lualine').setup {
  options = {
    theme = 'PaperColor'
  }
}

require('hop').setup()
require('nvim-tree').setup()
