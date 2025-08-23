# Dotfiles & System Configuration

This repository contains configuration files and scripts tailored primarily for macOS. Many configurations are system-specific, while those in the `shell/` directory are designed to work on both macOS and Linux.

## Programs & Tools

- **Operating System:** macOS
- **Window Manager:** aerospace
- **Terminal:** wezterm with zellij
- **Shell:** zsh with pretzo
- **Editors:** helix / neovim
  [Neovim Configuration](https://github.com/sawadashota/feovim)

## Project Structure

- **flake.nix**
  Entry point for macOS configuration via `darwinConfigurations.macmini`.
- **darwin/**
  Contains nix-darwin configuration.
- **home-manager/**
  Contains home-manager configuration.
- **shell/**
  Cross-platform shell configuration (also works on Linux).
- **github.com:sawadashota/feovim**
  Neovim configuration repository.

## macOS Setup & Installation

Run the following commands to install and configure your system:

```bash
# Installation
sh <(curl -L https://nixos.org/nix/install)

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

git clone git@github.com:sawadashota/nixpkgs.git ~/.nixpkgs

# Ensure your hostname is set to "macmini"
sudo reboot
```

### Building & Switching

```bash
cd ~/.nixpkgs
nix --experimental-features "nix-command flakes" build ".#darwinConfigurations.macmini.system"
./result/sw/bin/darwin-rebuild switch --flake ~/.nixpkgs
```

For a streamlined command:

```bash
sudo nix run nix-darwin -- switch --flake ~/.nixpkgs
```

## Manual Configuration Steps

- Reboot to enable IME.
- Configure 1Password:
  - Developer setup via SSH/CLI.
  - Browser setup through Google Chrome.
- Set up applications:
  - Raycast (use import/export)
  - Meetingbar
  - Hiddenbar
  - Time-Out
- Enable iCloud sync.
- Log in to VSCode for settings sync.
- Enable key repeat in Vim integrations for IntelliJ and VSCode.
- Optionally, download and install:
  - [CleanShot X](https://licenses.cleanshot.com/download/cleanshotx)
  - [iStat Menus 7](https://apps.apple.com/jp/app/istat-menus-7/id6499559693?l=en-US&mt=12)
    (Download the helper tool from [Bjango](https://bjango.com/help/istatmenus7/helper/))

## Updating the System

- **Update all inputs:**

  ```bash
  nix flake update
  ```

- **Update a single input:**

  ```bash
  nix flake lock --update-input <input>
  ```

## License

(Add license information if applicable)
