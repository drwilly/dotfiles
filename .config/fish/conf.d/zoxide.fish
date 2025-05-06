status is-interactive; or exit 0

if command -v zoxide >/dev/null
	zoxide init fish | source
end
