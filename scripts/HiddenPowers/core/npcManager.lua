local core     = require("openmw.core")
local omwself  = require("openmw.self")
local types    = require("openmw.types")
local time     = require("openmw_aux.time")
local powers   = require("scripts.HiddenPowers.core.powers")
local settings = require("scripts.HiddenPowers.core.settings")
local state    = require("scripts.HiddenPowers.core.npcState")


local M = {}

local function spellExists(spellId)
    return core.magic.spells.records[spellId] ~= nil
end

local function getSpellId()
    if not types.NPC.objectIsInstance(omwself) then return nil end
    local record = types.NPC.record(omwself)
    if not record then return nil end
    local entry = powers[record.race]
    return entry and entry.npc or nil
end

local function isGuard()
    local record = types.NPC.record(omwself)
    if not record or not record.class then return false end
    return string.find(string.lower(record.class), "guard", 1, true) ~= nil
end

local function hasSpell(spellId)
    for _, spell in pairs(types.Actor.spells(omwself)) do
        if spell.id == spellId then return true end
    end
    return false
end

local function isEligible()
    local level = types.Actor.stats.level(omwself).current
    if isGuard() then
        return settings.getGuardEnabled() and level >= settings.getGuardLevel()
    end
    return settings.getNpcEnabled() and level >= settings.getNpcLevel()
end

M.tryGrantPower = function()
    local spellId = getSpellId()
    if not spellId or not spellExists(spellId) then return end

    local spells = types.Actor.spells(omwself)

    if not isEligible() then
        state.cooldownUntil = nil
        if hasSpell(spellId) then
            spells:remove(spellId)
        end
        return
    end

    if state.cooldownUntil then
        if core.getGameTime() >= state.cooldownUntil then
            state.cooldownUntil = nil
            if not hasSpell(spellId) then
                spells:add(spellId)
            end
        elseif hasSpell(spellId) then
            spells:remove(spellId)
        end
        return
    end

    if not hasSpell(spellId) then
        spells:add(spellId)
    end
end

M.onSpellcastRelease = function()
    local spellId = getSpellId()
    if not spellId then return end

    local spells = types.Actor.spells(omwself)
    if not hasSpell(spellId) then return end

    local selected = types.Actor.getSelectedSpell(omwself)
    if selected and selected.id ~= spellId then return end

    spells:remove(spellId)
    state.cooldownUntil = core.getGameTime() + time.day
end

return M
