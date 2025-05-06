for sh in $HOME/.profile.d/*.sh
do [ -x "$sh" ] && . "$sh"
done
