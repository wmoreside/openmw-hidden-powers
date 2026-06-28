local core     = require("openmw.core")
local omwself  = require("openmw.self")
local types    = require("openmw.types")
local ui       = require("openmw.ui")
local powers   = require("scripts.HiddenPowers.core.powers")
local settings = require("scripts.HiddenPowers.core.settings")


local M = {}

local function spellExists(spellId)
    return core.magic.spells.records[spellId] ~= nil
end

local function getSpellId()
    local record = types.NPC.record(omwself)
    if not record then return nil end
    local entry = powers[record.race]
    return entry and entry.player or nil
end

local function hasSpell(spellId)
    for _, spell in pairs(types.Actor.spells(omwself)) do
        if spell.id == spellId then return true end
    end
    return false
end

M.tryApplySerpentCurse = function()
    local spellId = "serpent curse"
    if not spellExists(spellId) or not hasSpell(spellId) then return end

    local spell = core.magic.spells.records[spellId]
    if not spell then return nil end

    for _, effect in pairs(spell.effects) do
        if effect.id == core.magic.EFFECT_TYPE.DrainAttribute and effect.affectedAttribute then
            local magnitude = effect.magnitudeMax or effect.magnitudeMin or 0
            local attributeId = effect.affectedAttribute
            local stat = types.Actor.stats.attributes[attributeId](omwself)
            stat.base = math.max(0, stat.base - magnitude)
        end
    end
end

M.tryGrantPower = function()
    local spellId = getSpellId()
    if not spellId or not spellExists(spellId) then return end

    local level = types.Actor.stats.level(omwself).current
    local eligible = level >= settings.getPlayerLevel()
    local spells = types.Actor.spells(omwself)

    if eligible and not hasSpell(spellId) then
        spells:add(spellId)
        ui.showMessage(
            "As you awake, hanging in-between the worlds of dream and reality, " ..
            "a vision of all that you have become flashes before your eyes. " ..
            "The world slowly comes into focus. You breathe deep, then smile. " ..
            "You have unlocked a new Power!")
    elseif not eligible and hasSpell(spellId) then
        spells:remove(spellId)
    end
end

return M
