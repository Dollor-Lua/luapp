return {
    parseluau = function(args)
        local final = args
        final["LuaU"] = true
        return final
    end,

    parse = function(args)
        local final = {LuaU = false}

        local indexing = "NONE"
        for i,v in pairs(args) do
            if indexing == "NONE" then
                if v == "-f" or v == "--file" then
                    indexing = "FILE"
                else
                    assert(false, "UNKNOWN OPTION: " .. v)
                end
            elseif indexing == "FILE" then
                final["source"] = v -- TODO: parse file for source
                indexing = "NONE"
            end
        end
    end
}