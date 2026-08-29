-- Set leader key to space

local opts = { noremap = true, silent = true }

local keymap = vim.keymap.set

keymap("", "<Space>", "<Nop>", opts)

local function with_desc(opts, desc)
	local local_opts = vim.deepcopy(opts)
	local_opts["desc"] = desc
	return local_opts
end

-- ##########################################################################
-- NORMAL
-- ##########################################################################

-- --------------------------------------------------------------------------
-- General keymaps
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
keymap("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap("n", "<leader>se", "<C-w>=") -- make split windows equal width
keymap("n", "<leader>sx", ":close<CR>") -- close split window
keymap("n", "<leader>sj", "<C-w>-") -- make split window height shorter
keymap("n", "<leader>sk", "<C-w>+") -- make split windows height taller
keymap("n", "<leader>sl", "<C-w>>5") -- make split windows width bigger
keymap("n", "<leader>sh", "<C-w><5") -- make split windows width smaller

-- Tab management
keymap("n", "<leader>to", ":tabnew<CR>") -- open a new tab
keymap("n", "<leader>tx", ":tabclose<CR>") -- close a tab
keymap("n", "<leader>tn", ":tabn<CR>") -- next tab
keymap("n", "<leader>tp", ":tabp<CR>") -- previous tab

-- Diff keymaps
keymap("n", "<leader>cc", ":diffput<CR>") -- put diff from current to other during diff
keymap("n", "<leader>cj", ":diffget 1<CR>") -- get diff from left (local) during merge
keymap("n", "<leader>ck", ":diffget 3<CR>") -- get diff from right (remote) during merge
keymap("n", "<leader>cn", "]c") -- next diff hunk
keymap("n", "<leader>cp", "[c") -- previous diff hunk

-- Quickfix keymaps
keymap("n", "<leader>qo", ":copen<CR>") -- open quickfix list
keymap("n", "<leader>qf", ":cfirst<CR>") -- jump to first quickfix list item
keymap("n", "<leader>qn", ":cnext<CR>") -- jump to next quickfix list item
keymap("n", "<leader>qp", ":cprev<CR>") -- jump to prev quickfix list item
keymap("n", "<leader>ql", ":clast<CR>") -- jump to last quickfix list item
keymap("n", "<leader>qc", ":cclose<CR>") -- close quickfix list

-- VISUAL

-- Stay in indent mode
keymap("v", "<S-Tab>", "<gv^", opts)
keymap("v", "<Tab>", ">gv^", opts)

-- Move text up and down
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)
keymap("v", "<A-Down>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-Up>", ":m '<-2<CR>gv=gv", opts)
keymap("v", "p", '"_dP', opts)

-- VISUAL BLOCK

-- Move text up and down
keymap("x", "J", ":m '>+1<CR>gv=gv", opts)
keymap("x", "K", ":m '<-2<CR>gv=gv", opts)
keymap("x", "<A-Down>", ":m '>+1<CR>gv=gv", opts)
keymap("x", "<A-Up>", ":m '<-2<CR>gv=gv", opts)

