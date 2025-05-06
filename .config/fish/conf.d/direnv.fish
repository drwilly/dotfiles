status is-interactive; or exit 0

if command -v direnv >/dev/null
	direnv hook fish | source
end
