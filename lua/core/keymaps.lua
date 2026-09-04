-- --------------------------------------------------------------------------
-- Set leader key to space
-- --------------------------------------------------------------------------

local opts = { noremap = true, silent = true }

local keymap = vim.keymap.set

keymap("", "<Space>", "<Nop>", opts)

local function with_desc(opts, desc)
	local local_opts = vim.deepcopy(opts)
	local_opts["desc"] = desc
	return local_opts
end

-- --------------------------------------------------------------------------
-- General keymaps - NORMAL
-- --------------------------------------------------------------------------

-- Save buffer
keymap("n", "<leader>wq", ":wq<CR>", { desc = "save & quit" })
keymap("n", "<leader>ww", ":w<CR>", { desc = "save" })
keymap("n", "<leader>wf", ":w!<CR>", { desc = "overwrite" })
keymap("n", "<leader>wa", ":wa<CR>", { desc = "save all" })

-- Quit buffer
keymap("n", "<leader>xa", ":qa<CR>", { desc = "quit all" })
keymap("n", "<leader>xx", ":q!<CR>", { desc = "discard & quit" })

-- Follow links
keymap("n", "gx", ":!open <c-r><c-a><CR>", { desc = "open link under cursor" })

-- Navigate buffer
keymap("n", "<AS-h>", "<C-w>h", with_desc(opts, "navigate to left window"))
keymap("n", "<AS-j>", "<C-w>j", with_desc(opts, "navigate to right window"))
keymap("n", "<AS-k>", "<C-w>k", with_desc(opts, "navigate to below window"))
keymap("n", "<AS-l>", "<C-w>l", with_desc(opts, "navigate to above window"))
keymap("n", "<AS-Left>", "<C-w>h", with_desc(opts, "navigate to left window"))
keymap("n", "<AS-Down>", "<C-w>j", with_desc(opts, "navigate to left window"))
keymap("n", "<AS-Up>", "<C-w>k", with_desc(opts, "navigate to left window"))
keymap("n", "<AS-Right>", "<C-w>l", with_desc(opts, "navigate to left window"))
keymap("n", "<A-l>", "<C-i>", with_desc(opts, "navigate forward"))
keymap("n", "<A-h>", "<C-o>", with_desc(opts, "navigate backward"))
keymap("n", "<A-Right>", "<C-i>", with_desc(opts, "navigate forward"))
keymap("n", "<A-Left>", "<C-o>", with_desc(opts, "navigate backward"))

-- Resize buffer
keymap("n", "<C-k>", ":resize -2<CR>", with_desc(opts, "decrease horizontal size"))
keymap("n", "<C-j>", ":resize +2<CR>", with_desc(opts, "increase horizontal size"))
keymap("n", "<C-h>", ":vertical resize -2<CR>", with_desc(opts, "decrease vertical size"))
keymap("n", "<C-l>", ":vertical resize +2<CR>", with_desc(opts, "increase vertical size"))

-- Move text up and down
keymap("n", "<A-j>", ":m .+1<CR>==", with_desc(opts, "move line down"))
keymap("n", "<A-k>", ":m .-2<CR>==", with_desc(opts, "move line up"))
keymap("n", "<A-Down>", ":m .+1<CR>==", with_desc(opts, "move line down"))
keymap("n", "<A-Up>", ":m .-2<CR>==", with_desc(opts, "move line up"))

-- Split window management
keymap("n", "<leader>sv", "<C-w>v", { desc = "split window vertically" })
keymap("n", "<leader>sh", "<C-w>s", { desc = "split window horizontally" })
keymap("n", "<leader>se", "<C-w>=", { desc = "make split windows equal width" })
keymap("n", "<leader>sx", ":close<CR>", { desc = "close split window" })
keymap("n", "<leader>sj", "<C-w>-", { desc = "make split window height shorter" })
keymap("n", "<leader>sk", "<C-w>+", { desc = "make split windows height taller" })
keymap("n", "<leader>sl", "<C-w>>5", { desc = "make split windows width bigger" })
keymap("n", "<leader>sh", "<C-w><5", { desc = "make split windows width smaller" })

