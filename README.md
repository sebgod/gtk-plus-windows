gtk-plus-windows
================

A [download script](Makefile) for the Gtk+ 3.x Windows port

# Features

 * Downloads all required and optional dependencies to make
   `pkg-config`, `glib`, `gtk+`, `cairo`, `pango`, ... usable on MinGW32/MSYS
 * Unpacks all zip files into either an `update` (only new files) or `all` directory (all files),
   thus allowing `xcopy` or `robocopy` deployment, or if used as a submodule, direct usage

# Usage

 * Use `make` (GNU) in either a `PATH` enhanced `cmd.exe` session or in the provided `msys` shell:
 
   * `make update` downloads and unpacks all new or updated zip files into `update`
   * `make all` downloads all zip files and unpacks them into the `all` directory

# Limitations

 * Currently, only [32-bit](http://www.gtk.org/download/win32.php) is supported by this script
 * The script will not try to integrate the unpacked files with MinGW/MSYS
 * No way to update zip file version numbers without changing the [Makefile](Makefile)
 * Only detects zip file changes if the version number or file timestamp is changed.
