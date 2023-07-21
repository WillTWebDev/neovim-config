local api = vim.api

api.nvim_create_autocmd("BufEnter", { command = "lua require('lazygit.utils').project_root_dir()" })
