status is-interactive; or exit 0

if [ -e /usr/share/fzf/key-bindings.fish ]
	source /usr/share/fzf/key-bindings.fish
end
if type -q fzf_key_bindings
	fzf_key_bindings
end
