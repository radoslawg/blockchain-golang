#!/bin/bash

export XDG_CONFIG_HOME="$HOME"/.config
mkdir -p "$XDG_CONFIG_HOME"

ln -sf "$PWD/.config/nvim" "$XDG_CONFIG_HOME"/nvim

packages=(
    fd
    ripgrep
    npm
    neovim 
    fzf 
    zoxide 
)

# Iterate over the array and install each package
for package in "${packages[@]}"; do
  echo "Installing $package..."
  /home/linuxbrew/.linuxbrew/bin/brew install "$package"
done

go_packages=(
  golang.org/x/tools/gopls@latest
  github.com/incu6us/goimports-reviser/v3@latest
  mvdan.cc/gofumpt@latest
  github.com/segmentio/golines@latest
  github.com/go-delve/delve/cmd/dlv@latest
)

for go_package in "${go_packages[@]}"; do
  echo "Installing $go_package..."
  go install -v "$go_package"
done

go mod download

