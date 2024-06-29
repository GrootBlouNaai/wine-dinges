#!/bin/sh -e

BASE=$(dirname "$(readlink -f "$0")")

die() {
    echo "$*" >&2
    exit 1
}

install_gallium_nine() {
    local dst=$1
    local libdir=$2
    local bindir=$3

    echo "Installing binaries to $dst"
    cp "$BASE/$libdir/d3d9-nine.dll.so" "$dst/d3d9-nine.dll"
    cp "$BASE/$bindir/ninewinecfg.exe.so" "$dst/ninewinecfg.exe"
}

enable_gallium_nine() {
    echo "Enabling Gallium Nine"
    wine ninewinecfg.exe -e
}

wine --version >/dev/null 2>&1 || die "Wine not found"

# Check if WINEPREFIX is set
if [ -z "$WINEPREFIX" ]; then
    echo "WINEPREFIX is not set. Using default Wine prefix."
else
    echo "Using Wine prefix from WINEPREFIX: $WINEPREFIX"
fi

# Install 32-bit Gallium Nine
dst32=$(wine winepath -u 'c:\windows\system32')
install_gallium_nine "$dst32" "lib32" "bin32"

# Check for 64-bit Wine support and install 64-bit Gallium Nine
if wine64 winepath >/dev/null 2>&1; then
    dst64=$(wine64 winepath -u 'c:\windows\system32')
    install_gallium_nine "$dst64" "lib64" "bin64"
else
    echo "Wine64 not found, skipping 64-bit installation"
fi

enable_gallium_nine

echo "Done"
exit 0
