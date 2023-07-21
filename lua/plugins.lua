return { 
    -- Required by other plugins
    "kyazdani42/nvim-web-devicons",
    "nvim-lua/plenary.nvim", -- Lua functions used by many plugins

	-- File Explorer in Vim
    "kyazdani42/nvim-tree.lua",

	-- Terminal Toggle
    "akinsho/toggleterm.nvim",

    -- Telescope
    "nvim-telescope/telescope.nvim",
    "nvim-telescope/telescope-project.nvim",

    -- Comments
    "numToStr/Comment.nvim",

    -- Testing
    { 
        "vim-test/vim-test",
        event = "VeryLazy"
    },

    -- Time Tracking
    { 
        "wakatime/vim-wakatime",
        event = "VeryLazy"
    },

    -- Undo Tree
    {
        "mbbill/undotree",
        event = "VeryLazy"
    },

    -- Startup Screen
    {
        "goolord/alpha-nvim",
        requires = { "kyazdani42/nvim-web-devicons" },
        lazy = false,
        config = function ()
                require("alpha").setup(require("alpha.themes.startify").config)
        end
    },
}
