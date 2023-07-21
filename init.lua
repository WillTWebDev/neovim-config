-- Module Imports
require('settings')
require('keymap')
require('user.lazy')
require('lsp')
require('autocommands')
require('themes')
require('ui')

-- Initialize Plugins

require("toggleterm").setup {
    open_mapping = [[<C-x>]],
    shade_terminals = false
}



