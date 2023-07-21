return {
    {
        "hiphish/rainbow-delimiters.nvim", -- Colorize sets of surround characters; Requires tree-sitter
        config = function()
            local rainbow_delimiters = require("rainbow-delimiters")

            vim.g.rainbow_delimiters = {
                strategy = {
                    [''] = rainbow_delimiters.strategy['global'],
                    vim = rainbow_delimiters.strategy['local'],
                },
                query = {
                    [''] = 'rainbow-delimiters',
                    lua = 'rainbow-blocks',
                },
                highlight = {
                    'RainbowDelimiterGreen',
                    'RainbowDelimiterYellow',
                    'RainbowDelimiterBlue',
                    'RainbowDelimiterCyan',
                    'RainbowDelimiterOrange',
                    'RainbowDelimiterRed',
                    'RainbowDelimiterViolet',
                }
            }
        end
    }
}
