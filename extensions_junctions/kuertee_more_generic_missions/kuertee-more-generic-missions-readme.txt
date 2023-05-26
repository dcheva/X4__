More generic missions
https://www.nexusmods.com/x4foundations/mods/622
by kuertee

Updates
=======
v6.0.002, 13 Apr 2023:
-Tweak: Version number update for consistency with my other mods. No internal changes since the last version.

Mod effects
===========
25 generic missions are offered per sector. (The base game has a limit of 7.)

How it works
============
The base game limits missions offered in the Bulletin Board System to 7 or half the number of stations in the sector - whichever is fewer, and only if every mission generation is successful. The base game doesn't try to generate replacement missions for those that fail to generate. Hence, sometimes, there are fewer than 7 missions in a sector.

This mod not only increases that limit to 25, but also ensures that there are 25. This mod will try to generate replacement missions for those that don't generate - until 25 are generated or 10 fails to generate.

Install
=======
-Unzip to 'X4 Foundations/extensions/more_generic_missions/'.
-Make sure the sub-folders and files are in 'X4 Foundations/extensions/more_generic_missions/' and not in 'X4 Foundations/extensions/more_generic_missions/more_generic_missions/'.

Uninstall
=========
-Delete the mod folder.

Troubleshooting
===============
(1) Do not change the file structure of the mod. If you do, you'll need to troubleshoot problems you encounter yourself.
(2) Allow the game to log events to a text file by adding "-debug all -logfile debug.log" to its launch parameters.
(3) Enable the mod-specific Debug Log in the mod's Extension Options.
(4) Play for long enough for the mod to log its events.
(5) Send me (at kuertee@gmail.com) the log found in My Documents\Egosoft\X4\(your player-specific number)\debug.log.

Credits
=======
By kuertee.
German localisation by LeLeon.

History
=======
v6.0.0007, 25 Mar 2023:
-Tweak: 6.0 beta 7 compatibility.
-Bug-fix: The correct number of missions in the sector is now listed in the mod's Extension Options. Previously, the number was sometimes incorrect. Note that this number is only meant for debugging purpose and do not update with the game ticks. Close then reopen the menu to update this number.

v5.1.03131, 3 Nov 2022:
-Bug-fix: Error in German localisation file.

v5.1.0313 beta, 31 Oct 2022:
-New Extension Options setting: Stations multiplier for max missions per sector: Overriding the number of preferred missions to generate is the number of stations in the sector multiplied by this number. In the base game, this factor is 0.5. With this mod, the default is 2.

For both v4.0 and v4.1beta1 of the game.
This version may or may not work in other v4.1betaX versions.
v1.0.3, 19 Jun 2021:
-Compatibility: Update so the previous changes for v4.1beta1 of the game work in v4.0 of the game.
-New feature: Extensions Options to modify number of missions to generate and toggles for regeneration of missions events.

For v4.0 and v4.1beta1 of the game:
v1.0.2, 15 Jun 2021:
-Tweak: The number of missions that the mod tries to generate is either 2 x the number of stations in the sector or 25, whichever is fewer. Previously, this was either the number of stations or 25.
-New feature: When a mission is accepted or the offer is expired, new missions are generated. Previously, no replacements are generated at these events. Instead replacements are generated only when Egosoft's 10-minute looping timer expires (or when the player enters a new sector). These two events are still active. This version adds the acceptance and expiration events to trigger the regeneration.

v1.0.1, 18 Mar 2021:
-Bug-fix: The number of missions offered in a sector wasn't changed since the public release of v4.0.0 of the base game.

v1.0.0, 11 Mar 2021: Initial release
