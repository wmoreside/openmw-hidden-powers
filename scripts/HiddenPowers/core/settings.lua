local async   = require("openmw.async")
local storage = require("openmw.storage")


local M = {}

local playerSettings = storage.globalSection("SettingsGlobalHiddenPowersPlayer")
local npcSettings = storage.globalSection("SettingsGlobalHiddenPowersNpc")
local guardSettings = storage.globalSection("SettingsGlobalHiddenPowersGuard")

local function getBool(section, key, default)
    local value = section:get(key)
    if value == nil then return default end
    return value
end

M.getPlayerLevel = function()
    return playerSettings:get("playerLevel") or 10
end

M.getNpcEnabled = function()
    return getBool(npcSettings, "npcEnabled", false)
end

M.getNpcLevel = function()
    return npcSettings:get("npcLevel") or 10
end

M.getGuardEnabled = function()
    return getBool(guardSettings, "guardEnabled", false)
end

M.getGuardLevel = function()
    return guardSettings:get("guardLevel") or 10
end

M.subscribePlayer = function(callback)
    playerSettings:subscribe(async:callback(callback))
end

M.subscribeNpc = function(callback)
    npcSettings:subscribe(async:callback(callback))
end

M.subscribeGuard = function(callback)
    guardSettings:subscribe(async:callback(callback))
end

return M
