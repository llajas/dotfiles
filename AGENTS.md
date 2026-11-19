# AGENTS.md

## Build/Validation Commands
- `chezmoi apply --dry-run` or `chezmoi diff` - Preview changes before applying
- `chezmoi doctor` - Diagnose templating or permission issues
- `ANSIBLE_CONFIG=dot_init-playbooks/ansible.cfg ansible-playbook dot_init-playbooks/bootstrap.yml --check` - Validate Ansible changes

## Code Style Guidelines
- **Scripts**: Use `set -euo pipefail` at the top; keep POSIX/bash compliant and idempotent
- **Comments**: Sparse style; only add comments when behavior is non-obvious (e.g., templated edge cases)
- **Naming**: Follow existing Kubernetes/Terraform alias conventions (`kc`, `tf`, `cz`); match helper naming in `functions/simpleKubernetes.zsh`
- **Secrets**: Wrap 1Password access in `opAll.zsh.tmpl` helper functions (`op`, `opDoc`, `creds`); never call `op` directly
- **Permissions**: Keep 700/600 on sensitive files in `~/.config/op` or kubeconfig paths

## Chezmoi Conventions
- `dot_*` paths become `~/.dotfiles/*` or `~/*` after apply (e.g., `dot_zshrc` -> `~/.zshrc`)
- `run_once_*` scripts execute once per host; `run_onchange_*` rerun when source changes
- Templates in `.chezmoitemplates/` render into playbooks and shell configs
- New `.zsh` files in `~/.dotfiles/{aliases,exports,functions}` auto-load via `dot_zshrc`

See `.github/copilot-instructions.md` for detailed repo layout and workflow guidance.
