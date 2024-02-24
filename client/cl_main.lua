local Utils = require 'client.utils'
local config = require 'configs.client'

-- Menu Command --
RegisterCommand('walks', function()
    TriggerEvent('xt-walkstyles:client:openMenu')
end, false)

-- Constantly Reset Walk Style --
CreateThread(function()
    local sleep = 500
    while true do
        if not cache.vehicle then
            local clipset = GetPedMovementClipset(cache.ped)
            local state = LocalPlayer.state?.walkstyle
            if (clipset ~= state) and not Utils.ignoredClipsetCheck(clipset) then
                Utils.setWalkStyle(state)
            end
            sleep = 500
        else
            sleep = 2000
        end
        Wait(sleep)
    end
end)

-- Walkstyle Statebag --
AddStateBagChangeHandler('walkstyle', ('player:%s'):format(cache.serverId), function(_, _, value)
    Utils.setWalkStyle(value)
end)

-- Handlers --
RegisterNetEvent(config.PlayerLoad, function()
    Utils.getWalkStyle()
end)

AddEventHandler('onResourceStart', function(resource)
    if resource ~= GetCurrentResourceName() then return end
    Utils.getWalkStyle()
end)