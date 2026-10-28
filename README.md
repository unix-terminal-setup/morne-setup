# My personal dotfiles

## Getting started

1. Install GNU stow.
2. Clone this repo into your home folder with `git clone git@github.com:unix-terminal-setup/morne-setup.git ~/dotfiles`
3. `cd` into the `dotfiles` direcotry.
4. Run `stow .` in this directory.

## What's included

1. My `.bash_profile`.
2. A NeoVim setup. Requires:
    - Neovim 0.12+
    - A Nerd Font
    - ripgrep
    - tree-sitter CLI 0.26.1+
    - A C compiler
    - Node.js and npm
    - .NET SDK

    Language servers and formatters are installed automatically by Mason on startup, based on
    the servers in [`lua/configs/lspconfig.lua`](.config/nvim/lua/configs/lspconfig.lua) and the formatters in
    [`lua/configs/conform.lua`](.config/nvim/lua/configs/conform.lua). Add or remove them there.
    Extra tools go in `M.mason.pkgs` in [`lua/chadrc.lua`](.config/nvim/lua/chadrc.lua).
3. Ghostty terminal config.
4. Yazi file explorer config.
5. Zellij multiplexer config.
6. (Not included) LazyGit used as git client.
