return {
    -- Debugging
    {
        "simrat39/rust-tools.nvim", -- Better Rust tooling
        config = function()
            local rt = require("rust-tools")

            rt.setup({
                server = {
                    on_attach = function(_, bufnr)
                        -- Hover Actions
                        vim.keymap.set("n", "<Leader>h", rt.hover_actions.hover_actions, { buffer = bufnr })

                        -- Code Action Groups
                        vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
                    end
                }
            })
        end,
        event = "VeryLazy"
    },
    {
        "mfussenegger/nvim-dap",
        config = function()
            local dap = require("dap")
            local binPath = "/home/tmstxtennisonw/.local/share/nvim/mason/bin/"

            -- Rust
            dap.adapters.codelldb = {
                type = "server",
                port = "${port}",
                executable = {
                    command = binPath .. "codelldb",
                    args = { "--port", "${port}" },
                }
            }
            dap.configurations.rust = {
                {
                    name = "Rust Debug",
                    type = "codelldb",
                    request = "launch",
                    program = function()
                        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. '/target/debug/', 'file')
                    end,
                    cwd = "${workspaceFolder}",
                    stopOnEntry = true,
                },
            }

            -- .Net
            dap.adapters.coreclr = {
                type = 'executable',
                command = binPath .. "netcoredbg",
                args = { "--interpreter=vscode" }
            }
            dap.configurations.cs = {
                {
                    type = "coreclr",
                    name = "Launch - NetCoreDbg",
                    request = "launch",
                    program = function()
                        return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/bin/Debug/net6.0/", "file")
                    end,
                    console = "integratedTerminal",
                    stdio = { "input.txt" },
                }
            }
        end
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
        },
        config = function()
            local dap, dapui = require("dap"), require("dapui")

            dapui.setup({
                mappings = {
                    -- Apply multiple mappings using a table
                    expand = { "<CR>", "<2-LeftMouse>" },
                    open = "o",
                    remove = "d",
                    edit = "e",
                    repl = "r",
                    toggle = "t",
                },
                -- Expand lines larger than the window (Requires Nvim >= 0.7)
                expand_lines = vim.fn.has("nvim-0.7") == 1,
                layouts = {
                    {
                        elements = {
                            -- Elements can be strings or table with id and size keys
                            { id = "scopes", size = 0.25 },
                            "breakpoints",
                            "stacks",
                            "watches",
                        },
                        size = 40, -- # of columns
                        position = "left",
                    },
                    {
                        elements = {
                            "repl",
                            "console",
                        },
                        size = 0.25, -- 25% total lines
                        position = "bottom",
                    },
                },
                controls = {
                    enabled = true,
                    -- Display controls in this element
                    element = "repl",
                },
                floating = {
                    max_height = nil, -- Int or Float between 0 and 1
                    max_width = nil, -- Floats are treated as screen percentage
                    border = "double", -- Options are single, double, or rounded
                    mappings = {
                        close = { "q", "<ESC>" },
                    },
                },
                windows = { indent = 1 },
                render = {
                    max_type_length = nil, -- Int or nil
                    max_value_lines = 100, -- Int or nil
                },
            })

            dap.listeners.after.event_initialized["dapui_config"] = function ()
                dapui.open()
            end
            dap.listeners.after.event_terminated["dapui_config"] = function ()
                dapui.close()
            end
            dap.listeners.after.event_exited["dapui_config"] = function ()
                dapui.close()
            end
        end,
        event = "VeryLazy",
    },

    -- Buffer Management
    { "romgrk/barbar.nvim", dependencies = {
            "lewis6991/gitsigns.nvim",
            "kyazdani42/nvim-web-devicons",
        }
    },

	-- Pretty status bar
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'kyazdani42/nvim-web-devicons', opt = true }
	},

    -- Treesitter
    "nvim-treesitter/nvim-treesitter",

    -- Indentation Helper
    "lukas-reineke/indent-blankline.nvim",

    -- Color Selection Tools
    {
        "nvim-colortils/colortils.nvim",
        event = "VeryLazy"
    },

    -- Startup Screen
    {
        "goolord/alpha-nvim",
        dependencies = { "kyazdani42/nvim-web-devicons" },
        event = "VimEnter",
        config = function ()
                require("alpha").setup(require("alpha.themes.startify").config)
        end
    },

}
