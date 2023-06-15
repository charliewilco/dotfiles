vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_winsize = 30


local function set_rebindings()
  local map_command = "<Esc>:Lex<CR>"
  vim.api.nvim_set_keymap('n', '<Leader>t', map_command, { noremap = true, silent = true })
end

set_rebindings()
