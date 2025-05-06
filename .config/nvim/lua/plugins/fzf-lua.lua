return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	-- dependencies = { "nvim-tree/nvim-web-devicons" },
	-- or if using mini.icons/mini.nvim
	dependencies = { "echasnovski/mini.icons" },
	opts = {},
	config = function()
		require('fzf-lua').setup {}

		vim.keymap.set('n', '<leader>ff', FzfLua.files, { desc = 'find files' })
		vim.keymap.set('n', '<leader>fg', FzfLua.grep, { desc = 'live grep' })
		vim.keymap.set('n', '<leader>fb', FzfLua.buffers, { desc = 'buffers' })
		vim.keymap.set('n', '<leader>fh', FzfLua.helptags, { desc = 'help tags' })
	end,
}
