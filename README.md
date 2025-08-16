# My personal dotfiles

## Getting started

1. Install GNU stow.
2. Clone this repo into your home folder with `git clone git@github.com:unix-terminal-setup/morne-setup.git ~/dotfiles`
3. `cd` into the `dotfiles` direcotry.
4. Run `stow .` in this directory.
5. Open tmux with `tmux` and press `leader + I` to install all the plugins.

## What's included

1. My `.bash_profile`.
2. A tmux config.
3. A NeoVim stup with NvChad and basic LSP support for Typescript and C#.
- Make sure to install the Typescript language server.
- Make sure to install the .NET SDK and Omnisharp on the correct paths (see custom config)
4. Ghostty terminal config.
5. Helix editor config.
6. Yazi file explorer config.
7. Zellij multiplexer config.
8. (Not included) LazyGit used as git client.
