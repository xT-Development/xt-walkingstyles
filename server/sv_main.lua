-- Get Walking Style --
lib.callback.register('xt-walkstyles:server:GetWalkStyle', function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    local style = Player.PlayerData.metadata['walkstyle']
    XTDebug('Get Walk Style', 'Citizen ID: '..Player.PlayerData.citizenid..' | Walk: '..style)
    return style
end)

-- Set Walking Style --
RegisterServerEvent('xt-walkstyles:server:SetWalkStyle', function(style)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    local currentStyle = Player.PlayerData.metadata.walkstyle
    if currentStyle == style then return end
    Player.Functions.SetMetaData('walkstyle', style)
    XTDebug('Walk Style Set', 'Citizen ID: '..Player.PlayerData.citizenid..' | Walk: '..style)
end)