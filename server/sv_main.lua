local config = require 'configs.server'

-- Handles Saving Walk Style --
local function saveWalkStyle(src)
    local charID = config.charId(src)
    local setStyle = Player(src).state?.walkstyle
    SetResourceKvp(('%s_walkstyle'):format(charID), setStyle)
end

-- Get Walking Style --
lib.callback.register('xt-walkstyles:server:getWalkStyle', function(source)
    local src = source
    local charID = config.charId(src)
    local style = GetResourceKvpString(('%s_walkstyle'):format(charID)) or 'default'
    return style
end)

-- Saves Walk Style on Logout --
RegisterNetEvent('xt-walkstyles:server:saveWalkstyle', function()
    local src = source
    saveWalkStyle(src)
end)

-- Save Walking Style When Player Drops --
AddEventHandler('playerDropped', function()
    local src = source
    saveWalkStyle(src)
end)

-- Save Walking Style For All Players --
AddEventHandler('onResourceStop', function(resource)
    if resource ~= GetCurrentResourceName() then return end
    for _, src in ipairs(GetPlayers()) do
        saveWalkStyle(tonumber(src))
    end
end)