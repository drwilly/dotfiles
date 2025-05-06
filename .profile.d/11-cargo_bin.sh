if [ -d "${CARGO_HOME:-$HOME/.cargo}/bin" ]
then export PATH="${CARGO_HOME:-$HOME/.cargo}/bin:$PATH"
fi
