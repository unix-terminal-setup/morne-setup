# My personal dotfiles: devenv branch

Linux-only dotfiles for [devenv](https://github.com/MorneVenter/devenv) containers. Every new container clones this branch into `~/dotfiles` and runs `stow .` in it, so the config is linked into the home folder.

The `main` and `work-local` branches hold the macOS setup.

## What's included

1. My `.bash_profile`.
2. A NeoVim setup. Copying uses OSC 52, so yanks reach the host clipboard through the terminal.

    Language servers and formatters are installed by Mason, based on the servers in
    [`lua/configs/lspconfig.lua`](.config/nvim/lua/configs/lspconfig.lua) and the formatters in
    [`lua/configs/conform.lua`](.config/nvim/lua/configs/conform.lua). Add or remove them there.
    Extra tools go in `M.mason.pkgs` in [`lua/chadrc.lua`](.config/nvim/lua/chadrc.lua).

3. Yazi file explorer config.
4. Zellij multiplexer config.

The tools themselves (Neovim, Node, the .NET SDK, ripgrep, tree-sitter and the rest) are installed by the devenv image, not by this branch.
