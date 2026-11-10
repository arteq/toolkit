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

## Neovim (latest version)
The default Debian/Ubuntu repositories usually ship an outdated Neovim, and the
plugins used here (e.g. `telescope.nvim`, `coc.nvim`) need a recent one. Pick
one of the two methods below (`neovim` is intentionally not in the package list
above).

### Method 1: official release in your home directory (no sudo)
Nothing is written outside `$HOME`. `~/.local/bin` is already on `PATH` via
`config/zsh/zshenv`.
```sh
# x86_64 (use nvim-linux-arm64 on ARM)
cd "$(mktemp -d)"
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
mkdir -p ~/.local/opt ~/.local/bin
rm -rf ~/.local/opt/nvim-linux-x86_64
tar -C ~/.local/opt -xzf nvim-linux-x86_64.tar.gz
ln -sf ~/.local/opt/nvim-linux-x86_64/bin/nvim ~/.local/bin/nvim
nvim --version
```
Re-run the same commands to upgrade. Alternative: download
`nvim-linux-x86_64.appimage` from https://github.com/neovim/neovim/releases
(needs `fuse`), `chmod +x` it and save it as `~/.local/bin/nvim`.

### Method 2: apt through the `latest-debs` repository (requires sudo)
The repositories shipped with Debian carry an old Neovim, so enable the
third-party [`latest-debs`](https://github.com/latest-debs/apt-repo) repository
with `extrepo`. It rebuilds the upstream Neovim releases as `.deb` packages
(suites: bookworm, trixie, forky, sid), so the newest version is installed and
updated through plain `apt`.
```sh
sudo apt install extrepo
sudo extrepo enable latest-debs
sudo apt update
sudo apt install neovim
apt policy neovim   # should show the latest-debs repository as the candidate
nvim --version
```
> - `latest-debs` is a community project (best-effort, no SLA); a build can
>   appear a little after the upstream release. Use Method 1 if you need the
>   very newest version immediately or prefer not to add a third-party source.
> - If `extrepo enable latest-debs` reports an unknown repository, the local
>   `extrepo-data` is too old: run `sudo extrepo update` (or `sudo apt update &&
>   sudo apt upgrade extrepo-data`) and retry.
> - Undo with `sudo extrepo disable latest-debs`.
> - Ubuntu has no `extrepo` workflow here; use Method 1, or the PPA
>   `ppa:neovim-ppa/unstable` (`sudo add-apt-repository ppa:neovim-ppa/unstable`).

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
ln -s ~/.toolkit/config/git/gitconfig ~/.gitconfig
ln -s ~/.toolkit/config/tmux/tmux.conf ~/.tmux.conf
```

## First run
- zsh plugins are cloned automatically on the first shell start; update them with `zplugin-update`.
- Neovim bootstraps vim-plug and installs plugins on the first start (`:PlugUpdate` to update).
