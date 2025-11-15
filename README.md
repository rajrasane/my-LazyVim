# My LazyVim Docker Setup

This repository contains a Dockerized Neovim setup with LazyVim, ensuring a consistent and reproducible development environment.

## Setup Instructions

1.  **Clone this repository:**
    ```bash
    git clone git@github.com:rajrasane/my-LazyVim.git
    cd my-LazyVim
    ```

2.  **Build the Docker image:**
    ```bash
    docker build -t lazyvim .
    ```

3.  **Add the `nvimd` function to your shell configuration (e.g., `~/.bashrc`):**
    This function allows you to run Neovim inside the Docker container, mounting your current working directory and persisting LazyVim's data.

    ```bash
    nvimd() {
      docker run -it --rm \
        -v "$(pwd)":/root/work \
        -v lazyvim-data:/root/.local/share/nvim \
        -v lazyvim-cache:/root/.cache/nvim \
        -w /root/work \
        lazyvim nvim "$@"
    }
    ```
    After adding, run `source ~/.bashrc` (or open a new terminal) to apply the changes.
