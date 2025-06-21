# ~/.dotfiles/init/opSessionManager.zsh.tmpl
# ------------------------------------------
# This file is rendered at `chezmoi apply` time.
# If OP_CONNECT_HOST *or* OP_SERVICE_ACCOUNT_TOKEN is already in the
# environment, we stub the function so it does nothing (Connect mode).
# Otherwise we keep the original interactive session-manager.

{{- if or (env "OP_CONNECT_HOST") (env "OP_SERVICE_ACCOUNT_TOKEN") }}

# ------------------------------------------------------------
# 1Password Connect / service-account detected → no interactive sign-in needed.
op_session_manager() { :; }   # noop

{{- else }}

# ------------------------------------------------------------
# Classic 1Password account session manager (original logic)
op_session_manager() {
  local session_dir="$HOME/.op_sessions"
  mkdir -p "$session_dir"
  chmod 700 "$session_dir"

  get_account_alias() { op account list --format json | jq -r '.[0].user_uuid'; }

  signin_op() {
    local account_alias="$1" session_file="$2" session_token
    if [[ -f $session_file ]]; then
      session_token=$(<"$session_file")
      export OP_SESSION_"$account_alias"="$session_token"
      if op account get >/dev/null 2>&1; then
        echo "✅ 1Password session for $account_alias is active."
        return 0
      else
        echo "⚠️  Session for $account_alias is invalid. Re-authenticating…"
        rm -f "$session_file"
      fi
    fi
    echo "🔑 Signing in to 1Password account $account_alias…"
    session_token=$(op signin --account "$account_alias" --raw) || {
      echo "❌ 1Password sign-in failed."; return 1; }
    echo "$session_token" >"$session_file"; chmod 600 "$session_file"
    export OP_SESSION_"$account_alias"="$session_token"
    echo "✅ Signed in to $account_alias successfully."
  }

  local account_alias; account_alias=$(get_account_alias) || return 1
  local session_file="$session_dir/session_$account_alias"
  signin_op "$account_alias" "$session_file"
}

# Initialize on load (interactive mode only):
op_session_manager

{{- end }}