-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
	{
		"windwp/nvim-autopairs",
		dependencies = { "hrsh7th/nvim-cmp" },
		opts = {
			fast_wrap = {},
			diable_filetype = { "TelescopePrompt", "vim" },
		},
		config = function(_, opts)
			require("nvim-autopairs").setup(opts)

			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		cmd = { "NvimTreeToggle", "NvimTreeFocux" },
		opts = function ()
			return require("custom.plugins.configs.nvimtree")
		end,
		config = function (_, opts)
			require("nvim-tree").setup(opts)
		end,
	},
	{
		"github/copilot.vim"
	},
	{
		"ThePrimeagen/harpoon",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("harpoon").setup()

			local mark = require("harpoon.mark")
			local ui = require("harpoon.ui")

			vim.keymap.set("n", "<leader>hm", mark.add_file)
			vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

			vim.keymap.set("n", "<M-1>", function() ui.nav_file(1) end)
			vim.keymap.set("n", "<M-2>", function() ui.nav_file(2) end)
			vim.keymap.set("n", "<M-3>", function() ui.nav_file(3) end)
			vim.keymap.set("n", "<M-4>", function() ui.nav_file(4) end)

			vim.keymap.set("n", "<leader>hn", function() ui.nav_next() end)
			vim.keymap.set("n", "<leader>hp", function() ui.nav_prev() end)


			-- vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
			-- vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end)
			-- vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end)
			-- vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end)
		end,
	}
}
