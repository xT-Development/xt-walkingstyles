currentWalk = 'default'

local Utils = {}

function Utils.SetWalkStyle(walk)
	local ped = cache.ped
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
function Utils.GetWalkStyle()
	local walk = lib.callback.await('xt-walkstyles:server:GetWalkStyle', false)
	if walk ~= nil then
		currentWalk = walk
		Utils.SetWalkStyle(walk)
    end
end
exports('GetWalkStyle', Utils.GetWalkStyle)

-- Check if Player is in an Ignored Clipset --
function Utils.IgnoredClipsets()
	if currentWalk == 'default' then return true end

    local callback = false
	local ped = cache.ped
	local walk = GetPedMovementClipset(ped)

    if walk == joaat(currentWalk) then return true end

	for _,x in pairs(Config.IgnoredClipsets) do
		if joaat(x) == walk then callback = true break end
	end
	return callback
end

return Utils