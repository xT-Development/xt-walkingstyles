# xt-walkingstyles

# Installation:
- Add the walking style metadata to `qb-core > server > player.lua`
```lua
PlayerData.metadata['walkstyle'] = PlayerData.metadata['walkstyle'] or 'default' -- xt-walkingstyles
```
- Find this function and replace it in `qb-smallresources > client >crouchprone.lua`
```lua
local function ResetAnimSet()
    local ped = PlayerPedId()
    if walkSet == "default" then
        ResetPedMovementClipset(ped, 0)
        ResetPedWeaponMovementClipset(ped)
        ResetPedStrafeClipset(ped)
    else
        ResetPedMovementClipset(ped, 0)
        ResetPedWeaponMovementClipset(ped)
        ResetPedStrafeClipset(ped)
        Wait(100)
        RequestWalking(walkSet)
        SetPedMovementClipset(ped, walkSet, 1)
        RemoveAnimSet(walkSet)
    end
    exports['xt-walkingstyles']:GetWalkStyle()
end
```

# How to Use:
- Use the `/walks` command to open the menu
- Use the `GetWalkStyle()` export in other scripts to retrieve your walkstyle and set it back
```lua
exports['xt-walkingstyles']:GetWalkStyle() -- Resets Walk Style to Saved Style
```

# Dependencies:
- ox_lib
- qb-core
