# My personal dotfiles

## Getting started

1. Install GNU stow.
2. Clone this repo into your home folder with `git clone git@github.com:linux-terminal-setup/morne-setup.git ~/dotfiles`
3. `cd` into the `dotfiles` direcotry.
4. [VERY IMPORTANT] run `git submodule update --init --recursive` in the `dotfiles` directory to fetch submodules.
5. Run `stow .` in this directory.

## What's included

1. My `.bash_profile`.
2. A tmux config.
3. A NeoVim stup with NvChad and basic LSP support for Typescript and C#.
- Make sure to install the Typescript language server.
- Make sure to install the .NET SDK and Omnisharp on the correct paths (see custom config)
