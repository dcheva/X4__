Emergent missions
https://www.nexusmods.com/x4foundations/mods/780
by kuertee

Updates
=======
v6.0.002, 13 Apr 2023:
-Tweak: Version number update for consistency with my other mods. No internal changes since the last version.

Mod effects
===========
Missions that eventuate from events in the game: (1) Mayday! Mayday!, (2) Escort, (3) Patrol sector, (4) Raid sector, (5) Defend Pirate (removeds for now), (6) Search and Destroy.

Requirements
============
SirNukes Mod Support APIs mod: https://www.nexusmods.com/x4foundations/mods/503
Kuertee's UI Extensions mod: https://www.nexusmods.com/x4foundations/mods/552

Recommended componion mods
==========================
Reputations and professions mod (https://www.nexusmods.com/x4foundations/mods/636): Bounty Hunters Profession and Guild features
NPC ractions mod (https://www.nexusmods.com/x4foundations/mods/497): Bridge Crew feature

Mission: Mayday! Mayday!
========================
A mission offer will be created when a ship requests back-up.

To complete the mission, ensure that the ship docks at any station or ship, exits the sector, or detects no enemies within radar range.

Note that the Request For Back-up feature of my other mod, NPC Reactions, is disabled when this Emergent Missions is installed. Also, in this version, the ship doesn't hail you with a video communication.

Mission: Escort
===============
A trade or mining ship will create a mission offer when they start a trading run.

To complete the mission, ensure that the ship completes all their trade orders. New trade orders that they receive during the mission will extend the mission duration.

Mission: Patrol/raid sector/defend pirate
=========================================
Factions will request support for patrols and raids. These missions emerge from functions within the faction's defend and invade sub-goals. You will directly help the faction with their operations in the mission sector when accepting these missions.

Get a briefing from your mission handler to receive the patrol/raid objective. The mission completes when the ship completes their orders or when they dock. New combat orders that they receive during the mission will extend the mission duration. Get a debriefing to get your reward and to complete the mission.

The the mission handler starts on the ship assigned to you but may be replaced if the ship is destroyed or may be moved if the ship is under attack.

Developer notes: This mission runs off the faction's defend area sub-goal AI (factionsubgoal_defendarea.xml). Several ships are attached to this AI. And the mission may change your assignment to a different ship, change your target sector or change your mission handler depending on situations that occur during the mission. You will be notified of these changes with the updates listed in the mission briefing screen.

Other features in
Mayday!, Escort, and Patrol/raid missions/defend pirate missions
================================================================
The ship will notify you of damage reports.

The escort distance is 100km. And any of your ships within that 100km are considered escorts when determining if you've left the escort.

You can request from the pilot an early termination of any escort/support duties early.

When you don't have an active target, the ship will give you attack orders that best suits your ship size and current mission situation. Targets are assigned to you in this order of priority: best suited to your ship's size, the largest target, a station target, the ship's target, a non-combat target, a target from an enemy faction that is not the primary target faction of the mission, extra small ships or drone targets. They will not override your current target.

You can send your AI pilots to protect your mission ship, effectively letting them complete the mission. Note that you still need to attend the briefings and debriefings of the patrol/raid missions.

Mission: Search and destroy
===========================
All attacks and kills are recorded (from when the mod is installed). And all kills generate a bounty mission owned by the victim's faction. These missions are offered at the nearest station owned by the victim's faction and at the victim's faction headquarters.

To help locate the bounty, the mission contact will give you 3 Navigation Beacons of the bounty's last reported sightings. These sightings are generated from reports of their attacks and kills; and exit and entry of sectors near the faction's satellites, stations or ships. You will be updated with new reported sightings.

You can also update more recent reports from other mission offers for the same bounties but owned by a different faction. If you can't find your target, the mission offers at nearby stations owned by a different faction. I.e. The faction that owns the mission you have will update you of new reports. But other factions won't update you because you don't have their mission.

The target is found when they are identified with your long range scanner, move into your zone, or they are detected by your radar - if they are an enemy.

Bridge Crew from the NPC Reactions mod (https://www.nexusmods.com/x4foundations/mods/497) will alert you when a Search And Destroy target is detected on your radar - even if you are in Travel Mode.

Bounty Hunters Profession and Guild
===================================
Requires Reputations and Professions mod: https://www.nexusmods.com/x4foundations/mods/636.

These services become available when you join the Bounty Hunters Guild:
1. Increase the number of Search And Destroy missions allowed to 6 per hour or 10 per hour.
2. They can act on your behalf to prevent your target's factions from retaliating against your attacks. The faction will still acknowledge the attacks, however, and your relationship with them will still suffer.
3. Full immunity from Reputations and Professions to prevent relationship points penalties on Search And Destroy targets.

Some after action reports
=========================
"...Played Emergent Missions 4.2.0803 Search and Destroy mission and oh boy - it was FUN, real fun :)
Took one to hunt SCA Plunderer, and everything went smoothly. Got navigation sightings from some TEL Yagogoaogogogog and started to look for my prey.
Haven't found him in a place where latest sightings (30 min ago) were placed, so I set up an alert. Four minutes later one of my satellites found and reported his presence.
I tracked him down, but his enabled travel drive made it difficult for me to scan for a while. But I finally made it.
When he was revealed, near station started to shoot at him and two minutes later TEL destroyer passing nearby joined the party.
Then it was a matter of time to destroy it. My share in destruction was small (9/100) but I was very pleased with the party..." -mycu

"...Took a Search and Destroy mission against a Xenon P given by the Teladis at Two Grand. Only one reported sighting at Two Grand. Likely the Teladi ship (trader or scout) that reported the Xenon P before it was destroyed.

The long-range scanner didn't detect the Xenon P in the areas around the reported sighting. There are 4 gates out of Two Grand. Two of the gates lead to Teladi-owned sectors. It's likely that the Teladi would have satellite coverage of these gates and my target be detected entering them. The 3rd gate leads to an Argon-controlled sector. And the 4th to Fires of Defeat which is owned by the Free Families.

Took a chance and entered Fires of Defeat to continue the hunt. My radar detected the Xenon P immediately on entering the sector. It was in a fleet of Xenon Ns and Ms.

It took at least 20 minutes to destroy the Xenon P with my corvette. I had no chance against the fleet. I had to strafe my target with the Travel Drive engaged. I also had to manage my Shields so that I have sufficient levels to transfer to my Boost every time hits from the fleet interrupted the Travel Drive.

Debriefing report:
Reward for Xenon P kill of 1 s-class ship: 37k Cr.
Reward for Xenon P destruction: 462k Cr.
Total reward: 499k Cr.
23.5M to go for the Rattlesnake capital ship. :D..." -kuertee

Install
=======
-Unzip to 'X4 Foundations/extensions/kuertee_emergent_missions/'.
-Make sure the sub-folders and files are in 'X4 Foundations/extensions/kuertee_emergent_missions/' and not in 'X4 Foundations/extensions/kuertee_emergent_missions/kuertee_emergent_missions/'.

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
Chinese localisation file by Tiomer.
German localisation by LeLeon.
French localisation file by Natalshadow.

History
=======
v6.0.0004, 18 Feb 2023:
-Bug-fix: The long-standing bug of the Extension Options getting reset is fixed! :D ... hopefully. :)
-Note: This version should work with 6.x and 5.x of the base game.

v5.1.03141, 07 Dec 2022:
-Bug fix: Changes to the Extension Options were not sticking.

v5.1.0314, 06 Dec 2022:
-Bug-fix: The NPC contact at the start of the mission was missing sometimes.
-Tweak: Better tests of the faction's goal AI re: continuing the player missions.

v5.1.0313, 31 Oct 2022:
-Bug-fix: The Sector Raid missions are now attached to War Subscriptions missions when appropriate.
-Tweak: More granular reward multiplier Extension Option.
-Tweak: Allow Sector Patrol/Raid missions to continue, if already started, even if the faction mission goal has stopped.

v5.1.0308, 29 Sep 2022:
-Bug-fix: The sector patrol/raid missions weren't getting assigned to the appropriate subscriptions - if available.

v5.1.0306, 18 Sep 2022:
-Tweak: More granular Extension Options sliders for the reward multiplier.
-New feature: German localisation.

v5.1.0305, 15 Sep 2022:
-Bug-fix: When loading a game near stations, any Search And Destroy missions on offer at those stations will automatically be activated.
-Bug-fix: Uncontactable mission NPCs because they've not been added to a walkable room.

v5.1.0303, 1 Sep 2022:
-Bug-fix: Old Search And Destroy targets and their last-known positions weren't getting removed properly.

v5.1.0302, 24 Jul 2022:
-Bug-fix: The missions weren't giving enemy targets to the NPC ships you assigned to the missions.

v5.1.0301, 17 Jul 2022:
-New feature: New method of tracking attacks and kills that generates targets for the Search And Destroy missions.
-Tweak: Kills by NPC wings only count as 25% towards the commander's kills/bounty.
-Bug-fix: Determining when you're ship is nearby/on escort.
-Bug-fix: Sometimes the NPC for the Search And Destroy missions was unavailable.
-Bug-fix: Search And Destroy missions weren't ending after the 3 hour time limit of finding your target.

v5.1.0009, 23 May 2022:
-New feature: Support for full immunity from Reputations and Professions to prevent relationship points penalties on Search And Destroy targets.
-Tweak: Better enemy target selection given to the player.
-Bug-fix: Mission targets and kill list clean up.
-Bug-fix: Completed Support Patrol/Raid missions were restarting when a new enemy target is found after completion.
-Bug-fix: Mission NPC spawning on ships even if the option to force them to spawn on stations is set.
-Bug-fix: Mission NPC not moving when the station or ship they are on is attacked.
-Bug-fix: Search And Destroy limiter was broken.
-Bug-ifx: Id code on nav beacons were incorrect.

v5.1.0001, 8 Apr 2022:
-Tweak: Search And Destroy missions: mission offers limiter. In previous versions, you could take a mission near the end of that 1 hour timer and then take 3 more as soon as that time completes - seemingly allowing 4 missions for that hour. In this version, you can have only 3 missions (active and/or completed/failed) in any one hour block.
-New feature: Chinese localisation file by Tiomer. Frence localisation file by Natalshadow. Thanks, guys!

v5.0.0015, 3 Apr 2022:
-Bug-fix: Search And Destroy (SAD) missions: The limit to offers was broken - allowing an unlimited number of missions per hour.
-Bug-fix: SAD missions: Bug-fixed the notifications on the limits that appeared under the mission offers description.
-Bug-fix: SAD missions: The navigation beacons had the wrong id code of the ship. Fake id codes should only be used on ships that are undercover (i.e. pirates).

v5.0.0014, 1 Apr 2022:
-Bug-fix: Search and destroy missions: The wrong notification on the mission offers UI when you can't take any more missions was shown.
-New feature: Bridge Crew from the NPC Reactions (https://www.nexusmods.com/x4foundations/mods/497) mod will alert you when a Search And Destroy target is detected on your radar - even if you are in Travel Mode.

v5.0.0013, 30 Mar 2022:
-New feature: Search And Destroy: Support for Reputations and Professions (RAP) mod's Bounty Hunters Profession and Guild: Immunity from retaliation by target's faction, increase limits on missions allowed per hour, Bounty Hunter activities logged, etc.
-New feature: Search And Destroy: Notes on the mission description UI on mission limits and time left before new missions are allowed.
-Bug-fix: Search And Destroy: Some missions weren't getting offered.

v5.0.0012, 23 Mar 2022:
-Bug-fix: Damage calculator was returning 0 engagement rewards.
-Bug-fix: Mayday! missions: Mayday missions against player-owned ships were getting created.

v5.0.0011, 17 Mar 2022:
-Bug-fix: Search and destroy missions: missions were restarting after you retake control of your ship after receiving your reward.

v5.0.001, 17 Mar 2022:
-Bug-fix: Data of ships that's been removed by the game was removed from your damaged and kills log - preventing you from receiving rewards for them. Note that this occured when you do not claim the reward for a long time after the your kills. In this version, the log is kept intact regardless of how long you leave the mission open.
-Bug-fix: Raid/patrol missions: When the lead ship that you're supporting is destroyed, the mission continues.
-Bug-fix: Raid/patrol missions: When the faction goal AI cancels their own mission, your mission continues. Also, the mission NPC doesn't get removed.

v4.2.0807, 28 Feb 2022:
-Bug-fix: Mayday! missions: complete when no enemies found.
-Bug-fix: Raid/patrol missions: some missions were ending when the mission offer list is opened.
-Bug-fix: Raid/patrol missions: leaving target sector but allowing mission to continue with the assigned ship.
-Bug-fix: Raid/patrol missions: determining mission end when leaving/re-entering the target sector.
-Bug-fix: Raid/patrol missions: allow mission to continue if it has already started if the faction cancels its mission.
-Bug-fix: Search and destroy (SaD) missions: targets destroyed on unaccepted missions were rewarding the player. Because mission offers exists only when the mission offer list is open, this only happened at those times.
-Bug-fix: Mission logs are now logged in the Missions category.
-Bug-fix: Auto-enemy targeting: add more preferences to ships with purpose.fight tag.
-Bug-fix: Mission NPC: ensure station of mission NPC is dockable by the player.
-Bug-fix: Mission NPC: move mission NPC when the player changes to a ship that can't dock at the mission NPC's station.
-Tweaks: Assigned ships: separate and suitable targets assignments to assigned ships. Previously one target is assigned to all assigned ships.

v4.2.0806, 14 Feb 2022:
-Bug-fix/Tweak: Support sector raid/patrol missions: Many! E.g. rewrote the away timer routine. It used the Mayday! and Escort missions code which didn't suit the raid/patrol missions. E.g. Mission flow after 20min or after the base game's faction AI completes but then is renewed a few minutes after. E.g. One part of the "find enemy" code was broken since the last version.
-Tweak: Removed the Defend Pirate mission. The hooks to the base game's plunder goal AI always existed, but I've not managed to find this mission and so have never tested it. Removed for now.
-Tweak: Search and destroy missions: scanning objective step now exists in all missions. But it will be skipped if it's not required AFTER you find your target. Previous versions only accounted for the ship's cover status when the mission is created. But the ship's cover status can change anytime.

v4.2.0805, 08 Feb 2022:
-Bug-fix/Tweak: Damage and kill calculator: in high-combat areas, the damage and kill calculator wasn't accurate.
-Bug-fix: Search and Destroy missions: Prevent the same bounty but from another faction from getting accepted as a new mission.
-Tweak: Raid/Patrol missions: mission flow (e.g.: when the lead ship is destroyed, the guidance points to the mission npc after 20min, etc.).

v4.2.0804, 02 Feb 2022:
-New feature: Mayday, Escort, Support Rair/Patrol missions: Assign a ship to the mission by clicking on a new button "Assign A Ship" in the mission description. You need the new version of UI Extensions for this. Previously, you had to select your ship then give them the order to protect the mission ship. In this version you can use either method.
-New feature: Mission accepted and completed stats are incremented.
-Tweak: Better target assignment based on ship size and distance.
-Tweak: Better kill and damage calculator. E.g. when a ship is killed with one shot, the mod will add 100% damage to the counter instead of only incremeting the kill count.
-Tweak: Raid/Patrol missions: Updated text for mission description. Updated mission update notifications. E.g. "Container the patrol or request a release" after the mission duration of 20 minutes.
-New feature: Raid/Patrol missions: AI ships assigned to this will follow the patrol targets that are given to the player. Previously, they only followed the lead ship.
-New feature: Raid/Patrol missions: attacks on criminals are now counted as part of the mission operation.
-Bug-fixes: Raid/Patrol missions: many. E.g. sometimes, after completing a mission, you won't be able to accept the same mission because its npc mission contact has been cleaned up when they shouldn't have.
-Tweak: Search and destroy missions: offers are created when you open the mission offers list on the map instead of when you approach a station.
-Bug-fix: Search and destroy missions: 3-active-mission per hour limit is set after accepting a mission. Previously it was when a mission was offered - which was just plain wrong. :D
-Tweak: Search and destroy missions: Finding the target requires you to first get the nav beacons. I.e. your radar won't pick up the target when you run into them by chance.
-New feature: Ship Scanner mod support. After scanning the correct ship, the mission will revert back to the Search and Destroy mission instead of the Ship Scanner mission staying active.
-Bug-fix: Search and destroy missions: The mission description was listing the oldest of the 3 last known sightings instead of the last reported sighting.
-Tweak: Search and destroy missions: Pirate targets will be listed in the mission description with a "fake" id. I.e. ships that your alerts detect may be the wrong ships. Your radar and then your deep scan would confirm their idenities.

v4.2.0803, 25 Jan 2022:
-Bug-fix: Raid/Patrol/Defend Pirate missions: clean-up the npc mission contact properly to allow the mission to be re-taken again. In previous version, these actors would become invalid preventing you from taking missions with the same ship AFTER some time. This version cleans them up properly at the end of the missions.
-Bug-fix: Raid/Patrol missions: update the stations to patrol when the lead ship's orders are changed to a different sector.
-Tweak: Search And Destroy missions: Do not offer bounties on player-owned NPC pilots.

v4.2.0802, 24 Jan 2022:
-Bug-fix: Search And Destroy missions: removed the requirement for the Accept Mission For Later mod to enforce mission limits.
-Bug-fix: Raid/Patrol/Defend Pirate missions: various mission bugs. e.g. mission would not be accepted even after clicking the button. e.g. mission would lose its enemy targets data, and so won't return an invalid damage and kills list for reward. e.g. aborting a mission failed sometimes. etc.

v4.2.0801, 24 Jan 2022:
-New feature: Release version of Search And Destroy (SAD) missions: "real" bounties (from kills that occur in the game) and "true" hunting (via nav beacons of recent sightings). Read the section "Search and Destroy" below.
-New feature from SAD beta: Search And Destroy missions: "Update reports from mission offer" - update recent sightings from mission offers of the same bounty but owned by a different faction and from offers with newer reports.
-New feature from SAD beta: Search And Destroy missions: You have to confirm target identities of ships with suspicious transponders by scanning them.
-Tweak from SAD beta: You're allowed only 3 Search And Destroy missions at a time. Previously, you were allowed only one.
-New feature: Patrol/Raid missions: Mission guides cycles between the stations within the sector as patrol destinations.
-Bug-fix: Patrol/Raid/Defend Pirate missions: the reward for your kills in these missions was disabled in the last two versions.
-Bug-fix: Patrol/Raid missions: ships that attack you and ships that you attack are added to your tally for that mission - if they are of the target factios for the lead ship.
-Tweak: Patrol/Raid missions: Ships of the target faction that attack ships and stations outside the radar range of the lead ship's fleet are added as targets for the mission. This was made possible by the underlying system that manages SAD missions.
-Tweak: Patrol/Raid missions: The 2nd mission guide always points to the lead/mission giver ship.
-Tweak: Mayday!/Escort/Patrol/Raid/Defend Pirate missions: better target selection.

v4.2.079 beta, 19 Jan 2022:
-Include changes from 4.2.05 release version.
-Tweak: Search and destroy missions: You don't need to visit the mission NPC again after receiving the nav beacons from them. I.e. the last "Talk to" objective has been removed.
-Tweak: Search and destroy missions: Nav beacon renamed to: "Report of X, Y time ago".
-Tweak: Search and destroy missions: Mission log on completion now shows, reward for the kills of the target, reward for the target itself, and the total reward to you.

v4.2.05 release version, 19 Jan 2022:
-Bug-fix: Missions to support patrols/raid/pirates were not getting offered. There was an errant "reset_cue" which disabled the mission instances as soon as they are created.
-Tweaks: "Support pirates" missions now use the correct mission name instead of using "support raid" mission name.

v4.2.078 beta, PM 17 Jan 2022:
-Bug-fix: The last known navigation beacons weren't disappearing. In this version they are mission targets (i.e. gold targets in HUD) as they were supposed to be.

v4.2.077 beta, AM 17 Jan 2022:
-Bug-fix: Bug that prevented the target from getting identified - regardless of long-range-scan, in same zone, or in radar range.

v4.2.076 beta, 16 Jan 2022:
-New feature: Search and destroy missions. Read the relevant section below.

v4.2.04, 22 Dec 2021:
-Tweak: Mission titles changed to title case from sentence case. E.g.: "Escort Trader" instead of "Escort trader". (Sentence case for titles is still not yet widely adopted - even if some English Language "academics" prefer them. :frown)

v4.2.02, 16 Dec 2021:
-Tweak: Classification of sectors with adjacent enemy sectors as frontiers. Previously, the sector needed to be "contested" to be classified as a frontier. In this version, even home and safe, territory sectors can be frontiers. Sector classification is used to determine escort rewards.

v4.2.0, 10 Dec 2021:
-Bug-fix: Mayday! missions weren't completing properly. They now complete properly: when there are no enemies found nearby.
-Bug-fix: Invalid faction AIs were still persisting in sector raid and patrol missions.
-Tweak: Mayday! missions expire after 5min if not taken.
-Tweak: Support for Social Standings and Citizenships (SSaC) mod: because SSaC may remove friendly and alliance licences, relations are checked against Relationship Points (e.g. 10+, 20+).

v4.1.04, 15 Nov 2021:
-Bug-fix: Patrol/raid missions: Invalid faction goal AI references were persisting in these missions. This version will remove any mission that have these invalid references.
-Bug-fix: Patrol/raid missions: Invalid mission handler NPCs. This version will remove any mission that have these invalid references.
-New feature: Patrol/raid missions: Continuous mission completion to mission offer loops - if the ship's faction goal AI is still active.
-Tweak: Create offers only when the map is opened in the mission offers screen.
-Bug-fix: Enemy target assignment was inconsistent - sometimes not assigning your an available enemy target.

v4.1.03, 13 Nov 2021:
-Major bug-fix: Assigning targets to player ships was broken.
-Major bug-fix: Patrol/raid mission: after the debrief, the same mission may be re-offered but using the now obsolete mission instance.

v4.1.02, 12 Nov 2021:
-Major bug-fix: Patrol/raid mission: getting cancelled when you near the mission handler npc's location.

v4.1.01, 12 Nov 2021:
-New feature: Patrol/raid mission: Option to spawn mission handler NPCs at stations always.
-New feature: NPC-ordered defenders of mission ships will now get assigned attack orders. Previously, their behaviour was based only on the Protect Ship order.
-New feature: Mission failure conditions in briefings.
-New feature: Mission failures are logged.
-New feature: When a mission ship is more than 2 zones away from any of your ships, their travel engines are disabled for 3s - giving your ships time to catch up to them.
-Bug-fix: User reward multiplier were not shown in briefings or in mission logs - even if they were applied when they are given to you.
-Bug-fix: Patrol/raid mission: sometimes getting cancelled silently when you dock then undock at the mission handler npc location (e.g. while the mission was in progress or the mission wasn't completed internally).
-Bug-fix: Patrol/raid mission: When the mission leaves the sector, your support mission is only cancelled if their mission faction is cancelled. Previously, your mission is cancelled even if their patrol/raid mission is still ongoing only because they left their sector of operation.
-Bug-fix: Patrol/raid mission: When the mission ship's orders are updated by their faction, your mission wasn't updated appropriately - causing your mission to be cancelled prematurely.
-Bug-fix: Patrol/raid mission: Mission handler NPC will not spawn at a bar anymore.
-Tweak: Target assignment now takes distance of all best ships (based on size) into consideration.
-Tweak: Better handling of damage and kills data.
-Tweak: Reputations and Professions (RAP) mod compatibility: shorter mission names are used in RAP mission logs.
-Tweak: Patrol/raid mission: new mission offer trigger: faction relation change. Previously, triggers were only: sector change, controls taken/left, docked/undocked, conversation end.
-Tweak: Patrol/raid mission: Debriefing now shows the escort reward bonus.

v4.1.0, 6 Nov 2021: Non-beta release. Version set to 4.1.0 to follow the base game version number.

v0.5.51 (beta), 5 Nov 2021:
-Bug-fix: The mission handler NPC at defense stations was getting removed when you undock, preventing you from getting the debrief from them.
-Bug-fix: The mission timer wasn't getting updated.
-Tweak: When a targeted assigned target exits the sector, it is removed from your targeting computer.

v0.5.5 (beta), 5 Nov 2021:
-New feature: Extensions Options.
-New feature: Order your AI pilots to protect a mission ship - effectively letting them complete the mission. Note that you still need to get a briefing and debriefing yourself for the patrol/raid missions.
-Tweak: Better identification of when to create mission offers for patrol/raid missions by keeping track of active faction defend area subgoals, which drive those missions, instead of only waiting for ships of those subgoals to receive patrol/raid orders.
-New feature: Patrol/raid missions: If your mission ship is destroyed, you may be reassigned to another that is in your mission ship's fleet. I.e. the mission doesn't end if there are still other ships in the operation.
-New feature: Briefing cutscenes.
-New feature: Patrol/raid missions: You are notified of these updates: new mission ships, new enemy faction targets, new mission handler NPCs.
-New feature: Patrol/raid missions: The mission handler NPC will start at the mission ship but may move to a nearby defense station if the ship gets attacked. Your mission guidance will point you to them.
-New feature: Patrol/raid missions: Your escort time is shown and is updated every minute.
-New feature: Patrol/raid missions: You can request to end the mission with your mission ship pilot.
-New feature: Patrol/raid missions: Your contributions to the operation are highlighted in the debrief results.
-Tweak: Enemy acquisition now requires the target to be within range of one of the ships in the operation (including any of your ships).
-Bug-fixes: Many.

v0.5.4 (beta), 25 Oct 2021:
-Tweak: When the SW Interworlds mod is installed, the mission handler NPC will always be on a nearby defense station.

v0.5.3 (beta), 25 Oct 2021:
-New feature: Sector Patrols/Raids requirements: briefing to start the mission, debriefing to end. Read the Mission: Sector Patrol/Raid below.
-Tweak: Mission reward tweaks.
-Bug-fix: Reward calculation.
-Tweaks: Mayday! and Escort missions.

v0.5.2 (beta), 14 Oct 2021:
-Tweak: Captial ships with goal targets in their current sector are offered as Sector patrol/raid missions. Previously, only ships with goal targets outside their current sectors are offered as missions because you may enter their mission when nearing its end - resulting in very little time for you to participate.
-Bug-fix: The mod was assigning targets to you when you were not in control of a ship - causing mouse interactive bugs.

v0.5.1 (beta), 14 Oct 2021:
-New feature: Sector patrol mission and Sector raid mission. Read the Mission: Sector Patrol/Raid section below.
-New feature: Sector classifications used to modify rewards: home, territory, frontier, foreign territory, foreign home, enemy territory, enemy home.
-Bug-fix: prevent duplcation of Escort missions. Duplication occured because the game assigns multiple trade orders to the ship at one time based on the ship's cargo and the supply/demand of surrounding stations/sectors.
-Tweak: Mayday! and Escort mission offers time-out at 5min.
-Tweak: Mayday! and Escort missions:: If you're not within escort range for a total of 5 min, the mission will end - unless you have an assigned target.
-New feature: Relationship points awarded on mission completions.
-Tweak: Target asssigments are limited to factions attacking the mission ship and to factions that the mission ship attacks.
-Tweak: Escort missions: use station counts of trade orders instead of the trader order count. I.e. several trade orders can be assigned to one station on a trade run.
-Bug-fix: Mission texts.
-Tweak: Ship greeting when in zone - instead of when in nearby attention.
-Tweak: Target assignment priority. Read the Other Features section below.
-Tweak: Escort missions: The mission pointer will point to the ship initially. When you enter escort distance (100km), the mission pointer will point to both the ship and its destination. In the previous version, the mission pointer switched between the ship and the ship and its destination depending on whether you're in or out of escort distance.
-New version: Escort and Sector patrol/raid missions: Communicate with the ship to finish your escort duties and end the mission.
-Tweak: Escort: Only trading runs that will take the ship outside their current sector are offered as missions.

v0.5.0, 8 Oct 2021:
-Initial release.
