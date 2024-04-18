return {
	-- file explorer
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		-- keys = {
		-- 	-- {
		-- 	-- "<leader>fe",
		-- 	-- function()
		-- 	-- 	require("neo-tree.command").execute({ toggle = true, dir = LazyVim.root() })
		-- 	-- end,
		-- 	-- desc = "Explorer NeoTree (Root Dir)",
		-- 	-- },
		-- 	{
		-- 		"<leader>fE",
		-- 		function()
		-- 			require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
		-- 		end,
		-- 		desc = "Explorer NeoTree (cwd)",
		-- 	},
		-- 	-- { "<leader>e", "<leader>fe", desc = "Explorer NeoTree (Root Dir)", remap = true },
		-- 	{ "<leader>E", "<leader>fE", desc = "Explorer NeoTree (cwd)", remap = true },
		-- 	{
		-- 		"<leader>ge",
		-- 		function()
		-- 			require("neo-tree.command").execute({ source = "git_status", toggle = true })
		-- 		end,
		-- 		desc = "Git Explorer",
		-- 	},
		-- 	{
		-- 		"<leader>be",
		-- 		function()
		-- 			require("neo-tree.command").execute({ source = "buffers", toggle = true })
		-- 		end,
		-- 		desc = "Buffer Explorer",
		-- 	},
		-- },
		cmd = "Neotree",
		deactivate = function()
			vim.cmd([[Neotree close]])
		end,
	},
}
