# Dockerized LazyVim Setup

This repository contains a Docker-based setup for [LazyVim](https://www.lazyvim.org/), a powerful Neovim configuration. It allows you to run a consistent, feature-rich Neovim environment on any machine with Docker installed, keeping your configuration and plugins persistent.

## Features

- **Persistent Configuration:** Your plugins and settings are stored in a Docker volume (`lazyvim-data`), so they survive container restarts.
- **Isolated Environment:** Runs in a container, keeping your host system clean.
- **Pre-installed Tools:** Includes `git`, `lazygit`, `ripgrep`, `fd`, `curl`, `tree-sitter-cli`, `gcc`, and `unzip`.
- **Easy Alias:** Includes a shell function `nvimd` for seamless integration.

## Installation

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/rajrasane/my-LazyVim.git ~/lazyvim-docker
    cd ~/lazyvim-docker
    ```

2.  **Build the Docker image:**
    ```bash
    docker build -t lazyvim .
    ```

3.  **Add the alias to your shell:**
    Add the following function to your `~/.bashrc` or `~/.zshrc`:

    ```bash
    # Dockerized Neovim with LazyVim
    nvimd() {
      docker run -it --rm \
        -v "$(pwd)":/root/work \
        -v lazyvim-data:/root/.local/share/nvim \
        -v lazyvim-cache:/root/.cache/nvim \
        -v /etc/localtime:/etc/localtime:ro \
        -v /etc/timezone:/etc/timezone:ro \
        -w /root/work \
        lazyvim nvim "$@"
    }
    ```

4.  **Reload your shell:**
    ```bash
    source ~/.bashrc
    ```

## Usage

You can now use `nvimd` just like you would use `nvim`:

- **Open a file:**
  ```bash
  nvimd my_file.txt
  ```

- **Open the current directory:**
  ```bash
  nvimd .
  ```

## Customization

To add your own plugins or change settings, simply use LazyVim as usual. Since the `/root/.local/share/nvim` directory is persisted in the `lazyvim-data` volume, your changes will be saved automatically.