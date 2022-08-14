# np

A very simple notepad for unix users.

```
np - a very simple notepad for unix users
Usage:
  edit,     e :  opens today's notepad
  publish,  p :  publishes entire series as pdf
  list,    ls :  lists all notepads
  config,  rc :  print your config
```

## Installation

A `Makefile` is provided.

`make install`

Manually copying `np` to `~/.local/bin/np` also works. This is the preferred option for installing `np` for the current user only.

## Configuration

### Notepad Directory 

By default, it creates and uses a directory in `~` called `.notepad`. To change this, add this to your `.profile` or your `.bashrc` or `.zshrc`:

```sh
export NP_NOTEPAD_LOCATION=$HOME/.notepad/;
```

### Other Configurations

The following configurations are available:

```sh

# The name that appears on the front of the document.
export NP_AUTHOR_NAME="Your Name Here";

# The title of the generated notepad.
export NP_NOTEPAD_NAME="Notepad";
```

### Workflow

Configuring in this way allows for notepads to made for other directories. In the directory for which you want to make a notepad, create a shell script to run with the following:

```sh
export NP_NOTEPAD_LOCATION=$PWD;
export NP_AUTHOR_NAME="Your Name Here";
export NP_NOTEPAD_NAME="Project Notepad For $PWD";
```
Run this script, and `np` will use a notepad with these settings. You will need to run this helper script every time you open a new shell in this directory, and once you have left the project directory you will have to source your original configurations, either by running `source ~/.profile` or by simply closing and opening the shell again.

It is also possible to have a drafts folder. Just add things to `$NP_NOTEPAD_LOCATION_HOME/drafts`.

## Dependencies

This uses vanilla POSIX `sh`, so it should work on most platforms. The only dependency is on `pandoc`, and even then that is optional. Pandoc support for PDF requires TeXLive, which is in most Linux distribution repositories.
