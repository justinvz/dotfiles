#!/usr/bin/env bash

set -eu

DOTFILES_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)

link_config() {
  source_path=$1
  target_path=$2

  mkdir -p "$(dirname -- "$target_path")"

  if [ -L "$target_path" ]; then
    if [ "$(readlink -f -- "$target_path")" = "$(readlink -f -- "$source_path")" ]; then
      printf 'Already linked: %s\n' "$target_path"
      return
    fi
    printf 'Refusing to replace unrelated symlink: %s\n' "$target_path" >&2
    return 1
  fi

  if [ -e "$target_path" ]; then
    if [ -f "$source_path" ] && [ -f "$target_path" ] && cmp -s "$source_path" "$target_path"; then
      rm "$target_path"
    else
      printf 'Refusing to replace existing path: %s\n' "$target_path" >&2
      return 1
    fi
  fi

  ln -s "$source_path" "$target_path"
  printf 'Linked: %s -> %s\n' "$target_path" "$source_path"
}

clone_if_missing() {
  repository=$1
  destination=$2

  if [ -d "$destination" ]; then
    return
  fi

  mkdir -p "$(dirname -- "$destination")"
  git clone --depth=1 "$repository" "$destination"
}

command -v git >/dev/null 2>&1 || {
  printf 'git is required to install dotfile dependencies.\n' >&2
  exit 1
}

link_config "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"
link_config "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
link_config "$DOTFILES_DIR/zsh/.p10k.zsh" "$HOME/.p10k.zsh"
link_config "$DOTFILES_DIR/_sesh" "$HOME/.zsh/completions/_sesh"
link_config "$DOTFILES_DIR/tmux/.tmux.conf" "$HOME/.tmux.conf"
link_config "$DOTFILES_DIR/sesh" "$HOME/.config/sesh"

clone_if_missing https://github.com/ohmyzsh/ohmyzsh.git "$HOME/.oh-my-zsh"
clone_if_missing https://github.com/romkatv/powerlevel10k.git "$HOME/.oh-my-zsh/custom/themes/powerlevel10k"
clone_if_missing https://github.com/zsh-users/zsh-autosuggestions "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
clone_if_missing https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"
clone_if_missing https://github.com/zsh-users/zsh-completions.git "$HOME/.oh-my-zsh/custom/plugins/zsh-completions"
clone_if_missing https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"

if command -v tmux >/dev/null 2>&1 && [ -x "$HOME/.tmux/plugins/tpm/bin/install_plugins" ]; then
  "$HOME/.tmux/plugins/tpm/bin/install_plugins"
fi

if command -v zoxide >/dev/null 2>&1; then
  for project_root in "$HOME/work_git" "$HOME/workspace" "$HOME/school"; do
    [ -d "$project_root" ] || continue
    for project in "$project_root"/*; do
      [ -d "$project" ] || continue
      zoxide add "$project"
    done
  done
fi

printf 'Dotfiles installed. Put machine-specific Zsh settings in ~/.zshrc.local.\n'
