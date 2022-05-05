return function(args)
    local loader = require("luapp.loader")
    local args = require("luapp.util.args")
    loader.insert(args.parseluau(args))
    return true
end