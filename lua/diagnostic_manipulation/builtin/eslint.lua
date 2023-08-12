local M = {}

---Filters eslint parsing errors
---@param diagnostic table diagnostic to filter
---@return boolean is_parsing_error true if diagnostic is an eslint parsing error
function M.eslint_parsing_error(diagnostic)
    return diagnostic.source == "eslint_d" and string.match(diagnostic.message, "^Parsing error.*$")
end

return M
