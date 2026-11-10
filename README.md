# Toolkit

## Packages install
```sh
apt install \
    zsh \
    zsh-syntax-highlighting \
    git \
    git-delta \
    curl \
    wget \
    ca-certificates \
    tmux \
    neovim \
    htop \
    gpg \
    fzf \
    fuse \
    nodejs \
    eza
```

> `git-delta` provides the `delta` pager used by `config/git/gitconfig`
> (available in Debian 13+ / Ubuntu 24.04+; on older releases install the
> `.deb` from https://github.com/dandavison/delta/releases).

## Oh My Posh
`curl -s https://ohmyposh.dev/install.sh | bash -s`

## Update default shell
```sh
which zsh
chsh
```


## Run install script
`./install.sh`

The script moves the repository to `~/.toolkit`, creates the required
directories, links the config files (existing targets are renamed to
`<name>.<unix timestamp>`) and installs the Neovim plugins.

### Manual install
```sh
mv <repo dir> ~/.toolkit

mkdir -p ~/.config
mkdir -p ~/.local/state/zsh
mkdir -p ~/.local/share/zsh/plugins
mkdir -p ~/.cache/zsh

ln -s ~/.toolkit/config/zsh ~/.config/zsh
ln -s ~/.toolkit/config/git ~/.config/git
ln -s ~/.toolkit/config/herdr ~/.config/herdr
ln -s ~/.toolkit/config/nvim ~/.config/nvim
ln -s ~/.toolkit/config/zsh/zshenv ~/.zshenv
ln -s ~/.toolkit/config/zsh/zshrc ~/.zshrc
ln -s ~/.toolkit/config/git/gitconfig ~/.gitconfig
ln -s ~/.toolkit/config/tmux/tmux.conf ~/.tmux.conf
```

## First run
- zsh plugins are cloned automatically on the first shell start; update them with `zplugin-update`.
- Neovim bootstraps vim-plug and installs plugins on the first start (`:PlugUpdate` to update).
