return {
	-- The world-famous gruvbox colorscheme
	{
		"ellisonleao/gruvbox.nvim",
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

	-- Better vim.ui
	{
		"stevearc/dressing.nvim",
		lazy = true,
		init = function()
			---@diagnostic disable-next-line: duplicate-set-field
			vim.ui.select = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.select(...)
			end
			---@diagnostic disable-next-line: duplicate-set-field
			vim.ui.input = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.input(...)
			end
		end,
	},

	-- Fancy tabs
	{
		"akinsho/bufferline.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		event = "VeryLazy",
		keys = {
			{ "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin" },
			{ "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
			{ "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", desc = "Delete Other Buffers" },
			{ "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete Buffers to the Right" },
			{ "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete Buffers to the Left" },
			{ "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
			{ "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
			{ "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
			{ "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
		},
		opts = {
			options = {
				always_show_bufferline = false, -- do not show bufferline in situations where you only have a single buffer, etc.
				offsets = {
					{
						filetype = "neo-tree",
						text = "Neo-tree",
						highlight = "Directory",
						text_align = "left",
					},
				},
			},
		},
	},

	-- Fancy and lightweight statusline
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					theme = "auto",
				},
			})
		end,
	},

	-- Indent guides
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "VeryLazy",
		opts = {
			indent = {
				char = "│",
				tab_char = "│",
			},
			scope = { enabled = false },
			exclude = {
				filetypes = {
					"help",
					"alpha",
					"dashboard",
					"neo-tree",
					"Trouble",
					"trouble",
					"lazy",
					"mason",
					"notify",
					"toggleterm",
					"lazyterm",
				},
			},
		},
		main = "ibl",
	},

	-- Animated highlight of the current indentation level
	{
		"echasnovski/mini.indentscope",
		event = "VeryLazy",
		opts = {
			-- symbol = "▏",
			symbol = "│",
			options = { try_as_border = true },
		},
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = {
					"help",
					"alpha",
					"dashboard",
					"neo-tree",
					"Trouble",
					"trouble",
					"lazy",
					"mason",
					"notify",
					"toggleterm",
					"lazyterm",
				},
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
		end,
	},

	-- Displays a popup with possible key bindings of the command you started typing
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {},
	},

	-- Fancy icons
	{ "nvim-tree/nvim-web-devicons", lazy = true },

	-- Dashboard when starting nvim
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		opts = function()
			local logo = [[
                    █    ██  ██▓  ▄▄▄█████▓ ██▀███  ▄▄▄                    
                    ██  ▓██▒▓██▒  ▓  ██▒ ▓▒▓██ ▒ ██▒████▄                  
                   ▓██  ▒██░▒██░  ▒ ▓██░ ▒░▓██ ░▄█ ▒██  ▀█▄                
                   ▓▓█  ░██░▒██░  ░ ▓██▓ ░ ▒██▀▀█▄ ░██▄▄▄▄██               
                   ▒▒█████▓ ░██████▒▒██▒ ░ ░██▓ ▒██▒▓█   ▓██▒              
                   ░▒▓▒ ▒ ▒ ░ ▒░▓  ░▒ ░░   ░ ▒▓ ░▒▓░▒▒   ▓▒█░              
                   ░░▒░ ░ ░ ░ ░ ▒  ░  ░      ░▒ ░ ▒░ ▒   ▒▒ ░              
                    ░░░ ░ ░   ░ ░   ░        ░░   ░  ░   ▒                 
        ▒███████▒ ▄▄▄ ░    █    ██ ░▄▄▄▄   ▓█████  ██▀███░ ▓█████  ██▀███  
        ▒ ▒ ▒ ▄▀░▒████▄    ██  ▓██▒▓█████▄ ▓█   ▀ ▓██ ▒ ██▒▓█   ▀ ▓██ ▒ ██▒
        ░ ▒ ▄▀▒░ ▒██  ▀█▄ ▓██  ▒██░▒██▒ ▄██▒███   ▓██ ░▄█ ▒▒███   ▓██ ░▄█ ▒
          ▄▀▒   ░░██▄▄▄▄██▓▓█  ░██░▒██░█▀  ▒▓█  ▄ ▒██▀▀█▄  ▒▓█  ▄ ▒██▀▀█▄  
        ▒███████▒ ▓█   ▓██▒▒█████▓ ░▓█  ▀█▓░▒████▒░██▓ ▒██▒░▒████▒░██▓ ▒██▒
        ░▒▒ ▓░▒░▒ ▒▒   ▓▒█░▒▓▒ ▒ ▒ ░▒▓███▀▒░░ ▒░ ░░ ▒▓ ░▒▓░░░ ▒░ ░░ ▒▓ ░▒▓░
        ░░▒ ▒ ░ ▒  ▒   ▒▒ ░░▒░ ░ ░ ▒░▒   ░  ░ ░  ░  ░▒ ░ ▒░ ░ ░  ░  ░▒ ░ ▒░
        ░ ░ ░ ░ ░  ░   ▒   ░░░ ░ ░  ░    ░    ░     ░░   ░    ░     ░░   ░ 
          ░ ░          ░  ░  ░      ░         ░  ░   ░        ░  ░   ░     
        ░                                ░                                 
      ]]

			logo = string.rep("\n", 8) .. logo .. "\n\n"

			local opts = {
				theme = "doom",
				hide = {
					-- this is taken care of by lualine
					-- enabling this messes up the actual laststatus setting after loading a file
					statusline = false,
				},
				config = {
					header = vim.split(logo, "\n"),
          -- stylua: ignore
          center = {
            -- { action = LazyVim.telescope("files"),                                    desc = " Find File",       icon = " ", key = "f" },
            { action = "ene | startinsert",                                        desc = " New File",        icon = " ", key = "n" },
            { action = "Telescope oldfiles",                                       desc = " Recent Files",    icon = " ", key = "r" },
            { action = "Telescope live_grep",                                      desc = " Find Text",       icon = " ", key = "g" },
            { action = [[lua LazyVim.telescope.config_files()()]], desc = " Config",          icon = " ", key = "c" },
            { action = 'lua require("persistence").load()',                        desc = " Restore Session", icon = " ", key = "s" },
            { action = "LazyExtras",                                               desc = " Lazy Extras",     icon = " ", key = "x" },
            { action = "Lazy",                                                     desc = " Lazy",            icon = "󰒲 ", key = "l" },
            { action = "qa",                                                       desc = " Quit",            icon = " ", key = "q" },
          },
					footer = function()
						local stats = require("lazy").stats()
						local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
						return {
							"⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms",
						}
					end,
				},
			}

			for _, button in ipairs(opts.config.center) do
				button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
				button.key_format = "  %s"
			end

			-- close Lazy and re-open when the dashboard is ready
			if vim.o.filetype == "lazy" then
				vim.cmd.close()
				vim.api.nvim_create_autocmd("User", {
					pattern = "DashboardLoaded",
					callback = function()
						require("lazy").show()
					end,
				})
			end

			return opts
		end,
	},
}
