return {
    charId = function(src)
        -- Use your own functions to get character ID
        local Player = exports.qbx_core:GetPlayer(src)
        return Player and Player.PlayerData.citizenid or nil
    end
}