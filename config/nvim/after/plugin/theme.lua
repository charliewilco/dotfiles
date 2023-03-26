local auto_dark_mode = require('auto-dark-mode')

vim.api.nvim_set_option('background', 'dark')

if os.getenv('theme') == 'light' then
	vim.api.nvim_set_option('background', 'light')
else
	vim.api.nvim_set_option('background', 'dark')
end


function ColorMyPencils(color)
	color = color or 'rose-pine'
	vim.cmd.colorscheme(color)
	vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
	vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })

end

ColorMyPencils()

require('rose-pine').setup({
	--- @usage 'main' | 'moon'
	dark_variant = 'main',
	bold_vert_split = false,
	dim_nc_background = false,
	disable_background = true,
	disable_float_background = false,
	disable_italics = false,

	--- @usage string hex value or named color from rosepinetheme.com/palette
	groups = {
		background = 'base',
		panel = 'surface',
		border = 'highlight_med',
		comment = 'muted',
		link = 'iris',
		punctuation = 'subtle',

		error = 'love',
		hint = 'iris',
		info = 'foam',
		warn = 'gold',

		headings = {
			h1 = 'iris',
			h2 = 'foam',
			h3 = 'rose',
			h4 = 'gold',
			h5 = 'pine',
			h6 = 'foam',
		}
		-- or set all headings at once
		-- headings = 'subtle'
	},

	-- Change specific vim highlight groups
	highlight_groups = {
		ColorColumn = { bg = 'rose' }
	}
})

auto_dark_mode.setup({
	update_interval = 3000,
	set_dark_mode = function()
		vim.api.nvim_set_option('background', 'dark')
	end,
	set_light_mode = function()
		vim.api.nvim_set_option('background', 'light')
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
