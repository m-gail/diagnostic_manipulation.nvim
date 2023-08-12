local M = {}

local old_set

local function filter_diagnostics(diagnostics)
    return vim.tbl_filter(function (diagnostic)
        for _, whitelist in pairs(M.config.whitelist) do
            if (whitelist(diagnostic)) then
                return true
            end
        end
        for _, blacklist in pairs(M.config.blacklist) do
            if (blacklist(diagnostic)) then
                return false
            end
        end
        return true
    end, diagnostics)
end

---Setup the plugin with given whitelists and blacklists
---@param config table a table containing whitelist and blacklist functions for the diagnostics
function M.setup(config)
    M.config = vim.tbl_deep_extend("force", { whitelist = {}, blacklist = {}}, config)
    old_set = vim.diagnostic.set
    vim.diagnostic.set = function (namespace, bufnr, diagnostics, opts)
        old_set(namespace, bufnr, filter_diagnostics(diagnostics), opts)
    end
end

return M
