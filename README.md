# np

A very simple notepad for unix users.

```
np - a very simple notepad for unix users
Usage:
  edit, e    :  opens today's notepad
  publish, p :  publishes entire series as pdf
  list, ls   :  lists all notepads
```

## Installation

A `Makefile` is provided.

`make install`

Manually copying `np` to `~/.local/bin/np` also works. This is the preferred option for installing `np` for the current user only.

## Dependencies

This uses vanilla POSIX `sh`, so it should work on most platforms. The only dependency is on `pandoc`, and even then that is optional. Pandoc support for PDF requires TeXLive, which is in most Linux distribution repositories.
