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