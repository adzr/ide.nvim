--cspell: disable
local opt = vim.opt

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- Session Management
opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
opt.backup = false
opt.swapfile = false
opt.timeoutlen = 300
opt.undofile = true
opt.writebackup = false
opt.spell = false

-- Line Numbers
opt.number = true
opt.relativenumber = false
opt.numberwidth = 4

-- Tabs & Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = false
opt.autoindent = true
vim.bo.softtabstop = 2
opt.smartindent = true
opt.breakindent = true

-- Line Wrapping
opt.wrap = true -- Wrap text

-- Search Settings
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true

-- Cursor Line
opt.cursorline = true

-- Appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
vim.diagnostic.config({
	float = { border = "rounded" }, -- add border to diagnostic popups
})
opt.cmdheight = 2
opt.conceallevel = 0
opt.pumheight = 10
opt.showtabline = 0
opt.signcolumn = "yes"
opt.wrap = true
opt.linebreak = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.showmode = false
opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Backspace
opt.backspace = "indent,eol,start"

-- Clipboard
-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

-- Split Windows
opt.splitright = true
opt.splitbelow = true

-- Consider - as part of keyword
opt.iskeyword:append("-")

-- Disable the mouse while in nvim
opt.mouse = ""

-- Folding
opt.foldlevel = 20
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()" -- Utilize Treesitter folds

-- Cmp
opt.completeopt = { "menuone", "noselect" }
opt.updatetime = 250
opt.inccommand = "split"

-- Arabic support
opt.arabicshape = true

--cspell: enable
