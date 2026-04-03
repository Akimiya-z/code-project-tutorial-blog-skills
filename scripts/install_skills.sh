#!/usr/bin/env bash
set -euo pipefail

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
target_dir="${CODEX_HOME:-$HOME/.codex}/skills"

mkdir -p "$target_dir"

install_skill() {
  local name="$1"
  local src="$repo_dir/skills/$name"
  local dst="$target_dir/$name"

  if [[ ! -d "$src" ]]; then
    echo "missing skill directory: $src" >&2
    exit 1
  fi

  if [[ -L "$dst" ]]; then
    local current
    current="$(readlink "$dst")"
    if [[ "$current" == "$src" ]]; then
      echo "already linked: $name"
      return
    fi
    rm "$dst"
  elif [[ -e "$dst" ]]; then
    echo "refusing to overwrite existing path: $dst" >&2
    exit 1
  fi

  ln -s "$src" "$dst"
  echo "linked $name -> $dst"
}

install_skill "code-project-tutorial-generator"
install_skill "review-code-project-tutorial"

echo "skills installed in $target_dir"
