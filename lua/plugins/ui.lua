return {
	-- The world-famous gruvbox colorscheme
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = true,
	},

	-- Better `vim.notify()`
	{
		"rcarriga/nvim-notify",
		event = "VeryLazy",
		keys = {
			{
				"<leader>un",
				function()
					require("notify").dismiss({ silent = true, pending = true })
				end,
				desc = "Dismiss All Notifications",
			},
		},
		opts = {
			stages = "slide",
			timeout = 3000,
			max_height = function()
				return math.floor(vim.o.lines * 0.75)
			end,
			max_width = function()
				return math.floor(vim.o.columns * 0.75)
			end,
			on_open = function(win)
				vim.api.nvim_win_set_config(win, { zindex = 100 })
			end,
		},
		init = function()
			-- use nvim-notify as the default notification function
			vim.notify = require("notify")
		end,
	},
}
