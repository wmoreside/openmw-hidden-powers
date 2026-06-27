local M = {
    cooldownUntil = nil,
}

M.load = function(data)
    if data then
        for k, v in pairs(data) do
            M[k] = v
        end
    end
end

M.save = function()
    return {
        cooldownUntil = M.cooldownUntil,
    }
end

return M
