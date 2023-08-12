local M = {}

---Filters for specific tsserver codes when using nvim-lspconfig
---@param codes table a list of codes to filter for
---@return function filter a function returning true if codes contains the given diagnostic's code
function M.tsserver_codes(codes)
    return function(diagnostic)
        return diagnostic.source == "typescript" and vim.tbl_contains(codes, diagnostic.code)
    end
end

return M
