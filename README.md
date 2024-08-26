# my dotfiles

i currently only use macos as my daily driver so this repository is really
system specific. everything inside `shell/` also works on linux.

## programs

- distro: macOS
- window manager: aerospace
- bar: spacebar
- terminal: alacritty + zellij
- shell: zsh + pretzo
- editor: helix / neovim
  ([configuration](https://github.com/breuerfelix/feovim))

## architecture

- `flake.nix`
  - `darwinConfigurations.macmini.private` is the entrypoint for macOS
- `darwin/` nix-darwin configuration
- `home-manager/` home-manager configuration
- `shell/` cross-platform shell configuration
- `github.com:breuerfelix/feovim` neovim configuration

## macos

```bash
# installation
sh <(curl -L https://nixos.org/nix/install)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
git clone git@github.com:sawadashota/nixpkgs.git ~/.nixpkgs
# make sure your hostname is set to "macmini.private"
sudo reboot

# build the system
cd ~/.nixpkgs
nix --experimental-features "nix-command flakes" build ".#darwinConfigurations.macmini.system"
# switch to new system
./result/sw/bin/darwin-rebuild switch --flake ~/.nixpkgs

# all in one command
nix run nix-darwin -- switch --flake ~/.nixpkgs
```

manual steps:

- Reboot to enable IME
- Configure 1Password
  - Developer: SSH / CLI
  - Browser: Google Chrome
- enable brew services
  - `brew services start sketchybar`
- Docker
  - `colima start`
  - `sudo ln -sf $HOME/.colima/default/docker.sock /var/run/docker.sock`
- configure applications
  - raycast (use import / export)
  - meetingbar
  - hiddenbar
  - time-out
- enable icloud sync
- login to vscode for settings sync
- enable key repeat for vim extension in intellij and vscode
  - `defaults write -g ApplePressAndHoldEnabled -bool false`
- connect bluetooth keyboard and select `disable internal keyboard`

## update

```bash
# all inputs
nix flake update

# single input
nix flake lock --update-input <input>
```
