function less --wraps less
	# The combination of fish, less and lesspipe causes problems
	# Input characters, even control-chars such as esc or arrow-keys would
	# end up as escape-sequences at the bottom of the window
	env SHELL=/bin/sh less $argv;
end
