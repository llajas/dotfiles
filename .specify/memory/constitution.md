# Dotfiles Project Constitution

## Principles

### Preserve user data and make changes reversible

Automation must be idempotent and must not silently delete, overwrite, or expose user data. Destructive operations require explicit user confirmation and a clear recovery path.

### Keep configuration portable and consistent

Prefer existing repository patterns and platform-provided behavior. Account for Linux/macOS and host-specific differences where the configuration supports them; avoid speculative options and dependencies.

### Protect secrets

Never commit credentials. Access 1Password through the repository's helper functions, and preserve restrictive permissions on secret and kubeconfig files.

### Validate at the real boundary

Preview chezmoi changes before applying them. Validate Ansible changes in check mode and exercise scripts or commands through their user-facing surface when practical.

## Governance

These principles guide feature specifications, plans, implementation, and review. Repository instructions in `AGENTS.md` provide the operational details. Amend this constitution only when a principle changes; ordinary feature work does not require a version bump.

**Version**: 1.0.0 | **Ratified**: 2026-11-19 | **Last Amended**: 2026-11-19
