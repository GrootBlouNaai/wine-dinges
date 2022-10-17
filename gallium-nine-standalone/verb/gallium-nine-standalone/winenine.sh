


WINDLL64="${WINEPREFIX}/dosdevices/c:/windows/system32"
WINDLL32="${WINEPREFIX}/dosdevices/c:/windows/syswow64"
galliumnine()
{
    gninearchive="gallium-nine-standalone-v0.8.tar.gz"
    gninetemp ="${WINEPREFIX}/dosdevices/c:/windows/temp/galliumnine"

    rm -rf "${gninetemp}"
    mkdir -p "${gninetemp}"
    tar -C "${gninetemp}" --strip-components=1 -zxf path/to/file
    mv "${gninetemp}/lib32/d3d9-nine.dll.so" "${WINDLL32}/d3d9-nine.dll"
    mv "${gninetemp}/bin32/ninewinecfg.exe.so" "${WINDLL32}/ninewinecfg.exe"
    if test "${W_ARCH}" = "win64"; then
        mv "${gninetemp}/lib64/d3d9-nine.dll.so" "${WINDLL64}/d3d9-nine.dll"
        mv "${gninetemp}/bin64/ninewinecfg.exe.so" "${WINDLL64}/ninewinecfg.exe"
    fi
    rm -rf "${gninetemp}"
# Enable gallium nine
    WINEDEBUG=-all "${WINE}" ninewinecfg -e
}