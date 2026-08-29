return {
	{
		"echasnovski/mini.nvim",
		version = false, -- Track the active main branch for the latest module optimizations
		lazy = false, -- Load immediately on startup so icons are available to all buffers
		config = function()
			-- 1. Initialize the icons module straight out of the mini.nvim library
			require("mini.icons").setup({
				style = "glyph", -- Uses high-definition Nerd Font symbols out of the box
			})
			-- 2. CRUCIAL: Force mini.icons to pretend to be the legacy devicons library.
			-- This seamlessly tricks plugins like lualine or snacks into pulling
			-- modern mini.icons without needing nvim-web-devicons installed!
			require("mini.icons").mock_nvim_web_devicons()
			-- 3. You can initialize your other mini modules in the same block down here:
			require("mini.pairs").setup({})
			require("mini.indentscope").setup({ symbol = "┃" })
			require("mini.statusline").setup({ set_vim_settings = true })
		end,
	},
}
