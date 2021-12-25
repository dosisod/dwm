# dwm

This is my custom build of `dwm`.

## Patches

* [noborder](http://dwm.suckless.org/patches/noborder/)
* [gaps](http://dwm.suckless.org/patches/gaps/)
* [bgra-glyphs](https://gitlab.freedesktop.org/mawww/libxft.git) patch for libXft
* [alternativetags](https://dwm.suckless.org/patches/alternativetags)
* [alpha](https://dwm.suckless.org/patches/alpha/)
* [resizepoint](https://github.com/bakkeby/patches/blob/master/dwm/dwm-resizepoint-6.2.diff)

## Building

On Arch Linux, install the [libxft-bgra](https://aur.archlinux.org/packages/libxft-bgra/)
and [freetype2](https://archlinux.org/packages/extra/x86_64/freetype2/)
packages, then run `make && sudo make install`.

For instructions for building on Ubuntu 18.04, click
[here](https://github.com/dosisod/dwm/tree/ubuntu1804#building).

Below is a copy of the original README.

```
dwm - dynamic window manager
============================
dwm is an extremely fast, small, and dynamic window manager for X.


Requirements
------------
In order to build dwm you need the Xlib header files.


Installation
------------
Edit config.mk to match your local setup (dwm is installed into
the /usr/local namespace by default).

Afterwards enter the following command to build and install dwm (if
necessary as root):

    make clean install


Running dwm
-----------
Add the following line to your .xinitrc to start dwm using startx:

    exec dwm

In order to connect dwm to a specific display, make sure that
the DISPLAY environment variable is set correctly, e.g.:

    DISPLAY=foo.bar:1 exec dwm

(This will start dwm on display :1 of the host foo.bar.)

In order to display status info in the bar, you can do something
like this in your .xinitrc:

    while xsetroot -name "`date` `uptime | sed 's/.*,//'`"
    do
    	sleep 1
    done &
    exec dwm


Configuration
-------------
The configuration of dwm is done by creating a custom config.h
and (re)compiling the source code.
```
