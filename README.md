# xt-walkingstyles

# Installation:
- Add the walking style metadata to `qb-core > server > player.lua`
```lua
PlayerData.metadata['walkstyle'] = PlayerData.metadata['walkstyle'] or 'default' -- xt-walkingstyles
```

# How to Use:
- Use the `/walks` command to open the menu
- Use the `GetWalkStyle()` export in other scripts to retrieve your walkstyle and set it back
    - You should not need this as there is a thread constantly checking your walk style and resetting it if needed. But, it's there, use it if you need it.
```lua
exports['xt-walkingstyles']:GetWalkStyle() -- Resets Walk Style to Saved Style
```

# Dependencies:
- ox_lib or qb-menu
- qb-core

### Credits:
All of the walkingstyle scripts out there, as this is heavily inspired by all of them. This is just my version of it using player metadata.
