#!/usr/bin/env bash
# Sets up personal config files by symlinking them from this repository.
set -euo pipefail

TS="$(date +%s)"
TARGET_REPO="$HOME/.toolkit"
SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"

# Status helpers: each prefixes the message with an icon showing what happened.
log()     { printf '🔹 %s\n' "$*"; }        # neutral info / step
ok()      { printf '✅ %s\n' "$*"; }        # succeeded
skip()    { printf '⏭️  %s\n' "$*"; }       # nothing to do, already in place
path()    { printf '📂 %s\n' "$*"; }        # directory created
linked()  { printf '🔗 %s\n' "$*"; }        # symlink created
installing() { printf '⬇️  %s\n' "$*"; }       # installing something
warn()    { printf '⚠️  %s\n' "$*" >&2; }   # non-fatal problem
fail()    { printf '❌ %s\n' "$*" >&2; }    # failure

# If the target exists (and is not already the correct symlink), rename it
# to <name>.<unix timestamp>.
backup_if_exists() {
    local path="$1"
    if [ -e "$path" ] || [ -L "$path" ]; then
        path "Target exists, renaming $path -> $path.$TS"
        mv "$path" "$path.$TS"
    fi
}

make_dir() {
    local dir="$1"
    if [ -d "$dir" ] && [ ! -L "$dir" ]; then
        skip "Directory already exists: $dir"
        return
    fi
    backup_if_exists "$dir"
    path "Creating directory $dir"
    mkdir -p "$dir"
}

link() {
    local src="$1" dest="$2"
    if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$src" ]; then
        skip "Link already in place: $dest -> $src"
        return
    fi
    backup_if_exists "$dest"
    linked "Linking $dest -> $src"
    ln -s "$src" "$dest"
}

# 1. Move the repository to a hidden directory
if [ "$SRC" = "$TARGET_REPO" ]; then
    skip "Repository already located at $TARGET_REPO"
else
    backup_if_exists "$TARGET_REPO"
    path "Moving repository $SRC -> $TARGET_REPO"
    mv "$SRC" "$TARGET_REPO"
fi
REPO="$TARGET_REPO"
cd "$HOME"

# 2. Create necessary directories
make_dir "$HOME/.config"
make_dir "$HOME/.local/state/zsh"
make_dir "$HOME/.local/share/zsh/plugins"
make_dir "$HOME/.cache/zsh"

# 3. Link config files
link "$REPO/config/zsh"              "$HOME/.config/zsh"
link "$REPO/config/git"              "$HOME/.config/git"
link "$REPO/config/herdr"            "$HOME/.config/herdr"
link "$REPO/config/nvim"             "$HOME/.config/nvim"
link "$REPO/config/zsh/zshenv"       "$HOME/.zshenv"
link "$REPO/config/zsh/zshrc"        "$HOME/.zshrc"
link "$REPO/config/git/gitconfig"    "$HOME/.gitconfig"
link "$REPO/config/tmux/tmux.conf"   "$HOME/.tmux.conf"

# 4. Install Neovim plugins (vim-plug is bootstrapped by init.vim)
if command -v nvim >/dev/null 2>&1; then
    installing "Installing Neovim plugins (vim-plug bootstrap + PlugInstall)"
    if nvim --headless +'PlugInstall --sync' +qall; then
        ok "Neovim plugins installed"
    else
        fail "Neovim plugin install failed, run :PlugInstall manually"
    fi
else
    skip "nvim not found, skipping plugin install (install neovim and run nvim once)"
fi

# 5. Check external tools required by the linked configs
if ! command -v delta >/dev/null 2>&1; then
    warn "'delta' not found but git is configured to use it as pager (apt install git-delta)"
fi

ok "Done. Repository is now at $REPO. Start a new zsh session (see INSTALL.md for packages and chsh)."
