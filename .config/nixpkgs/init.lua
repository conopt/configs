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
vim.opt.termguicolors = true
vim.opt.guifont = 'FuraMono Nerd Font Mono:h14'
-- vim.api.nvim_set_var('g:neovide_input_macos_alt_is_meta', true)
-- vim.g.neovide_input_macos_alt_is_meta = false

-- Load plugins
require('telescope').setup()
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'papercolor_light',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {{'filename', path=3}},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

require('hop').setup()
-- require('nvim-tree').setup()

function alt(key)
  -- return command in macOS, meta in other platforms
  if vim.fn.has('macunix') then
    return string.format('<D-%s>', key)
  else
    return string.format('<M-%s>', key)
  end
end

-- Locating related key mappings
local hop = require('hop')
vim.keymap.set('', '<C-f>', hop.hint_words)
vim.keymap.set('', '<C-j>', hop.hint_lines)
vim.keymap.set('', '<F10>', '<C-o>')
vim.keymap.set('', '<F11>', '<C-i>')

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
vim.keymap.set('', '<F1>', tsb.find_files)

-- lcd on editing file
function OnBufWinEnter(arg)
  local Path = require('plenary.path')
  local path = Path:new(arg.match)
  if path:is_file() then
    vim.cmd(string.format('lcd %s', path:parent()))
  end
end

vim.api.nvim_clear_autocmds({event = "BufWinEnter"})
vim.api.nvim_create_autocmd("BufWinEnter", { callback = OnBufWinEnter })

-- tab title
require('tabline_framework').setup {
  -- Render function is resposible for generating content of tabline
  -- This is the place where you do your magic!
  render = function(f)
    f.make_tabs(function(info)
      f.add(' ')
      f.add(info.filename or '[-]')
      f.add(' ')
    end)
  end
}
