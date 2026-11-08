#!/usr/bin/env bash
# Sets up personal config files by symlinking them from this repository.
set -euo pipefail

TS="$(date +%s)"
TARGET_REPO="$HOME/.config_git"
SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"

log() { printf '==> %s\n' "$*"; }

# If the target exists (and is not already the correct symlink), rename it
# to <name>.<unix timestamp>.
backup_if_exists() {
    local path="$1"
    if [ -e "$path" ] || [ -L "$path" ]; then
        log "Target exists, renaming $path -> $path.$TS"
        mv "$path" "$path.$TS"
    fi
}

make_dir() {
    local dir="$1"
    if [ -d "$dir" ] && [ ! -L "$dir" ]; then
        log "Directory already exists: $dir"
        return
    fi
    backup_if_exists "$dir"
    log "Creating directory $dir"
    mkdir -p "$dir"
}

link() {
    local src="$1" dest="$2"
    if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$src" ]; then
        log "Link already in place: $dest -> $src"
        return
    fi
    backup_if_exists "$dest"
    log "Linking $dest -> $src"
    ln -s "$src" "$dest"
}

# 1. Move the repository to a hidden directory
if [ "$SRC" = "$TARGET_REPO" ]; then
    log "Repository already located at $TARGET_REPO"
else
    backup_if_exists "$TARGET_REPO"
    log "Moving repository $SRC -> $TARGET_REPO"
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
link "$REPO/config/zsh/zshenv"       "$HOME/.zshenv"
link "$REPO/config/zsh/zshrc"        "$HOME/.zshrc"
link "$REPO/config/git/gitconfig"    "$HOME/.gitconfig"
link "$REPO/config/tmux/tmux.conf"   "$HOME/.tmux.conf"

log "Done. Repository is now at $REPO. Start a new zsh session (see INSTALL.md for packages and chsh)."
