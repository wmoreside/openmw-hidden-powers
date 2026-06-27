local playerManager = require("scripts.HiddenPowers.core.playerManager")
local settings      = require("scripts.HiddenPowers.core.settings")


-- So that it can be installed mid-game.
playerManager.tryGrantPower()

-- In case settings change eligibility.
settings.subscribePlayer(playerManager.tryGrantPower)

return {
    eventHandlers = {
        UiModeChanged = function(data)
            if data.oldMode == "LevelUp" then
                playerManager.tryGrantPower()
            end
        end,
    },
}
