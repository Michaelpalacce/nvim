# Neovim Setup

## Philisopy

- Aim to document as many settings as possible. This way you can figure out what is what later on.
- Try to use the minimal amount of plugins possible
- Don't change native Vim motions, unless absolutely needed.

## Structure

- `init.vim` is the main configuration file. It is used to install `Lazy.nvim`.
- `plugin` directory is used to store settings that are loaded after `init.vim`.
- `lua` directory is used to store settings that are loaded after `plugin` directory. This is where all of my plugins are configured.
- `after` directory is used to store settings that are loaded after `lua` directory. This is mainly used for `ftplugin`.

## Setup

The `setups` folder contains the minimal setups required for JUST neovim to work on different systems. 

> [!NOTE]
> In the future, this will be called in one script and the correct setup should be called.

### Dockerfile notices

- They are purely for testin
