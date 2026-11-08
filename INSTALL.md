# Toolkit

## Packages install
```sh
apt install \
    zsh \
    zsh-syntax-highlighting \
    git \
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

## Oh My Posh
`curl -s https://ohmyposh.dev/install.sh | bash -s`

## Update default shell
```sh
which zsh
chsh
```


## Run install script
`./install.sh`

The script moves the repository to `~/.config_git`, creates the required
directories, links the config files (existing targets are renamed to
`<name>.<unix timestamp>`) and installs the Neovim plugins.

### Manual install
```sh
mv <repo dir> ~/.config_git

mkdir -p ~/.config
mkdir -p ~/.local/state/zsh
mkdir -p ~/.local/share/zsh/plugins
mkdir -p ~/.cache/zsh

ln -s ~/.config_git/config/zsh ~/.config/zsh
ln -s ~/.config_git/config/git ~/.config/git
ln -s ~/.config_git/config/herdr ~/.config/herdr
ln -s ~/.config_git/config/nvim ~/.config/nvim
ln -s ~/.config_git/config/zsh/zshenv ~/.zshenv
ln -s ~/.config_git/config/zsh/zshrc ~/.zshrc
ln -s ~/.config_git/config/git/gitconfig ~/.gitconfig
ln -s ~/.config_git/config/tmux/tmux.conf ~/.tmux.conf
```

## First run
- zsh plugins are cloned automatically on the first shell start; update them with `zplugin-update`.
- Neovim bootstraps vim-plug and installs plugins on the first start (`:PlugUpdate` to update).
