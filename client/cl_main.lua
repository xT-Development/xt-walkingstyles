local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = {}
local currentWalk = 'default'

-- Set Walk Style (Send to Server & Set Metadata) --
local function WalkStyle(walk)
	local ped = PlayerPedId()
	if walk == 'default' then
		ResetPedMovementClipset(ped)
		ResetPedWeaponMovementClipset(ped)
		ResetPedStrafeClipset(ped)
	else
		RequestAnimSet(walk)
		while not HasAnimSetLoaded(walk) do Wait(0) end
		SetPedMovementClipset(ped, walk)
		ResetPedWeaponMovementClipset(ped)
		ResetPedStrafeClipset(ped)
	end
    TriggerServerEvent('xt-walkstyles:server:SetWalkStyle', walk)
    XTDebug('Walk Style Changed', 'Style: '..walk)
end

-- Reset Walking Style --
local function GetWalkStyle()
    TriggerServerEvent('xt-walkstyles:server:GetWalkStyle')
end
exports('GetWalkStyle', GetWalkStyle)

-- Walk Styles Menu --
RegisterNetEvent('xt-walkstyles:client:Menu', function()
    local walkStyles = {}

    walkStyles[#walkStyles+1] = {
        title = 'Refresh Current Walk Style',
        serverEvent = 'xt-walkstyles:server:GetWalkStyle',
    }

    for r = 1, #Config.Styles, 1 do
        walkStyles[#walkStyles+1] = {
            title = Config.Styles[r].name,
            event = 'xt-walkstyles:client:SetWalkStyle',
            args = Config.Styles[r].value
        }
    end
    lib.registerContext({
        id = 'walkingstyles_menu',
        title = 'Walking Styles',
        options = walkStyles
    })
    lib.showContext('walkingstyles_menu')
end)

-- Set Walk Style --
RegisterNetEvent('xt-walkstyles:client:SetWalkStyle', function(walk)
    Switching = true
    currentWalk = walk
	WalkStyle(walk)
end)

-- Menu Command --
RegisterCommand('walks', function()
    TriggerEvent('xt-walkstyles:client:Menu')
end)

-- Player Shit --
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function(playerData)
	PlayerData = QBCore.Functions.GetPlayerData()
    Wait(500)
	TriggerServerEvent('xt-walkstyles:server:GetWalkStyle')
end)
