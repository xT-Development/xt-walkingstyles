local QBCore = exports['qb-core']:GetCoreObject()

-- Get Walking Style --
RegisterServerEvent('xt-walkstyles:server:GetWalkStyle', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    TriggerClientEvent('xt-walkstyles:client:SetWalkStyle', src, Player.PlayerData.metadata['walkstyle'])
end)

-- Set Walking Style --
RegisterServerEvent('xt-walkstyles:server:SetWalkStyle', function(style)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    Player.PlayerData.metadata['walkstyle'] = style
    Player.Functions.SetMetaData('walkstyle', Player.PlayerData.metadata['walkstyle'])
    XTDebug('Walk Style Set', 'Citizen ID: '..Player.PlayerData.citizenid..' | Walk: '..style)
end)

-- Debug / Resource Print on Startup --
AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        Wait(500)
        XTDebug('xT Development', 'dsc.gg/xtdev ^7| '..resource)
    end
end)