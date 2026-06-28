local M = {
    isChargenComplete = false,
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
        isChargenComplete = M.isChargenComplete,
    }
end

return M
