# Hidden Powers for OpenMW

[Hidden Powers - Races Refined](https://www.nexusmods.com/morrowind/mods/56769), [Hidden Powers - Races of Tamriel](https://www.nexusmods.com/morrowind/mods/58172) and [The Firmament - Birthsigns Refined](https://www.nexusmods.com/morrowind/mods/56771), tweaked for better compatibility with OpenMW. All plugins are based on the "Native Names" versions.

## Changes from the Original Mods

- Converted all toggle spells to permanent abilities, as they were not working in OpenMW.
- Changed the slowfall magnitude of Feline Grace from 10 to 1, as the original value was based on tweaks from MCP.
- Reimplemented the power-unlocking feature in Lua, because the mwscript version would occasionally fail in OpenMW.
- Reimplemented the Serpent birthsign's drain effect in Lua, since that script was also not working in OpenMW.
- Implemented the previously MWSE-exclusive feature that grants powers to NPCs in Lua.

NOT implemented is the feature of unlocking new races by meeting them in game.

## Requirements

OpenMW 0.49 or above.

Tamriel Data if using the Tamriel races plugin.
