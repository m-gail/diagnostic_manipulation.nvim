# diagnostic_manipulation.nvim

Filter and manipulate diagnostics in neovim.

## Setup

Install with your favourite package manager, for example, [lazy.nvim](https://github.com/folke/lazy.nvim).
And call the setup function.

This example will remove the unused variable diagnostic provided by tsserver.

```lua
{
        "m-gail/diagnostic_manipulation.nvim",
        init = function ()
            require("diagnostic_manipulation").setup {
                blacklist = {
                    require("diagnostic_manipulation.builtin.tsserver").tsserver_codes({ 6133, 6196 })
                },
                whitelist = {
                    -- Your whitelist here
                }
            }
        end
    }
```

## Writing your own filters

The filters are just functions getting one diagnostic as an argument, returning true if they apply.
If any whitelist filter applies, the diagnostic will show, even if it is affected by a blacklist filter.
If a diagnostic is affected by a blacklist filter, it will not be removed.
You can also manipulate the diagnostics inside of filters (for example changing the severity).

## Builtins

Check the `lua/diagnostic_manipulation/builtin` folder for builtin whitelist/blacklist functions.
