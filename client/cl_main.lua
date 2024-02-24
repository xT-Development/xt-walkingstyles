local playerState = LocalPlayer.state
local Utils = require 'client.utils'
local config = require 'configs.client'

-- Menu Command --
RegisterCommand('walks', function()
    TriggerEvent('xt-walkstyles:client:openMenu')
end, false)

-- Constantly Reset Walk Style --
lib.onCache('vehicle', function(vehicle)
    if not vehicle then
        SetTimeout(0, function()
            while not cache.vehicle do
                local clipset = GetPedMovementClipset(cache.ped)
                local state = playerState?.walkstyle
                if (clipset ~= state) and not Utils.ignoredClipsetCheck(clipset) then
                    Utils.setWalkStyle(state)
                end
                Wait(500)
            end
        end)
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
