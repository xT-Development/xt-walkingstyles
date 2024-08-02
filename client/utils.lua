local config = require 'configs.client'
local randol_medical = (GetResourceState('randol_medical') == 'started')
local playerState = LocalPlayer.state
local Utils = {}

-- Sets Walkstyle --
function Utils.setWalkStyle(style)
    local walk = style or 'default'
    local ped = cache.ped
    if walk == 'default' then
        ResetPedMovementClipset(ped)
        ResetPedWeaponMovementClipset(ped)
        ResetPedStrafeClipset(ped)
    else
        lib.requestAnimSet(walk)
        SetPedMovementClipset(ped, walk)
        ResetPedWeaponMovementClipset(ped)
        ResetPedStrafeClipset(ped)
    end
end

-- Get Current Walk Style --
function Utils.getWalkStyle()
    return playerState?.walkstyle or 'default'
end exports('GetWalkStyle', Utils.getWalkStyle)

-- Init Walk Style on Load --
function Utils.fetchWalkStyle()
    local walkStyle = lib.callback.await('xt-walkstyles:server:getWalkStyle', false)
    return walkStyle
end

-- Check if Player is in an Ignored Clipset --
function Utils.ignoredClipsetCheck(clipset)
    if randol_medical and (playerState.bleeding >= 35 or playerState.hasEffect) then
        return true
    end

    local walkState = playerState?.walkstyle
    if walkState and (clipset == joaat(walkState)) then
        return true
    end

    local callback = false

    for x = 1, #config.IgnoredClipsets do
        if joaat(config.IgnoredClipsets[x]) == clipset then
            callback = true
            break
        end
    end

    return callback
end

-- Sets Walk Style State --
function Utils.setState(newState)
    local state = playerState
    if state then
        state:set('walkstyle', newState, true)
    end
end exports('SetWalkStyle', Utils.setState)

return Utils
