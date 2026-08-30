-- Encoding has to be set early on
vim.opt.fileencoding = "utf-8"
vim.opt.termbidi = true

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("ide-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- Bootstrap lazy
local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazy_path) then
	local lazy_repo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazy_repo, lazy_path })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end ---@diagnostic disable-next-line: undefined-field

vim.opt.rtp:prepend(lazy_path)

-- This has to be set before initializing lazy
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Initialize lazy with dynamic loading of anything in the plugins directory

require("lazy").setup("plugins", {
	change_detection = {
		enabled = true, -- automatically check for config file changes and reload the ui
		notify = false, -- turn off notifications whenever plugin changes are made
	},
	ui = require("core.nerdfont-fallback"),
	performance = {
		rtp = {
			reset = false, -- ⚠️ CRUCIAL: Blocks lazy from wiping out Debian's native /usr/lib/ paths!
		},
	},
})

-- Setup diagnostics
vim.diagnostic.config({
	-- 1. Shut off the old default flat text string at the end of the line
	virtual_text = false,

	virtual_lines = {
		inline = true,
		wrap = true,
	},

	-- Fine-tune options for your Rustacean/CSpell diagnostics
	severity_sort = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "󰈅",
			[vim.diagnostic.severity.INFO] = "",
			[vim.diagnostic.severity.HINT] = "",
		},
	},
})

-- These modules are not loaded by lazy
require("core.filetype")
-- require("core.lsp")
require("core.options")
require("core.keymaps")
require("core.health")
