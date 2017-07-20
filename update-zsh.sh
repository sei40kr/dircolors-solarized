#!/bin/sh

main() {
  find . -maxdepth 1 -type f -name 'dircolors.*' | grep -Pve '\.zsh$' | while read -r src
do
  dircolors="$(dircolors "$src")"
  cat >"${src}.zsh" <<EOF
#!/usr/bin/env zsh

${dircolors}

zstyle ':completion:*' list-colors "\${(s.:.)LS_COLORS}"

EOF
done
}

main

