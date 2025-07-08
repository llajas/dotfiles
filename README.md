# Dotfile configuration

This repository contains my personal dotfiles, managed with [chezmoi](https://www.chezmoi.io/what-does-chezmoi-do). It automates the setup of my development environment across Linux and macOS, handling everything from shell configuration to CLI tools and editor plugins.

## Overview & Flow

There is a major split in how software is installed and managed in this repo:

- **Prebuilt binaries** are installed via the `.chezmoiexternal.yaml` file. This file defines all tools that can be downloaded as prebuilt binaries for your OS and architecture (e.g., fastfetch, cpufetch, gh, fzf, etc.). Most are extracted to `~/.local/bin` and made executable automatically. If a binary is not available for your platform, chezmoi will simply skip it—no errors will be thrown.
- **Packaged software** (anything not available as a prebuilt binary) is installed via an Ansible playbook. The list of such packages is defined in `.chezmoitemplates/packaged-software`, which is rendered into the playbook's variables. The playbook makes a best-effort attempt to install the correct package for your OS and package manager (e.g., apt, dnf, pacman, brew).

**chezmoi** is used to manage and apply all dotfiles, templates, and scripts. It ensures reproducibility and easy migration between machines.
**Templates** are used for files that require system-specific values (e.g., architecture, OS, usernames). These are rendered at apply-time.
**Quality of life tools** like oh-my-zsh, tmux, and neovim plugins are included and set up automatically.
**Ansible** is used for more complex provisioning, such as installing packages that are not available as a binary release as well as configuring system-wide settings. The playbook is triggered via a `run_onchange` script.

## 1Password Integration

This repo supports two approaches for loading secure items from 1Password, determined by chezmoi templating:

- If the `OP_CONNECT_HOST` environment variable is present, the repo uses 1Password Connect (service-account, non-interactive mode). Functions in `dot_dotfiles/functions/opAll.zsh.tmpl` are adapted to use the Connect API for seamless, unattended secrets access.
- If `OP_CONNECT_HOST` is not set, the repo falls back to classic interactive mode, prompting for sign-in as needed. The same functions mutate their behavior to use the interactive CLI.

This dual approach ensures secrets are loaded securely and conveniently, regardless of environment.

## Exceptions & Special Cases

- Some binaries are only available for certain architectures or OSes. The templates in `.chezmoiexternal.yaml` handle these cases, so unsupported binaries are skipped.
- Some files (like `onefetch`) are only installed on `amd64` systems, as upstream does not provide arm64 builds.
- The repo uses both direct file downloads and archive extraction, depending on how upstream distributes releases.
- Some scripts and templates use Go templating and chezmoi variables to adapt to your environment.

## Installation

1. [Install chezmoi](https://www.chezmoi.io/install/):

```bash
GITHUB_USERNAME=llajas
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply $GITHUB_USERNAME
```

This will clone the repo, apply all dotfiles, download binaries, and run any provisioning scripts. You can re-apply at any time with `chezmoi apply`.

## Included Tools & Features

- Zsh configuration with oh-my-zsh, plugins, and powerlevel10k theme
- Tmux configuration and plugins
- Neovim configuration and plugins
- CLI tools: gh, fzf, jq, yq, argocd, helm, kubectl, terraform, fastfetch, cpufetch, and more
- Custom aliases, completions, and functions
- Ansible playbook for system provisioning

## Contributing

Feel free to use this as a reference or copy it entirely. If you have questions or suggestions, open an issue or pull request.