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
RegisterNetEvent(tostring(config.PlayerLoad), function()
    Wait(100) -- I guess it needs this or it just doesnt set the walk style? Idk, fayoum
    local walk = Utils.fetchWalkStyle()
    Utils.setState(walk)
end)

RegisterNetEvent(tostring(config.PlayerUnload), function()
    TriggerServerEvent('xt-walkstyles:server:saveWalkstyle')
end)

AddEventHandler('onResourceStart', function(resource)
    if resource ~= GetCurrentResourceName() then return end
    local walk = Utils.fetchWalkStyle()
    Utils.setState(walk)
end)
