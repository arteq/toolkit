# Better ls
if command -v eza &> /dev/null; then
	alias ls='eza --icons --group-directories-first --time-style=long-iso --no-quotes'
	
	# Detailed listing
	alias ll='eza -lh --icons --git --group-directories-first --time-style=long-iso --no-quotes'
	
	# Detailed listing including hidden files
	alias la='eza -lah --icons --git --group-directories-first --time-style=long-iso --no-quotes'

	# Tree view
	alias tree='eza --tree --icons --time-style=long-iso'
	
	# Reuse ls completions for eza (avoids defining a separate completion function)
	compdef eza=ls
fi

# Better cat
if command -v batcat &> /dev/null; then
	# alias cat='bat'
	alias bat='batcat'
fi

# fd-find
alias fd='fdfind'

# =========================================================
# Core utilities
# =========================================================

if command -v rg &> /dev/null; then
	alias grep='rg --color=auto'
fi

alias diff='diff --color=auto'
alias df='df -h'

# =========================================================
# Navigation
# =========================================================

alias -- -='cd -'  # -- prevents - being parsed as a flag; cd - jumps to previous directory

lf() { # zsh follow lf navigation
    tmp=$(mktemp)
    command lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir=$(cat "$tmp")
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}

# =========================================================
# Programs
# =========================================================

alias vim='nvim'
alias code='/usr/share/code/code'
alias trans_en='trans -f pl -t en'

alias dmesg='sudo dmesg'
alias mpv=' mpv'

# =========================================================
# Paths
# =========================================================
alias memories='cd ~/www/cs/memories/app'
alias css='cd ~/www/cs/finanse/app'
alias skopos='cd ~/www/cs/css2'
alias fm='cd ~/www/nat/fm/app'
alias fm-shell='cd ~/www/nat/docker-fm; docker-compose exec www /bin/bash'

