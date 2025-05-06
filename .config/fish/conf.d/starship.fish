status is-interactive; or exit 0

if command -v starship >/dev/null
	starship init fish | source
end
