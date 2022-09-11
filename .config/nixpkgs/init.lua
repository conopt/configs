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

vim.api.nvim_set_keymap('n', '<D-c>', '"+y', {noremap = true})
vim.api.nvim_set_keymap('v', '<D-c>', '"+y', {noremap = true})
vim.api.nvim_set_keymap('n', '<D-v>', '"+p', {noremap = true})
vim.api.nvim_set_keymap('i', '<D-v>', '<C-r>+', {noremap = true})
vim.api.nvim_set_keymap('c', '<D-v>', '<C-r>+', {noremap = true})

vim.api.nvim_set_keymap('', '<D-t>', ':tabnew<CR>', {noremap = true})
vim.api.nvim_set_keymap('', '<D-w>', ':tabclose<CR>', {noremap = true})
vim.api.nvim_set_keymap('', '<D-1>', '1gt', {noremap = true})
vim.api.nvim_set_keymap('', '<D-2>', '2gt', {noremap = true})
vim.api.nvim_set_keymap('', '<D-3>', '3gt', {noremap = true})

-- local packer = require('packer')
-- local use = packer.use

-- use {
--   'nvim-telescope/telescope.nvim', tag = '0.1.0',
--   requires = { {'nvim-lua/plenary.nvim'} }
-- }
-- 
-- use {
--   'nvim-lualine/lualine.nvim',
--   requires = { 'kyazdani42/nvim-web-devicons', opt = true }
-- }

require('hop').setup()
require('telescope').setup()
require('nvim-tree').setup()
-- require('feline').setup()
require('lualine').setup {
  options = {
    theme = 'PaperColor'
  }
}
-- require('lualine').setup {
--   options = {
--     icons_enabled = true,
--     theme = 'auto',
--     component_separators = { left = '', right = ''},
--     section_separators = { left = '', right = ''},
--     disabled_filetypes = {
--       statusline = {},
--       winbar = {},
--     },
--     ignore_focus = {},
--     always_divide_middle = true,
--     globalstatus = false,
--     refresh = {
--       statusline = 1000,
--       tabline = 1000,
--       winbar = 1000,
--     }
--   },
--   sections = {
--     lualine_a = {'mode'},
--     lualine_b = {'branch', 'diff', 'diagnostics'},
--     lualine_c = {'filename'},
--     lualine_x = {'encoding', 'fileformat', 'filetype'},
--     lualine_y = {'progress'},
--     lualine_z = {'location'}
--   },
--   inactive_sections = {
--     lualine_a = {},
--     lualine_b = {},
--     lualine_c = {'filename'},
--     lualine_x = {'location'},
--     lualine_y = {},
--     lualine_z = {}
--   },
--   tabline = {},
--   winbar = {},
--   inactive_winbar = {},
--   extensions = {}
-- }
