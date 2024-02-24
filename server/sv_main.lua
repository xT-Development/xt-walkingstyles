local config = require 'configs.server'

-- Get Walking Style --
lib.callback.register('xt-walkstyles:server:GetWalkStyle', function(source)
    local src = source
    local charID = config.getCharId(src)
    local style = GetResourceKvpString(('%s_walkstyle'):format(charID)) or 'default'
    return style
end)

-- Save Walking Style When Player Leaves --
AddEventHandler('playerDropped', function()
    local src = source
    local charID = config.getCharId(src)
    local setStyle = Player(src).state?.walkstyle
    SetResourceKvp(('%s_walkstyle'):format(charID), setStyle)
end)

-- Save Walking Style For All Players --
AddEventHandler('onResourceStop', function(resource)
    if resource ~= GetCurrentResourceName() then return end
    for _, src in ipairs(GetPlayers()) do
        local charID = config.getCharId(src)
        local setStyle = Player(src).state?.walkstyle or 'default'
        SetResourceKvp(('%s_walkstyle'):format(charID), setStyle)
    end
end)