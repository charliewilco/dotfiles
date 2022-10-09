require('github-theme').setup {
  theme_style = 'light_default',
  function_style = 'italic',
  sidebars = {'qf', 'vista_kind', 'terminal', 'packer'},

  -- Change the "hint" color to the "orange" color, and make the "error" color bright red
  colors = {hint = 'orange', error = '#ff0000'},
}


local auto_dark_mode = require('auto-dark-mode')

vim.api.nvim_set_option('background', 'dark')
vim.cmd('colorscheme github_dark_default')

if os.getenv('theme') == 'light' then
  vim.api.nvim_set_option('background', 'light')
  vim.cmd('colorscheme github_light_default')
end

auto_dark_mode.setup({
  update_interval = 3000,
  set_dark_mode = function()
    vim.api.nvim_set_option('background', 'dark')
    vim.cmd('colorscheme github_dark_default')
  end,
  set_light_mode = function()
    vim.api.nvim_set_option('background', 'light')
    vim.cmd('colorscheme github_light_default')
  end,
})
auto_dark_mode.init()

-- Lualine
require('lualine').setup {
  options = {
    theme = 'auto',
    section_separators = '',
    component_separators = ''
  },
  tabline = {
    lualine_a = {'buffers'},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {'encoding'},
    lualine_y = {'progress'},
    lualine_z = {'tabs'}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'FugitiveHead', 'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  }
}

local hl = function(thing, opts)
  vim.api.nvim_set_hl(0, thing, opts)
end
