local fn = vim.fn

-- Auto-Install Package Manager
local pmpath = fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(pmpath) then
	fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--single-branch",
		"https://github.com/folke/lazy.nvim.git",
		pmpath,
	})
end

vim.opt.runtimepath:prepend(pmpath)

require("lazy").setup("plugins", {
	defaults = { lazy = true },
	install = { colorscheme = { "tokyonight" }},
	checker = { enabled = true },
	change_detection = {
		notify = false,
	},
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"matchit",
				"matchparen",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			}
		},
	},
})

