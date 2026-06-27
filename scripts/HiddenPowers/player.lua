local playerManager = require("scripts.HiddenPowers.core.playerManager")


-- So that it can be installed mid-game.
playerManager.tryGrantPower()

return {
    eventHandlers = {
        UiModeChanged = function(data)
            if data.oldMode == "LevelUp" then
                playerManager.tryGrantPower()
            end
        end,
    },
}
