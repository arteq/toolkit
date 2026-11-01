# zmodload zsh/zprof

# =========================================================
# History
# =========================================================

HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=100000
SAVEHIST=100000

mkdir -p "${HISTFILE:h}"

setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS

# =========================================================
# Shell behaviour
# =========================================================

setopt AUTOCD
setopt NOBEEP
setopt NUMERIC_GLOB_SORT  # sort file10 after file9, not after file1

# =========================================================
# Smart directory navigation & lf
# =========================================================

# LF_ICONS=$(cat ~/.config/lf/icons | tr '\n' ':')
# export LF_ICONS

# =========================================================
# Completion
# =========================================================

# Load completion system
autoload -Uz compinit

# Initialize completion with cached metadata file
# (dir must exist or compinit silently fails to persist the dump and
# does a full, slow rebuild on every single shell start)
mkdir -p "$XDG_CACHE_HOME/zsh"
zcompdump="$XDG_CACHE_HOME/zsh/zcompdump"

# Skip the fpath security audit (compaudit) when the dump is fresh
# (<24h old); only pay that cost once a day instead of every start
if [[ -n "$zcompdump"(#qN.mh+24) ]]; then
  compinit -C -d "$zcompdump"
else
  compinit -d "$zcompdump"
fi
unset zcompdump

# Enable interactive completion menu selection
zstyle ':completion:*' menu select

# Make completion case-insensitive
# Example: "doc" can complete to "Documents"
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'  # lowercase input matches upper and lower

# =========================================================
# Fuzzy finder
# =========================================================

# Ubuntu / Debian
if [[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ]]; then
  source /usr/share/doc/fzf/examples/key-bindings.zsh
  source /usr/share/doc/fzf/examples/completion.zsh
fi

# =========================================================
# Modular Config Files
# =========================================================

# fzf configuration
source "$ZDOTDIR/fzf.zsh"

# Aliases
source "$ZDOTDIR/aliases.zsh"

# Syntax highlighting plugin
source "$ZDOTDIR/syntax-highlight.zsh"

# Plugins and plugin manager
# (must load before bindings.zsh: zsh-vi-mode defines the
# $ZVM_CURSOR_BLINKING_* constants that bindings.zsh reads)
source "$ZDOTDIR/plugins.zsh"

# Custom keybindings
source "$ZDOTDIR/bindings.zsh"

# Prompt/theme
source "$ZDOTDIR/prompt.zsh"


# =========================================================
# Node / NVM
# =========================================================
source "$ZDOTDIR/nvm.zsh"
