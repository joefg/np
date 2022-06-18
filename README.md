# np.sh

A very simple notepad for unix users.

```
np.sh - a very simple notepad for unix users
Usage:
  edit, e    :  opens today's notepad
  publish, p :  publishes entire series as pdf
  list, ls   : lists all notepads;
```

## Installation

This is a very simple shell script, so you should install it somewhere your shell can see it.

I used `cp np.sh /usr/local/bin/np`, which works for Arch, but your actual location may be different. As a rule of thumb, you will want to keep it in your `$PATH`. To see where that is, you should run `echo $PATH` to get a list of the path directories available to your shell.

## Dependencies

This uses vanilla POSIX `sh`, so it should work on most platforms. The only dependency is on `pandoc`, and even then that is optional. Pandoc support for PDF requires TeXLive, which is in most Linux distribution repositories.
