if [[ -d "/Applications/Postgres.app/" ]]; then 
    export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"
fi

if [[ -x "$(command -v /usr/local/MacGPG2/bin/gpgconf)" ]]; then
    export SSH_AUTH_SOCK=$(/usr/local/MacGPG2/bin/gpgconf --list-dirs agent-ssh-socket)
    (/usr/local/MacGPG2/bin/gpgconf --launch gpg-agent &)
fi
