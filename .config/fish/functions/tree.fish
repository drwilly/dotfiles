if command -v eza >/dev/null
	function tree --wraps eza
		command eza --tree $argv
	end
else if command -v tree >/dev/null
	function tree --wraps tree
		command tree --dirsfirst $argv
	end
end
