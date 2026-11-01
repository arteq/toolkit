apt install \
    zsh \
    zsh-syntax-highlighting \
    git \
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

curl -s https://ohmyposh.dev/install.sh | bash -s

which zsh
chsh


ln -s ~/.arteq/config/zsh ~/.config/zsh
ln -s ~/.config/zsh/.zshenv ~/.zshenv
ln -s ~/.config/zsh/.zshrc ~/.zshrc
ln -s ~/.config/git/gitconfig ~/.gitconfig
