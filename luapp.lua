-- determine if LuaU (or any non CLI Lua) or true Lua

exists = function(var)
    for index, _ in pairs(_G) do
        if index == var then return true end
    end
    return false
end

local LuaU = true
if exists("arg") then LuaU = false end

if not LuaU then
    require("luapp.init")
else
    local init = require("luapp.luau.init")

    return {
        run = init
    }
end
