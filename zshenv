export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

if [[ -x "$(command -v nvim)" ]]; then
    export EDITOR="nvim"
else
    export EDITOR="vim"
fi
export VISUAL="$EDITOR"

if [[ -d "/Applications/Postgres.app/" ]]; then 
    export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"
fi

if [[ -x "$(command -v /usr/local/MacGPG2/bin/gpgconf)" ]]; then
    export SSH_AUTH_SOCK=$(/usr/local/MacGPG2/bin/gpgconf --list-dirs agent-ssh-socket)
    (/usr/local/MacGPG2/bin/gpgconf --launch gpg-agent &)
fi
