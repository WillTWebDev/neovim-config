-- Assign map function to var
local map = vim.keymap.set

-- Set Key Map Options
local opts = {
	silent = false -- Silent executes commands without echoing to command bar
}

-- Leader
vim.g.mapleader = " " -- Assign Spacebar as Leader
map("", "<Space>", "<Nop>", opts)

-- Mode Abbreviations 
local n = "n" -- Normal
local i = "i" -- Insert
local v = "v" -- Visual
local vb = "x" -- Visual Block
local t = "t" -- Terminal
local c = "c" -- Command

-- Normal Mappings
-- Editor Commands for the Lazy
map(n, "<Leader>qa", ":qa<CR>", opts)
map(n, "<Leader>qaf", ":qa!<CR>", opts) -- Force close everything
map(n, "<Leader>w", ":w<CR>", opts)
map(n, "<Leader>wa", ":wa<CR>", opts)
map(n, "<Leader>cd", ":cd %:h<CR>", opts)
map(n, "<Leader>cwd", ":pwd<CR>", opts)

-- Window Navigation
map(n, "<C-h>", "<C-w>h", opts)
map(n, "<C-j>", "<C-w>j", opts)
map(n, "<C-k>", "<C-w>k", opts)
map(n, "<C-l>", "<C-w>l", opts)

-- Window Resize
map(n, "<Leader>k", ":resize -2<CR>", opts)
map(n, "<Leader>j", ":resize +2<CR>", opts)
map(n, "<Leader>h", ":vertical resize -2<CR>", opts)
map(n, "<Leader>l", ":vertical resize +2<CR>", opts)

-- Buffer Navigation
map(n, "<Tab>f", ":bf<CR>", opts)
map(n, "<Tab>-f", ":bl<CR>", opts)
map(n, "<Tab>.", ":bn<CR>", opts)
map(n, "<Tab>,", ":bp<CR>", opts)

-- Buffer Operations
map(n, "<Tab>x", ":BufferClose<CR>", opts)
map(n, "<Tab>m.", ":BufferMoveNext<CR>", opts)
map(n, "<tab>m,", ":BufferMovePrevious<CR>", opts)

-- NOTE: Not using tabs as it does not play well with Bufferline or BarBar plugins.
-- Tab Operations
-- map(n, "<Leader><Tab>", ":tabnew<CR>", opts)
-- map(n, "<Tab>x", ":tabclose<CR>", opts)

-- Tab Navigation
-- map(n, "<Tab>.", "gt", opts)
-- map(n, "<Tab>,", ":tabp<CR>", opts)
-- map(n, "<Leader>1", "1gt", opts)
-- map(n, "<Leader>2", "2gt", opts)
-- map(n, "<Leader>3", "3gt", opts)
-- map(n, "<Leader>4", "4gt", opts)
-- map(n, "<Leader>5", "5gt", opts)

-- Comment Line
map(n, "<Leader>/", "<ESC><CMD>lua require('Comment.api').toggle.linewise.current()<CR>", opts)

-- Git
map(n, "<Leader>gg", vim.cmd.LazyGit, opts)

-- View Toggles
map(n, "<Leader>f", vim.cmd.NvimTreeToggle, opts)
map(n, "<Leader>u", vim.cmd.UndotreeToggle, opts)

-- Telescope Mappings
map(n, "<Leader>s", ":Telescope live_grep<CR>", opts)
map(n, "<Leader>sf", ":Telescope find_files<CR>", opts)
map(n, "<Leader>sp", ":Telescope project<CR>", opts)
map(n, "<Leader>sb", ":Telescope buffers<CR>", opts)

-- Config Menus
map(n, "<Leader>zlsp", ":Mason<CR>", opts)
map(n, "<Leader>zlz", ":Lazy<CR>", opts)

-- Debugging
map(n, "<Leader>dr", ":lua require('dap').continue()<CR>", opts)
map(n, "<Leader>ds", ":lua require('dap').toggle_breakpoint()<CR>", opts)
map(n, "<Leader>di", ":lua require('dap').step_into()<CR>", opts)
map(n, "<Leader>do", ":lua require('dap').step_out()<CR>", opts)
map(n, "<Leader>dv", ":lua require('dap').repl.open()<CR>", opts)

-- Build & Run (.Net Specific)
map(n, "<Leader>dnr", ":!dotnet run<CR>", opts)
map(n, "<Leader>dnb", ":!dotnet build<CR>", opts)
map(n, "<Leader>dnt", ":!dotnet test<CR>", opts)
map(n, "<Leader>dnpr", ":!dotnet restore<CR>", opts)

-- Build & Run (Rust Specific)
map(n, "<Leader>cr", ":!cargo run<CR>", opts)
map(n, "<Leader>cc", ":!cargo clippy<CR>", opts)

-- Testing
map(n, "<Leader>t", vim.cmd.TestNearest, opts)
map(n, "<Leader>tf", vim.cmd.TestFile, opts)
map(n, "<Leader>ts", vim.cmd.TestSuite, opts)
map(n, "<Leader>tl", vim.cmd.TestLast, opts)
map(n, "<Leader>tv", vim.cmd.TestVisit, opts)

-- Nvim Key Config Shortcuts
map(n, "\\e", ":e ~/.config/nvim/lua/keymap.lua<CR>", opts)
map(n, "\\r", ":luafile ~/.config/nvim/lua/keymap.lua<CR>", opts)

-- Insert Mappings
map(i, ";;", "<ESC>", opts) -- Easy exit to Normal Mode

-- Visual Mappings
map(v, ";;", "<ESC>", opts) -- Easy exit to Normal Mode

-- Stay in Visual Mode After Indentation
map(v, ">", ">gv", opts)
map(v, "<", "<gv", opts)
map(vb, ">", ">gv", opts)
map(vb, "<", "<gv", opts)

-- Comment Block of Lines
map(vb, "<Leader>/", "<ESC><CMD>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", opts)

-- Command Mappings
