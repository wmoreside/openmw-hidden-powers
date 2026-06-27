# Hidden Powers for OpenMW

[Hidden Powers - Races Refined](https://www.nexusmods.com/morrowind/mods/56769), [Hidden Powers - Races of Tamriel](https://www.nexusmods.com/morrowind/mods/58172) and [The Firmament - Birthsigns Refined](https://www.nexusmods.com/morrowind/mods/56771), tweaked for better compatibility with OpenMW. All plugins are based on the "Native Names" versions.

## Changes from the Original Mods

Reimplemented the following mwscript features in Lua:

- Granting racial powers to the player once they reach a specific level.
- Granting racial powers to high level NPCs.
- Serpent birthsign's drain effect.

Converted all toggle spells to permanent abilities. This was another mwscript feature that wasn't working in OpenMW, but rather than reimplementing it my preference was simply to turn them into abilities. Night Eye looks good in OpenMW, and if an Argonian really wants to join the temple, they can work around the Puzzle Canal quest by damaging themselves while underwater.

Changed the slowfall magnitude of Feline Grace from 10 to 1, as the original value was based on tweaks from MCP.

NOT implemented is the feature of unlocking new races by meeting them in game.

A couple of misc tweaks unrelated to engine differences:

- Renamed Orc to Orsimer since this is based on the Native Names plugins.
- Renamed Khajiit to Suthay-raht in the Tamriel Races plugin, for consistency with all of the other Khajiit breeds.
- Renamed the Imperial's racial power to Star of the West (bug fix).
- Changed the Ohmes and Cathay-raht racial powers to match the mod's description page (bug fix).

## Requirements

OpenMW 0.49 or above.

Tamriel Data if using the Tamriel races plugin.
