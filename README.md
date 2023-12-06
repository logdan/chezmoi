# logdan's dotfiles

> logdan's configuration files managed by [chezmoi](https://github.com/twpayne/chezmoi). Uses [Zsh](https://en.wikipedia.org/wiki/Z_shell), [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh/) for plugins and themes, [powerlevel10k](https://github.com/romkatv/powerlevel10k) as the theme. Has some helper scrips and aliases

## Installation/Setup

### One Command

Run `sh -c "$(curl -fsLS get.chezmoi.io/lb)" -- init --apply git@github.com:logdan/chezmoi.git` to get everything downloaded and installed or follow the individual steps below.

### Individual Steps

1. Install `chezmoi` by following [chezmoi's install guide](https://github.com/twpayne/chezmoi/blob/master/docs/INSTALL.md). You can learn more about `chezmoi` by reading their [quick start guide](https://github.com/twpayne/chezmoi/blob/master/docs/QUICKSTART.md) or [how-to guide](https://github.com/twpayne/chezmoi/blob/master/docs/HOWTO.md).

2. Initialize `chezmoi` using this repository: `chezmoi init https://github.com/logdan/chezmoi.git`.

3. Preview changes that `chezmoi` would make to your `$HOME`: `chezmoi diff`.

4. Apply the changes: `chezmoi apply`. This will automatically install packages required for certain plugins using the [run_once_install-packages.sh](run_once_install-packages.sh) script. Upon the first launch, all packages will be installed and run

5. Launch zsh: `exec zsh`.

### Fonts

The font I use is the [JetBrains Nerd Font patched for Powerlevel10k](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/JetBrainsMono).
