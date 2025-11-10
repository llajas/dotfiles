## Repo Purpose
- Personal dotfiles managed via chezmoi; automated bootstrap spans shell configs, tool installs, and Ansible-driven package provisioning.

## Layout Cues
- Templates live under `.chezmoitemplates/` and render into playbooks, secrets exports, and Go-templated shell snippets.
- User-facing files drop into `dot_*` paths; chezmoi strips the `dot_` prefix when applying (e.g., `dot_zshrc` → `~/.zshrc`).
- `run_once_*` scripts execute a single time per host; `run_onchange_*` rerun when the source changes (notably the Ansible playbook launcher).
- Anything inside `.chezmoiexternal.yaml` is fetched as a binary/archive into `~/.local` or tool-specific locations.

## Provisioning Workflow
- Bootstrap expects Ansible: `run_once_00_install_ansible.sh.tmpl` installs it per distro using the rendered `.osid` fact.
- `run_onchange_01_apply_ansible_playbook.sh.tmpl` replays `dot_init-playbooks/bootstrap.yml` whenever packaged-software templates change; it assumes passwordless sudo or cached credentials.
- Package selection is determined by `.chezmoitemplates/packaged-software`; the list becomes `development_tools` for the `common_packages` role.
- Use `chezmoi apply --dry-run` or `chezmoi diff` before applying changes so chezmoi templates render safely.

## Secrets & 1Password
- All secret material flows through `dot_dotfiles/functions/opAll.zsh.tmpl`; behavior swaps between 1Password Connect (via `OP_CONNECT_HOST`) and interactive CLI sessions.
- Template identifiers (e.g., `.opIds.argocd`) supply UUID/field keys—add new secrets by extending the data source that renders those IDs.
- Scripts such as `run_01_pull_extra_functions_from_1password.sh.tmpl` and exports like `kubeContext.zsh.tmpl` rely on `op`, `opDoc`, and `creds`; keep permissions (700/600) intact when writing to `~/.config/op` or kubeconfig files.
- When introducing new secret-dependent tooling, wrap access in the same helper functions instead of calling `op` directly to preserve connect compatibility.

## Shell Environment
- `dot_zshrc` sources everything under `~/.dotfiles/{aliases,exports,functions}`; dropping a new `.zsh` file into those directories automatically loads it.
- Autocompletion loads from static files in `.dotfiles/autocompletion` and dynamically via `autocompletion/auto.zsh`; prefer adding new completions there instead of editing `~/.zshrc`.
- Aliases favor Kubernetes/Terraform tooling (`kc`, `tf`, `cz`) and kube helpers in `functions/simpleKubernetes.zsh`; keep naming consistent with that convention.
- Powerlevel10k configuration comes from `dot_p10k.zsh.tmpl`; expect chezmoi templating if you need host-specific prompt tweaks.

## External Tooling
- Neovim config, tmux base, oh-my-zsh, and various CLI binaries are consumed as upstream archives; update URLs or archive paths inside `.chezmoiexternal.yaml` when upstream layout shifts.
- `dot_config/tmux/tmux.conf.local` assumes gpakosz/.tmux defaults—stick to overriding knobs via the provided variables instead of editing the upstream template.
- Node.js LTS, Docker Buildx, kube/krew plugins, and GitHub CLI are pinned via helper templates (`get-node-latest-lts-version`, `get-github-latest-version`); ensure new tools reuse those helpers for automatic version bumps.

## Working Practices
- Validate Ansible changes locally with `ANSIBLE_CONFIG=dot_init-playbooks/ansible.cfg ansible-playbook dot_init-playbooks/bootstrap.yml --check` after rendering to confirm package lists.
- Keep scripts POSIX/bash compliant and idempotent; `set -euo pipefail` is expected in new run scripts.
- Honor ASCII output by default; match the repo’s sparse comment style—only add comments when behavior is non-obvious (e.g., templated edge cases).
- After modifying templated assets, run `chezmoi doctor` if behavior looks off; the command surfaces templating or permission issues early.
