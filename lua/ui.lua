-- File Explorer
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup()

-- Tab Bar
require("barbar").setup {
    icons = {
        diagnostics = {
            [vim.diagnostic.severity.ERROR] = {
                enabled = true
            },
            [vim.diagnostic.severity.WARN] = {
                enabled = true
            }
        }
    }
}

-- Code Highlighting & Marking
require("nvim-treesitter.configs").setup({
    highlight = {
        enable = true,
    },
})
require("rainbow-delimiters")
require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
}

-- Git
require("gitsigns").setup()

-- Telescope
-- Add Projects capability to Telescope
require("telescope").load_extension("project")
require("telescope").setup({
    defaults = {
        file_ignore_patters = { "^./.git/", "^node_modules/", "^vendor/" }
    }
})

-- Status Bar
require("lualine").setup {
    options = {
        icons_enabled = true,
    },
}
