local Utils = require('client.utils')

-- Set Walk Style --
-- Use exports['xt-walkingstyles']:setWalkStyle(walk)
local function walkStyle(walk)
    currentWalk = walk
    Utils.SetWalkStyle(walk)
end
exports('setWalkStyle', walkStyle)

-- Menu Command --
RegisterCommand('walks', function()
    exports['xt-walkingstyles']:OpenWalkStylesMenu()
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