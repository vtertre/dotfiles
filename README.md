# dotfiles

Dotfiles are how you personalize your system. These are mine.

## Topical organization

Everything is built around topic areas. When adding a new one — say, "Java" — simply add a `java` directory and put files in there.

## Components

There are a few special files in the hierarchy:

- **bin/**: Anything in `bin/` will get added to `$PATH` and be made available everywhere.
- **topic/\*.zsh**: Any files ending in `.zsh` get loaded into the environment.
- **topic/path.zsh**: Any file named `path.zsh` is loaded first and is expected to setup `$PATH` or similar.
- **topic/completion.zsh**: Any file named `completion.zsh` is loaded last and is expected to setup autocomplete.
- **topic/install.sh**: Any file named `install.sh` is executed when `script/install` runs. To avoid being loaded automatically, its extension is `.sh`, not `.zsh`.
- **topic/\*.symlink**: Any file ending in `*.symlink` gets symlinked into `$HOME`. This is to keep all of those versioned in the dotfiles but still keep those autoloaded files in the home directory. These get symlinked in when `script/bootstrap` runs.

## Install

Run this:

```sh
git clone https://github.com/vtertre/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
script/bootstrap
```

This will symlink the appropriate files in `.dotfiles` to the home directory. Everything is configured and tweaked within `~/.dotfiles`.

`dot` is a simple script that installs some dependencies, sets sane macOS defaults, and so on. Tweak this script, and occasionally run `dot` from time to time to keep the environment fresh and up-to-date. This script is contained in `bin/`.

## 🙏

Originally forked from [holman dotfiles](https://github.com/holman/dotfiles).
