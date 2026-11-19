# Load completions dynamically for tools with native Zsh completion
for tool in kubectl gh chezmoi argocd helm op stern
do
  if [[ -x $(command -v $tool) ]]; then
    if [[ $tool == stern ]]; then
      completion_output="$(stern --completion zsh 2>/dev/null || true)"
    else
      completion_output="$($tool completion zsh 2>/dev/null || true)"
    fi
    # Only source if it looks like a Zsh completion (has #compdef)
    if grep -q '^#compdef' <<< "$completion_output"; then
      source <(echo "$completion_output")
    fi
  fi
done
