FROM fedora:latest

RUN dnf copr enable -y dejan/lazygit && \
    dnf install -y git lazygit fd-find curl ripgrep tree-sitter-cli neovim gcc unzip

RUN git clone https://github.com/LazyVim/starter ~/.config/nvim && \
    rm -rf ~/.config/nvim/.git

WORKDIR /root

CMD ["nvim"]
