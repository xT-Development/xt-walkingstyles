return {
    getCharId = function(src)
        -- Use your own functions to get character ID
        -- Otherwise, Renewed-Lib can work as a multi-framework bridge

        local Bridge = exports['Renewed-Lib']:getLib()
        Bridge.getCharId(src)
    end
}