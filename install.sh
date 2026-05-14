#!/usr/bin/env bash
# Symlinks dotfiles into $HOME. Backs up existing real files to *.backup.
# Idempotent: re-running is safe.

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

link() {
  local src="$DOTFILES_DIR/$1"
  local dest="$HOME/$2"

  if [ ! -e "$src" ]; then
    echo "skip $2 (source missing: $src)"
    return
  fi

  if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$src" ]; then
    echo "ok   $2 -> $src"
    return
  fi

  if [ -e "$dest" ] || [ -L "$dest" ]; then
    local backup="$dest.backup.$(date +%Y%m%d%H%M%S)"
    echo "back $dest -> $backup"
    mv "$dest" "$backup"
  fi

  ln -s "$src" "$dest"
  echo "link $2 -> $src"
}

link vimrc   .vimrc
link zshrc   .zshrc

if [ ! -e "$HOME/.zshrc.local" ]; then
  echo
  echo "note: ~/.zshrc.local does not exist."
  echo "      copy $DOTFILES_DIR/zshrc.local.example to ~/.zshrc.local"
  echo "      and add any machine- or work-specific settings."
fi
