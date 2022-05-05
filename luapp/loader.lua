parser = require("luapp.parser")
compiler = require("luapp.compiler")
insertion = require("luapp.insertion")

to_lua = function(code)
    assert(type(code) == "string", "Code provided is not a string. Aborting.")
    local ast, error = parser.parse(code)
    if not ast then return nil, error end
    local comp, iter, pos = compiler.compileAst(ast)
    return comp, iter
end

insert = function(args)
    insertion.run({to_lua = to_lua, args = args})
end

return {
    to_lua = to_lua,
    insert = insert
}