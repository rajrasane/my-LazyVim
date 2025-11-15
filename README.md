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

## Customization

Your custom LazyVim configurations (plugins, keymaps, etc.) should be placed in the `lua/custom` directory within this repository. These will be automatically picked up by LazyVim when you run `nvimd`.

For example, to add a new plugin, you would create a file like `lua/custom/plugins/my-plugin.lua`.

```lua
return {
  "owner/my-plugin",
  name = "My Plugin",
  -- further configuration
}
```