-- Vim-maximizer
--keymap("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle maximize tab

-- Nvim-tree
-- keymap("n", "<leader>ee", ":NvimTreeToggle<CR>") -- toggle file explorer
-- keymap("n", "<leader>er", ":NvimTreeFocus<CR>") -- toggle focus to file explorer
-- keymap("n", "<leader>ef", ":NvimTreeFindFile<CR>") -- find file in file explorer

-- Telescope
-- keymap("n", "<leader>ff", require("telescope.builtin").find_files, {})
-- keymap("n", "<leader>fg", require("telescope.builtin").live_grep, {})
-- keymap("n", "<leader>fb", require("telescope.builtin").buffers, {})
-- keymap("n", "<leader>fh", require("telescope.builtin").help_tags, {})
-- keymap("n", "<leader>fs", require("telescope.builtin").current_buffer_fuzzy_find, {})
-- keymap("n", "<leader>fo", require("telescope.builtin").lsp_document_symbols, {})
-- keymap("n", "<leader>fi", require("telescope.builtin").lsp_incoming_calls, {})
-- keymap("n", "<leader>fm", function()
--   require("telescope.builtin").treesitter({ default_text = ":method:" })
-- end)

-- Git-blame
-- keymap("n", "<leader>gb", ":GitBlameToggle<CR>") -- toggle git blame

-- -- Harpoon
-- keymap("n", "<leader>ha", require("harpoon.mark").add_file)
-- keymap("n", "<leader>hh", require("harpoon.ui").toggle_quick_menu)
-- keymap("n", "<leader>h1", function()
-- 	require("harpoon.ui").nav_file(1)
-- end)
-- keymap("n", "<leader>h2", function()
-- 	require("harpoon.ui").nav_file(2)
-- end)
-- keymap("n", "<leader>h3", function()
-- 	require("harpoon.ui").nav_file(3)
-- end)
-- keymap("n", "<leader>h4", function()
-- 	require("harpoon.ui").nav_file(4)
-- end)
-- keymap("n", "<leader>h5", function()
-- 	require("harpoon.ui").nav_file(5)
-- end)
-- keymap("n", "<leader>h6", function()
-- 	require("harpoon.ui").nav_file(6)
-- end)
-- keymap("n", "<leader>h7", function()
-- 	require("harpoon.ui").nav_file(7)
-- end)
-- keymap("n", "<leader>h8", function()
-- 	require("harpoon.ui").nav_file(8)
-- end)
-- keymap("n", "<leader>h9", function()
-- 	require("harpoon.ui").nav_file(9)
-- end)

-- Vim REST Console
-- keymap("n", "<leader>xr", ":call VrcQuery()<CR>") -- Run REST query

-- LSP
-- keymap("n", "<leader>gg", "<cmd>lua vim.lsp.buf.hover()<CR>")
-- keymap("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
-- keymap("n", "<leader>gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
-- keymap("n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
-- keymap("n", "<leader>gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
-- keymap("n", "<leader>gr", "<cmd>lua vim.lsp.buf.references()<CR>")
-- keymap("n", "<leader>gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
-- keymap("n", "<leader>rr", "<cmd>lua vim.lsp.buf.rename()<CR>")
-- keymap("n", "<leader>rs", "<cmd>lua vim.diagnostic.reset()<CR>")
-- keymap("n", "<leader>gf", "<cmd>lua vim.lsp.buf.format({async = true})<CR>")
-- keymap("v", "<leader>gf", "<cmd>lua vim.lsp.buf.format({async = true})<CR>")
-- keymap("n", "<leader>ga", "<cmd>lua vim.lsp.buf.code_action()<CR>")
-- keymap("n", "<leader>gl", "<cmd>lua vim.diagnostic.open_float()<CR>")
-- keymap("n", "<leader>gp", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
-- keymap("n", "<leader>gn", "<cmd>lua vim.diagnostic.goto_next()<CR>")
-- keymap("n", "<leader>tr", "<cmd>lua vim.lsp.buf.document_symbol()<CR>")
-- keymap("i", "<C-Space>", "<cmd>lua vim.lsp.buf.completion()<CR>")

-- Debugging
-- keymap("n", "<leader>bb", "<cmd>lua require'dap'.toggle_breakpoint()<cr>")
-- keymap("n", "<leader>bc", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>")
-- keymap("n", "<leader>bl", "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>")
-- keymap("n", "<leader>br", "<cmd>lua require'dap'.clear_breakpoints()<cr>")
-- keymap("n", "<leader>ba", "<cmd>Telescope dap list_breakpoints<cr>")
-- keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>")
-- keymap("n", "<leader>dj", "<cmd>lua require'dap'.step_over()<cr>")
-- keymap("n", "<leader>dk", "<cmd>lua require'dap'.step_into()<cr>")
-- keymap("n", "<leader>do", "<cmd>lua require'dap'.step_out()<cr>")
-- keymap("n", "<leader>dd", function()
-- 	require("dap").disconnect()
-- 	require("dapui").close()
-- end)
-- keymap("n", "<leader>dt", function()
-- 	require("dap").terminate()
-- 	require("dapui").close()
-- end)
-- keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>")
-- keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>")
-- keymap("n", "<leader>di", function()
-- 	require("dap.ui.widgets").hover()
-- end)
-- keymap("n", "<leader>d?", function()
-- 	local widgets = require("dap.ui.widgets")
-- 	widgets.centered_float(widgets.scopes)
-- end)
-- keymap("n", "<leader>df", "<cmd>Telescope dap frames<cr>")
-- keymap("n", "<leader>dh", "<cmd>Telescope dap commands<cr>")
-- keymap("n", "<leader>de", function()
-- 	require("telescope.builtin").diagnostics({ default_text = ":E:" })
-- end)

-- TERMINAL
-- keymap("n", "<leader>tt", ":split | term<CR>", { desc = "Toggle float terminal" })

-- D2
-- keymap("n", "<leader>d2", ":D2Preview", { desc = "Preview a D2 file" })
