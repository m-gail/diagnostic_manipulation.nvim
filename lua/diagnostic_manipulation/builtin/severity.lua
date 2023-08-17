local M = {}

---Changes all severities for one specific source by the amount specified
---@param source string source for which severities should be modified
---@param amount number amount by which to modify severities, e.g. -1 will make errors to warnings
---@return function filter a function which always returns true and changes the severities
function M.change_severities(source, amount)
    return function(diagnostic)
        if diagnostic.source == source then
            -- vim.diagnostic.severity has error as lowest and hint as highest
            diagnostic.severity = diagnostic.severity - amount
            diagnostic.severity = math.max(vim.diagnostic.severity.ERROR,
                math.min(vim.diagnostic.severity.HINT, diagnostic.severity))
        end
        return false
    end
end

return M
