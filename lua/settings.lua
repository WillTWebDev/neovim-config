-- Editor Settings
-- Input
vim.opt.mouse = 'a' -- Enable Mouse Input
vim.o.clipboard = "unnamedplus" -- All 'copy' operations (deletions, yank, etc.) go to '+' register
vim.opt.spell = true -- Enable Spell Check
vim.opt.scrolloff = 5

-- Line Numbers
vim.opt.number = true -- Enable Line Numbers
vim.wo.relativenumber = true -- Enable Relative Line Numbers

-- Search
vim.opt.ignorecase = true -- Enable Case-Insensitivity
vim.opt.smartcase = true -- Enable Case-Sensitivity (when search query contains uppercase characters) 
-- vim.opt.hlsearch = false -- Disable Search Highlighting

-- Display
vim.opt.wrap = false -- Disable Word Wrapping
vim.opt.breakindent = true -- Newline maintains indentation of previous line
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4 -- Number of spaces per indentation step (uses tabstop value if 0 or unset)
vim.opt.expandtab = true -- Use spaces in place of tab
vim.opt.termguicolors = true -- Enable 24-bit RGB Colors

-- Undo
vim.opt.undodir = vim.fn.expand('~/.vim/undodir') -- Undo Buffer Location
vim.opt.undofile = true -- Create Undo Buffer File