-- Tab management
keymap("n", "<leader>to", ":tabnew<CR>", { desc = "open a new tab" })
keymap("n", "<leader>tx", ":tabclose<CR>", { desc = "close a tab" })
keymap("n", "<leader>tn", ":tabn<CR>", { desc = "next tab" })
keymap("n", "<leader>tp", ":tabp<CR>", { desc = "previous tab" })

-- Diff keymaps
keymap("n", "<leader>cc", ":diffput<CR>", { desc = "put diff from current to other during diff" })
keymap("n", "<leader>cj", ":diffget 1<CR>", { desc = "get diff from left (local) during merge" })
keymap("n", "<leader>ck", ":diffget 3<CR>", { desc = "get diff from right (remote) during merge" })
keymap("n", "<leader>cn", "]c", { desc = "next diff hunk" })
keymap("n", "<leader>cp", "[c", { desc = "previous diff hunk" })

-- Quickfix keymaps
keymap("n", "<leader>qo", ":copen<CR>", { desc = "open quickfix list" })
keymap("n", "<leader>qf", ":cfirst<CR>", { desc = "jump to first quickfix list item" })
keymap("n", "<leader>qn", ":cnext<CR>", { desc = "jump to next quickfix list item" })
keymap("n", "<leader>qp", ":cprev<CR>", { desc = "jump to prev quickfix list item" })
keymap("n", "<leader>ql", ":clast<CR>", { desc = "jump to last quickfix list item" })
keymap("n", "<leader>qc", ":cclose<CR>", { desc = "close quickfix list" })

-- --------------------------------------------------------------------------
-- General keymaps - VISUAL
-- --------------------------------------------------------------------------

-- Stay in indent mode
keymap("v", "<S-Tab>", "<gv^", with_desc(opts, "indent out"))
keymap("v", "<Tab>", ">gv^", with_desc(opts, "indent in"))

-- Move text up and down
keymap("v", "J", ":m '>+1<CR>gv=gv", with_desc(opts, "move line down"))
keymap("v", "K", ":m '<-2<CR>gv=gv", with_desc(opts, "move line up"))
keymap("v", "<A-Down>", ":m '>+1<CR>gv=gv", with_desc(opts, "move line down"))
keymap("v", "<A-Up>", ":m '<-2<CR>gv=gv", with_desc(opts, "move line up"))
keymap("v", "p", '"_dP', with_desc(opts, "paste text over a highlighted block without overwriting clipboard"))

-- --------------------------------------------------------------------------
-- General keymaps - VISUAL BLOCK
-- --------------------------------------------------------------------------

-- Move text up and down
keymap("x", "J", ":m '>+1<CR>gv=gv", with_desc(opts, "move line down"))
keymap("x", "K", ":m '<-2<CR>gv=gv", with_desc(opts, "move line up"))
keymap("x", "<A-Down>", ":m '>+1<CR>gv=gv", with_desc(opts, "move line down"))
keymap("x", "<A-Up>", ":m '<-2<CR>gv=gv", with_desc(opts, "move line up"))

-- --------------------------------------------------------------------------
-- Plugins keymaps
-- --------------------------------------------------------------------------

-- Git

keymap("n", "<leader>ga", ":!git add %<CR>", { desc = "git add current file" })

-- Git-Signs
keymap("n", "<leader>gsd", ":Gitsigns diffthis<CR>", { desc = "git diff file" })
keymap("n", "<leader>gsi", ":Gitsigns preview_hunk_inline<CR>", { desc = "git diff hunk inline" })
keymap("n", "<leader>gss", ":Gitsigns stage_hunk<CR>", { desc = "git stage hunk" })
keymap("n", "<leader>gsr", ":Gitsigns reset_hunk<CR>", { desc = "git reset hunk" })
keymap("n", "<leader>gsn", ":Gitsigns navhunk next<CR>", { desc = "git navigate next hunk" })
keymap("n", "<leader>gsp", ":Gitsigns navhunk prev<CR>", { desc = "git navigate previous hunk" })
keymap("n", "<leader>gsb", ":Gitsigns blame<CR>", { desc = "git blame buffer" })
keymap("n", "<leader>gsl", ":Gitsigns blame_line<CR>", { desc = "git blame line" })

