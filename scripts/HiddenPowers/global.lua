local I = require("openmw.interfaces")


I.Settings.registerGroup {
    key = "SettingsGlobalHiddenPowersPlayer",
    page = "HiddenPowers",
    l10n = "HiddenPowers",
    name = "player_group_name",
    description = "player_group_description",
    permanentStorage = true,
    order = 0,
    settings = {
        {
            key = "playerLevel",
            renderer = "number",
            name = "playerLevel_name",
            default = 10,
            argument = {
                integer = true,
                min = 1,
            },
        },
    },
}

I.Settings.registerGroup {
    key = "SettingsGlobalHiddenPowersNpc",
    page = "HiddenPowers",
    l10n = "HiddenPowers",
    name = "npc_group_name",
    description = "npc_group_description",
    permanentStorage = true,
    order = 1,
    settings = {
        {
            key = "npcEnabled",
            renderer = "checkbox",
            name = "npcEnabled_name",
            default = false,
        },
        {
            key = "npcLevel",
            renderer = "number",
            name = "npcLevel_name",
            default = 10,
            argument = {
                integer = true,
                min = 1,
            },
        },
    },
}

I.Settings.registerGroup {
    key = "SettingsGlobalHiddenPowersGuard",
    page = "HiddenPowers",
    l10n = "HiddenPowers",
    name = "guard_group_name",
    description = "guard_group_description",
    permanentStorage = true,
    order = 2,
    settings = {
        {
            key = "guardEnabled",
            renderer = "checkbox",
            name = "guardEnabled_name",
            default = false,
        },
        {
            key = "guardLevel",
            renderer = "number",
            name = "guardLevel_name",
            default = 10,
            argument = {
                integer = true,
                min = 1,
            },
        },
    },
}
