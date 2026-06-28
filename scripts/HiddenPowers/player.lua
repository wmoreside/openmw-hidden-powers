local async         = require("openmw.async")
local playerManager = require("scripts.HiddenPowers.core.playerManager")
local settings      = require("scripts.HiddenPowers.core.settings")
local state         = require("scripts.HiddenPowers.core.playerState")


-- So that it can be installed mid-game.
playerManager.tryGrantPower()

-- In case settings change eligibility.
settings.subscribePlayer(playerManager.tryGrantPower)

return {
    engineHandlers = {
        onSave = state.save,
        onLoad = state.load,
    },
    eventHandlers = {
        UiModeChanged = function(data)
            if data.oldMode == "LevelUp" then
                playerManager.tryGrantPower()
            elseif data.oldMode == "ChargenClassReview" then
                if state.isChargenComplete then return end
                async:newUnsavableSimulationTimer(0, function()
                    if state.isChargenComplete then return end
                    state.isChargenComplete = true
                    playerManager.tryApplySerpentCurse()
                end)
            end
        end,
    },
}
