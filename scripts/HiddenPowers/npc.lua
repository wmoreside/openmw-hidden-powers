local I          = require("openmw.interfaces")
local time       = require("openmw_aux.time")
local npcManager = require("scripts.HiddenPowers.core.npcManager")
local settings   = require("scripts.HiddenPowers.core.settings")
local state      = require("scripts.HiddenPowers.core.npcState")


I.AnimationController.addTextKeyHandler("spellcast", function(_, key)
    if key:sub(- #"release") == "release" then
        npcManager.onSpellcastRelease()
    end
end)

-- In case a power goes off cooldown while the NPC is still active.
time.runRepeatedly(npcManager.tryGrantPower, time.hour, { type = time.GameTime })

-- In case settings change eligibility.
settings.subscribeNpc(npcManager.tryGrantPower)
settings.subscribeGuard(npcManager.tryGrantPower)

return {
    engineHandlers = {
        onSave = state.save,
        onLoad = state.load,
        onActive = function()
            npcManager.tryGrantPower()
        end,
    },
}
