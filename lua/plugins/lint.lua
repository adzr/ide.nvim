return {
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" }, -- Trigger silently as files load
		config = function()
			local lint = require("lint")

			-- 1. Map your non-LSP CLI linters cleanly to your file types
			lint.linters_by_ft = {
				bash = { "shellcheck" },
				markdown = { "markdownlint" },
				json = { "jsonlint" },
			}

			-- 2. The Global Autocommand Loop
			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				group = vim.api.nvim_create_augroup("GlobalLinting", { clear = true }),
				callback = function()
					-- Step A: Trigger whatever standard linters are mapped to the file type
					lint.try_lint()

					-- Step B: 🚀 Force cspell to execute universally across every buffer!
					-- It skips running ONLY if the filetype is blank, a pop-up, or a file tree sidebar.
					local excluded_fts = { "", "neo-tree", "lazy", "mason", "notify", "toggleterm" }
					if not vim.tbl_contains(excluded_fts, vim.bo.filetype) then
						lint.try_lint("cspell")
					end
				end,
			})
		end,
	},
}
