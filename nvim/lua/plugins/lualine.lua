return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
	-- ref: https://github.com/nvim-lualine/lualine.nvim?tab=readme-ov-file#default-configuration
	-- ref: setting example: https://github.com/daiki0381/dotfiles/blob/main/.config/nvim/after/plugin/lualine.rc.lua
        options = {
	    icons_enabled = true,
            theme = "iceberg_dark"
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch" },
		lualine_c = {
			{
				"filename",
				file_status = true,
				path = 0,
			},
		},
		lualine_x = {
			{
				"diagnostics",
				sources = { "nvim_diagnostic" },
				symbols = { error = " ", warn = " ", info = " ", hint = " " },
			},
			"encoding",
			"filetype",
		},
		lualine_y = { "progress" },
		lualine_z = { "location" },
        },
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {
			{
				"filename",
				file_status = true,
				path = 1,
			},
		},
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {
			{
				"filename",
				file_status = true,
				path = 1,
				shorting_target = 40,
				symbolds = {
					modified = "[+]",
					readonly = "[-]",
					unnamed = "[No Name]",
				}
			}
		},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
    }
}
