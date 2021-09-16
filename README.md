# dwm

This is my custom build of `dwm`.

## Patches

* [noborder](http://dwm.suckless.org/patches/noborder/)
* [gaps](http://dwm.suckless.org/patches/gaps/)
* [bgra-glyphs](https://gitlab.freedesktop.org/mawww/libxft.git) patch for libXft
* [alternativetags](https://dwm.suckless.org/patches/alternativetags)

## Building

Since this requires having a patched version of libXft, some initial setup is
required. When first installing:

```
$ git clone --recurse-submodules https://github.com/dosisod/dwm
$ cd dwm/libxft
$ git checkout bgra-glyphs
$ sh autogen.sh && ./configure && make
$ cd ../freetype
$ sh autogen.sh && ./configure && make
$ cd ..
```

Tested on Ubuntu 18.04.



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
