gtk-plus-windows
================

A [download script](Makefile) for the Gtk+ 3.x Windows port

## Features

 * Downloads all required and optional dependencies to make
   `pkg-config`, `glib`, `gtk+`, `cairo`, `pango`, etc. usable on `MinGW32/MSYS`
 * Unpacks all zip files into either an `update` (only new files) or `all` directory (all files),
   thus allowing `xcopy` or `robocopy` deployment, or if used as a `git submodule`, direct usage

## Usage

 * Use `make` (GNU) in either a `PATH` enhanced `cmd.exe` session or in the provided `msys` shell:
 
   * `make update` downloads and unpacks all new or updated zip files into `win(32|64)/update`
   * `make all` downloads all zip files and unpacks them into the `win(32|64)/all` directory

## Limitations

 * Support for 64-bit is untested
 * The script will not try to integrate the unpacked files with `MinGW/MSYS`
 * No way to update zip file version numbers without changing the [Makefile](Makefile)
 * Only detects zip file changes if the version number or file timestamp is changed.
