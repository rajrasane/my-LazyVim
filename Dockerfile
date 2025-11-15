FROM fedora:latest

RUN dnf copr enable -y dejan/lazygit && \
    dnf install -y git lazygit fd-find curl ripgrep tree-sitter-cli neovim gcc

RUN git clone https://github.com/LazyVim/starter ~/.config/nvim

WORKDIR /root

CMD ["nvim"]