-- LSP
keymap("n", "<leader>ah", "<cmd>lua vim.lsp.buf.hover()<CR>", { desc = "hover" })
keymap("n", "<leader>ad", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "go to definition" })
keymap("n", "<leader>aD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { desc = "go to declaration" })
keymap("n", "<leader>ai", "<cmd>lua vim.lsp.buf.implementation()<CR>", { desc = "show implementation" })
keymap("n", "<leader>at", "<cmd>lua vim.lsp.buf.type_definition()<CR>", { desc = "go to type definition" })
keymap("n", "<leader>ar", "<cmd>lua vim.lsp.buf.references()<CR>", { desc = "show references" })
keymap("n", "<leader>ag", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { desc = "signature help" })
keymap("n", "<leader>ae", "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "rename symbol" })
keymap("n", "<leader>as", "<cmd>lua vim.diagnostic.reset()<CR>", { desc = "reset diagnostics" })
keymap("n", "<leader>af", "<cmd>lua vim.lsp.buf.format({async = true})<CR>", { desc = "format buffer" })
keymap("n", "<leader>aa", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "refactor" })
keymap("n", "<leader>al", "<cmd>lua vim.diagnostic.open_float()<CR>", { desc = "show diagnostic" })
keymap("n", "<leader>ap", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { desc = "previous diagnostic" })
keymap("n", "<leader>an", "<cmd>lua vim.diagnostic.goto_next()<CR>", { desc = "next diagnostic" })
keymap("n", "<leader>ac", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", { desc = "document symbol" })
keymap("i", "<C-Space>", "<cmd>lua vim.lsp.buf.completion()<CR>", { desc = "auto complete" })

-- Debugging
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", { desc = "toggle breakpoint" })
keymap(
	"n",
	"<leader>dn",
	"<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
	{ desc = "set breakpoint condition" }
)
keymap(
	"n",
	"<leader>dl",
	"<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>",
	{ desc = "set breakpoint" }
)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.clear_breakpoints()<cr>", { desc = "clear breakpoints" })
-- keymap("n", "<leader>da", "<cmd>Telescope dap list_breakpoints<cr>", { desc = "" })
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", { desc = "continue" })
keymap("n", "<leader>dj", "<cmd>lua require'dap'.step_over()<cr>", { desc = "step over" })
keymap("n", "<leader>dk", "<cmd>lua require'dap'.step_into()<cr>", { desc = "step into" })
keymap("n", "<leader>do", "<cmd>lua require'dap'.step_out()<cr>", { desc = "step out" })
keymap("n", "<leader>dd", function()
	require("dap").disconnect()
	require("dapui").close()
end, { desc = "" })
keymap("n", "<leader>dt", function()
	require("dap").terminate()
	require("dapui").close()
end, { desc = "start debugging" })
keymap("n", "<leader>dp", "<cmd>lua require'dap'.repl.toggle()<cr>", { desc = "" })
keymap("n", "<leader>ds", "<cmd>lua require'dap'.run_last()<cr>", { desc = "run last" })
keymap("n", "<leader>di", function()
	require("dap.ui.widgets").hover()
end, { desc = "show debugging widgets" })
keymap("n", "<leader>d?", function()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.scopes)
end, { desc = "centered float widgets" })
-- keymap("n", "<leader>df", "<cmd>Telescope dap frames<cr>", { desc = "" })
-- keymap("n", "<leader>dh", "<cmd>Telescope dap commands<cr>", { desc = "" })
-- keymap("n", "<leader>de", function()
-- 	require("telescope.builtin").diagnostics({ default_text = ":E:" })
-- end, { desc = "" })

-- Aerial
keymap("n", "<leader>rt", ":AerialToggle<CR>", { desc = "toggle aerial" })

-- D2
keymap("n", "<leader>pd2", ":D2Preview", { desc = "Preview D2 file" })
