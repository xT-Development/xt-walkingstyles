-- Walk Styles Menu --
local function OpenWalkStylesMenu()
    local walkStyles = {}

    walkStyles[#walkStyles+1] = {
        title = 'Refresh Current Walk Style',
        serverEvent = 'xt-walkstyles:server:GetWalkStyle',
    }

    for r = 1, #Config.Styles, 1 do
        walkStyles[#walkStyles+1] = {
            title = Config.Styles[r].name,
            onSelect = function()
                exports['xt-walkingstyles']:setWalkStyle(Config.Styles[r].value)
            end,
        }
    end

    lib.registerContext({
        id = 'walkingstyles_menu',
        title = 'Walking Styles',
        options = walkStyles
    })
    lib.showContext('walkingstyles_menu')
end
exports('OpenWalkStylesMenu', OpenWalkStylesMenu)

-- exports['xt-walkingstyles']:OpenWalkStylesMenu()