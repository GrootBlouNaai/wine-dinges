This directory is required for the script to work properly. At least never
remove the game_info.txt file and the data directory.

Other directories and files are not strictly necessary and can be optionally
removed or not created.

Directories/files description:

game_info.txt - information about the game
data - directory containing game files
dlls - libraries and other files intended to be put in system32 or syswow64 directory
additional - specific files (for example, settings for games or fonts)
regs - tweaks for registry
exe - executable files (mostly, installers of different programs)

WINETRICKS:

winetricks_list.txt - list of components to install using winetricks

During the prefix creation winetricks will automatically install all components
and apply all tweaks from the winetricks_list.txt file. Write names of components
and tweaks in the first single line, separate components with space.

For example: d3dx9 corefonts xact dxvk win8.

If winetricks is not installed then it will be automatically downloaded.

Directories description:

========================= data directory ===============================

Put game files here.

========================= dlls directory ===============================

Put here libraries and other files that are intended to be put in system32 directory

The script will automatically copy them into windows/system32 directory.
And also it will automatically override them to "Native" and will register
them by using regsvr32.

If you want the files to be copied specifically to system32 or syswow64,
you need to put then into game_info/dlls/system32 or game_info/dlls/syswow64.

You cat put here not only dlls but also files with any other extensions.

============================ exe directory =============================

Put executable files here (for example, installers).

The script will automatically execute all files from this directory during
the prefix creation.

============================ regs directory ============================

Put registry files here.

The script will automatically import all reg files from this directory during
the prefix creation.

======================= additional directory ===========================

Put any custom files/directories there. The names of directories should
be the same as the name of directories you want to copy to. For example:

The content of game_info/additional/prefix/drive_c/Windows/Fonts directory
will be copied to WINEPREFIX/drive_c/Windows/Fonts directory during prefix
creation.

The content of game_info/additional/documents/Documents_Multilocale/My Games/Fallout4
directory will be copied to DOCUMENTS_DIR/Documents_Multilocale/My Games/Fallout4
directory during prefix creation.

Etc.
