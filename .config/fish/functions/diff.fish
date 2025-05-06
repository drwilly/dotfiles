if command -v git >/dev/null
	function diff --wraps "git diff"
		command git diff --no-index $argv
	end
else if command -v colordiff >/dev/null
	function diff --wraps "colordiff"
		command colordiff $argv
	end
end
