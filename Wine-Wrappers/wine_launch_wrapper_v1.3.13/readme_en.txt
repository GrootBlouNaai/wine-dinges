This script is intended to simplify packing, launching and distributing
Windows games and programs using Wine. In other words, this script is for
creating portable Wine applications. But it also can be used for other purposes.
This script shoiuld work on all Linux distributions with the GNU standard
utilities and the bash shell installed. And wget is (optionally) needed for
the script to be able to download winetricks.

Although i tried to describle all the important features of the script in
this small documentation, the best way to learn everything about the script
is to examine it. I highly recommend to do this. It's not too big.

If you have some questions, you can ask them via the email, which is written
at the top of the start.sh script.

The example.tar archive contains a small example of how to use the script.
It doesn't show all the script features, only some of them.

================== start.sh script description ========================

All script settings (variables) are in the settings_start file or in the
settings_SCRIPTNAME file.

To change prefix architecture to 32-bit change PREFIX_ARCH variable
to win32 in settings_SCRIPTNAME file.

Script can be launched with --debug parameter to enable more output. This
helps in finding problems when application not working.

Script automatically uses system Wine if there is no wine directory
near the script or if GLIBC version in the system is older than 2.23.

Script automatically creates new prefix during first run and it uses
files from game_info directory. Script is not inteded to work with
already created prefixes.

Script creates documents directory to store games settings and saves.
And so removing prefix will not affect game saves/settings most of the time.

Script automatically recreates prefix if username or Wine versions changes.

Settings file name and game_info.txt name depends on script name.
For example, if script is named start-addon.sh then it will use
settings_start-addon file and game_info-start-addon.txt file if it exists.
If there is not game_info-scriptname.txt file then script will use standard
game_info.txt file. So you can make copies of start.sh script with different
name and they will use different settings and can launch different exe
files.

==================== The start.sh script arguments =====================

start.sh script can be launched with these arguments:

	--cfg - run winecfg
	--reg - run regedit
	--fm - run Wine file manager
	--tricks - if used without additional arguments then run winetricks GUI.
		It can also be used with additional arguments, like:
		./start.sh --tricks d3dx9 corefonts.
	--kill - kill all running processes in the Wine prefix
	--debug - show more information when running Wine
	--shortcuts - add shortcuts to launch the script on the desktop
		and the applications menu. If the shortcuts already exist, they
		will be removed.
	--clean - remove all files created by the script
		(except the winetricks and settings_* files). This will likely
		remove all game settings and saves. Use with caution!
	--help (or -h) - show all the available launch arguments

All other arguments that don't match any of the above will be passed to
the application itself.

=======================================================================

Description of directories and files of game_info directory are in the
game_info/readme_en.txt file.

=======================================================================

You can also download my Wine builds:

* https://github.com/Kron4ek/Wine-Builds
* https://mega.nz/folder/ZZUV1K7J#kIenmTQoi0if-SAcMSuAHA
* https://drive.google.com/drive/folders/1HkgqEEdAkCSYUCRFN64GGFTLF7H_Q5Xr
