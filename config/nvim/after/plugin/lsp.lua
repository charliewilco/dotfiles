
local lsp = require('lsp-zero').preset({
	name = 'minimal',
	set_lsp_keymaps = true,
	manage_nvim_cmp = true,
	suggest_lsp_servers = false,
})

-- When you don't have mason.nvim installed
-- You'll need to list the servers installed in your system
lsp.setup_servers({ 'graphql', 'eslint', 'lua_ls', 'rust_analyzer', 'tailwindcss', 'tsserver', 'prismals' })

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()
