local Utils = require('client.utils')

-- Set Walk Style --
RegisterNetEvent('xt-walkstyles:client:SetWalkStyle', function(walk) Utils.SetWalkStyle(walk) end)

-- Menu Command --
RegisterCommand('walks', function()
    TriggerEvent('xt-walkstyles:client:Menu')
end, false)

-- Constantly Reset Walk Style --
CreateThread(function()
    while true do
        Wait(1000)
        if not Utils.IgnoredClipsets() then
            Utils.GetWalkStyle()
            XTDebug('Reset Walk Style', 'Style: '..currentWalk)
        end
    end
end)

-- Player Load / Resource Start  --
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function() Utils.GetWalkStyle() end)
AddEventHandler('onResourceStart', function(resource) if resource == GetCurrentResourceName() then Utils.GetWalkStyle() end end)