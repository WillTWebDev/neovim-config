require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
    'bashls',
    'luau_lsp',
    'marksman',
    'omnisharp',
  },
	automatic_installation = true,
})

-- To learn the key bindings, see :help lsp-zero-keybindings
-- To learn LSP server configuration, see :help lsp-zero-api-showcase
local lsp = require('lsp-zero')
lsp.preset('recommended')

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()

-- vim.g.OmniSharp_server_use_net6 = 1 -- Fixes compatability issue.  May not be needed in later updates.
