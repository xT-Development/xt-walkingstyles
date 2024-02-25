return {
    charId = function(src)
        -- Use your own functions to get character ID
        local Player = exports['qb-core']:GetCoreObject().Functions.GetPlayer(src)
        return Player.PlayerData.citizenid
    end
}