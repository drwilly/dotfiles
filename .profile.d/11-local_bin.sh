if [ -d "${PYTHONUSERBASE:-$HOME/.local}/bin" ]
then export PATH="${PYTHONUSERBASE:-$HOME/.local}/bin:$PATH"
fi
