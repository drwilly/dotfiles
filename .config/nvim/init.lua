vim.opt.wrap = false
vim.opt.tabstop = 3
vim.opt.shiftwidth = 0 -- use opt.tabstop
vim.opt.expandtab = false
vim.opt.scrolloff = 5
vim.opt.number = true

vim.opt.background = 'dark' -- controlled by terminal, which defaults to dark
vim.opt.termguicolors = false

--Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not select, force to select one from the menu
-- shortness: avoid showing extra messages when using completion
-- updatetime: set updatetime for CursorHold
vim.opt.completeopt = { 'menuone', 'noselect', 'noinsert' }
vim.opt.shortmess = vim.opt.shortmess + { c = true }
vim.opt.updatetime = 300

-- Fixed column for diagnostics to appear
vim.opt.signcolumn = 'yes:1'

-- stop overriding my settings :C
vim.g.python_recommended_style = 0



-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out,                            "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup("plugins")



-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- Show autodiagnostic popup on cursor hover_range
--vim.cmd([[ autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false }) ]])
vim.keymap.set(
	'n',
	'<leader>ud',
	function()
		vim.diagnostic.config({
			virtual_lines = not vim.diagnostic.config().virtual_lines
		})
	end,
	{ desc = 'Toggle diagnostic virtual_lines' }
)


-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('LspKeymaps', {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local keymaps = {
			-- {mode(s), keys, fn, desc}
			{ 'n',          '<C-k>',      vim.lsp.buf.signature_help,                                              'signature help' },
			{ 'n',          'gd',         vim.lsp.buf.definition,                                                  'Go to definition' },
			{ 'n',          'gD',         vim.lsp.buf.declaration,                                                 'Go to declaration' },
			{ 'n',          'gi',         vim.lsp.buf.implementation,                                              'Go to implementations' },
			{ 'n',          'go',         vim.lsp.buf.type_definition,                                             'show definitions' },
			{ 'n',          'gr',         vim.lsp.buf.references,                                                  'references' },
			{ 'n',          '<leader>Wa', vim.lsp.buf.add_workspace_folder,                                        'add workspace' },
			{ 'n',          '<leader>Wr', vim.lsp.buf.remove_workspace_folder,                                     'delete workspace' },
			{ 'n',          '<leader>Wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, 'list workspaces' },
			{ 'n',          '<leader>cr', vim.lsp.buf.rename,                                                      'rename symbol' },
			{ { 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action,                                                 'code action' },
			{ { 'n', 'x' }, '<leader>cf', function() vim.lsp.buf.format { async = true } end,                      'format buffer' },
		}
		for _, keymap in ipairs(keymaps) do
			local opts = { buffer = ev.buf, desc = keymap[4] }
			vim.keymap.set(keymap[1], keymap[2], keymap[3], opts)
		end
	end,
})
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('LspDocumentHighlight', {}),
	callback = function(ev)
		local id = vim.tbl_get(ev, 'data', 'client_id')
		local client = id and vim.lsp.get_client_by_id(id)
		if client == nil or not client.supports_method('textDocument/documentHighlight') then
			return
		end

		local group = vim.api.nvim_create_augroup('highlight_symbol', { clear = false })

		vim.api.nvim_clear_autocmds({ buffer = ev.buf, group = group })

		vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
			group = group,
			buffer = ev.buf,
			callback = vim.lsp.buf.document_highlight,
		})

		vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
			group = group,
			buffer = ev.buf,
			callback = vim.lsp.buf.clear_references,
		})
	end,
})
