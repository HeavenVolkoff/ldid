# Link Identity Editor (ldid)

pseudo-codesign Mach-O files.

> Original Author: Jay Freeman (saurik)
>
> Original Code: https://git.saurik.com/ldid.git

## Changes:
 
 - Add Makefile
 
 - Removed custom build scripts

## Build 

Clone project:

```sh
$> git clone --recurse-submodules https://github.com/HeavenVolkoff/ldid.git
$> cd ldid
```

Configure and build static libplist:

```sh
$> cd libplist
$> ./autogen.sh
$> ./configure \
    --with-pic \
    --enable-static \
    --without-tests \
    --without-cython \
    --disable-debug \
    --disable-shared
$> make -j$(nproc)
```

Build ldid:

```sh
$> cd ..
$> make -j$(nproc)
```