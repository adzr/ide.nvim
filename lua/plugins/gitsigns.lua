return { -- Adds git related signs to the gutter, as well as utilities for managing changes
	"lewis6991/gitsigns.nvim",
	opts = {
		signs = {
			add = { text = "+" },
			change = { text = "~" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
		},
		current_line_blame = true,
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = "eol", -- Places the blame message at the End Of the Line
			delay = 500, -- Waits 0.5 seconds after your cursor stops moving to show text
			ignore_whitespace = false,
		},
		-- Optional: Style the ghost text color so it looks beautifully faded
		current_line_blame_formatter = "      <author> • <author_time:%Y-%m-%d> • <summary>",
	},
}
