local M = {}

M.contains = function(array, element)
    for key, value in ipairs(array) do
        if element == value then
            return true
        end
    end
    return false
end

M.firstOccurence = function(array, element)
    for key, value in ipairs(array) do
        if element == value then
            return key
        end
    end
    return nil 
end

return M
