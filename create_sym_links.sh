#!/bin/zsh

# Define an array of directory/file names
targets=(
    "btop"
    "ghostty"
    "github-copilot"
    "kanata"
    "karabiner"
    "karabiner.edn"
    "lazy-nvim"
    "raycast"
    "spaceship.zsh"
    "spaceship.zsh.zwc"
    "zed"
)

# Loop through the array and run the ln command for each target
for target in "${targets[@]}"; do
  ln -s ~/dots/"$target" "$target"
done
