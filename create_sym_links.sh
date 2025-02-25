#!/bin/zsh

# Define an array of directory/file names for .configs
d_config_targets=(
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
    "nvim"
)

# Define an array of directory/file names for root configs
root_config_targets=(
  ".zsh_history"
  ".zshrc"
)

# Loop through the array and run the ln command for each .config target
for target in "${d_config_targets[@]}"; do
  ln -s ~/dots/"$target" ~/.config/"$target"
done

# Loop through the array and run the ln command for each root target
for target in "${root_config_targets[@]}"; do
  ln -s ~/dots/"$target" ~/"$target"
done
