# my dotfiles

i currently only use macos as my daily driver so this repository is really
system specific. everything inside `shell/` also works on linux.

## programs

- distro: macOS
- window manager: aerospace
- terminal: wezterm + zellij
- shell: zsh + pretzo
- editor: helix / neovim
  ([configuration](https://github.com/sawadashota/feovim))

## architecture

- `flake.nix`
  - `darwinConfigurations.macmini` is the entrypoint for macOS
- `darwin/` nix-darwin configuration
- `home-manager/` home-manager configuration
- `shell/` cross-platform shell configuration
- `github.com:sawadashota/feovim` neovim configuration

## macos

```bash
# installation
sh <(curl -L https://nixos.org/nix/install)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
git clone git@github.com:sawadashota/nixpkgs.git ~/.nixpkgs
# make sure your hostname is set to "macmini"
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
- Download [CleanShot X](https://licenses.cleanshot.com/download/cleanshotx) if you want
- Install [iStat Menu 7](https://apps.apple.com/jp/app/istat-menus-7/id6499559693?l=en-US&mt=12)
  - Download helper tool from [here](https://bjango.com/help/istatmenus7/helper/)

## update

```bash
# all inputs
nix flake update

# single input
nix flake lock --update-input <input>
```
