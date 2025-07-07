# ~/.dotfiles/functions/ghq.zsh
function ghql() {
  local repo=$(ghq list -p | fzf --height 40% --reverse --prompt="Select repo: ")
  if [[ -n $repo ]]; then
    cd "$repo"
  fi
}

function gclone() {
  local repo="$1"
  if [[ -z $repo ]]; then
    echo "Usage: gclone <username/repo> or gclone <full/path/to/repo>"
    return 1
  fi

  ghq clone -p "$repo"
}
