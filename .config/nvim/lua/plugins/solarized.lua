return {
	-- dir = "~/src/nvim-solarized-lua",
	'drwilly/nvim-solarized-lua',
	lazy = false,
	priority = 999,
	config = function()
		if vim.g.neovide then
			vim.cmd [[colorscheme solarized]]
		else
			vim.cmd [[colorscheme solarized-term]]
		end
	end,
}
