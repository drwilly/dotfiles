return {
	-- AI
	{
		"frankroeder/parrot.nvim",
		dependencies = { 'ibhagwan/fzf-lua', 'nvim-lua/plenary.nvim' },
		-- optionally include "folke/noice.nvim" or "rcarriga/nvim-notify" for beautiful notifications
		config = function()
			require("parrot").setup {
				-- Providers must be explicitly added to make them available.
				providers = {
					anthropic = {
						api_key = os.getenv "ANTHROPIC_API_KEY"
					},
				},
				prompts = {
					[".pytype"] = [[
I have the following code from {{filename}}:

```{{filetype}}
{{filecontent}}
```

Please look at the following section specifically:
```{{filetype}}
{{selection}}
```

Extend the code with sensible type-annotations.
Follow the indentation style of the surrounding code.
Respond just with the snippet of code that should be inserted.
]],
				},
				hooks = {},
			}
		end,
	},
}
