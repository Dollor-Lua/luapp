do
    local loader = require("luapp.loader")
    local args = require("luapp.util.args")
    loader.insert(args.parse(arg))
    return true
end

return false