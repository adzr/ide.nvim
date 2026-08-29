return {
	{
		"m00qek/baleia.nvim",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			-- Initialize the core translation framework
			local baleia = require("baleia").setup({
				log_level = "error",
			})

			-- Expose a fast manual command: type :BaleiaColorize to fix any active window
			vim.api.nvim_create_user_command("BaleiaColorize", function()
				baleia.once(vim.api.nvim_get_current_buf())
			end, {})

			-- 🔄 AUTOMATED HOOK: Clean and colorize all log files dynamically on entry!
			vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
				pattern = "*.log",
				callback = function()
					baleia.automatically(vim.api.nvim_get_current_buf())
				end,
			})
		end,
	},
}
