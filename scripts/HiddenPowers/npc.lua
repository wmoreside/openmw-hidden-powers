local I          = require("openmw.interfaces")
local time       = require("openmw_aux.time")
local npcManager = require("scripts.HiddenPowers.core.npcManager")
local state      = require("scripts.HiddenPowers.core.state")


I.AnimationController.addTextKeyHandler("spellcast", function(_, key)
    if key:sub(- #"release") == "release" then
        npcManager.onSpellcastRelease()
    end
end)

time.runRepeatedly(npcManager.tryGrantPower, time.hour, { type = time.GameTime })

return {
    engineHandlers = {
        onSave = state.save,
        onLoad = state.load,
        onActive = function()
            npcManager.tryGrantPower()
        end,
    },
}
