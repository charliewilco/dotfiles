if os.getenv('theme') == 'light' then
	vim.api.nvim_set_option('background', 'light')
else
	vim.api.nvim_set_option('background', 'dark')
end


-- auto_dark_mode.setup({
-- 	update_interval = 3000,
-- 	set_dark_mode = function()
-- 		vim.api.nvim_set_option('background', 'dark')
-- 	end,
-- 	set_light_mode = function()
-- 		vim.api.nvim_set_option('background', 'light')
-- 	end,
-- })
-- auto_dark_mode.init()




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

require("tokyonight").setup({
	-- your configuration comes here
	-- or leave it empty to use the default settings
	style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
	transparent = true, -- Enable this to disable setting the background color
	terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
	styles = {
		-- Style to be applied to different syntax groups
		-- Value is any valid attr-list value for `:help nvim_set_hl`
		comments = { italic = true },
		keywords = { italic = true },
		functions = {},
		variables = {},
		-- Background styles. Can be "dark", "transparent" or "normal"
		sidebars = "dark", -- style for sidebars, see below
		floats = "dark", -- style for floating windows
	},
	sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
	day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
	hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
	dim_inactive = false, -- dims inactive windows
	lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

	--- You can override specific color groups to use other groups or a hex color
	--- function will be called with a ColorScheme table
	---@param colors ColorScheme
	on_colors = function(colors) end,

	--- You can override specific highlights to use other groups or a hex color
	--- function will be called with a Highlights and ColorScheme table
	---@param highlights Highlights
	---@param colors ColorScheme
	on_highlights = function(highlights, colors) end,
})

vim.opt.termguicolors = true
vim.api.nvim_set_option('background', 'dark')
vim.cmd.colorscheme('tokyonight')

function ColorMyPencils(color)
	color = color or 'tokyonight'
	vim.cmd.colorscheme(color)
	vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
	vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })

end

ColorMyPencils()


