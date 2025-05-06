return {
	{
		'echasnovski/mini.nvim',
		version = false,
		config = function()
			require('mini.comment').setup {
				mappings = {
					comment = '<leader>cc',
					comment_line = '<leader>cc',
					comment_visual = '<leader>cc',
					textobject = 'gc',  -- `dgc` - delete comment block
				},
			}
			require('mini.icons').setup { style = 'ascii' }
			require('mini.indentscope').setup {
				draw = {
					animation = function(s, n) return 5 end,
				},
			}
			require('mini.pairs').setup {}
			require('mini.surround').setup {}
			--require('mini.tabline').setup {}

			vim.keymap.set('n', '<leader>ui', function() vim.b.miniindentscope_disable = not vim.b.miniindentscope_disable end, { desc = 'toggle indentscope (buffer)' })
			vim.keymap.set('n', '<leader>uI', function() vim.g.miniindentscope_disable = not vim.g.miniindentscope_disable end, { desc = 'toggle indentscope (global)' })
		end,
	},
}
