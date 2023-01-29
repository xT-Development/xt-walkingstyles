local QBCore = exports['qb-core']:GetCoreObject()

-- Walk Styles Menu --
RegisterNetEvent('xt-walkstyles:client:Menu', function()
    local walkStyles = {}

    if lib then
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
    else
        walkStyles[#walkStyles+1] = {
            header = 'Refresh Current Walk Style',
            params = {
                isServer = true,
                event = 'xt-walkstyles:server:GetWalkStyle',
            }
        }

        for r = 1, #Config.Styles, 1 do
            walkStyles[#walkStyles+1] = {
                header = Config.Styles[r].name,
                params = {
                    event = 'xt-walkstyles:client:SetWalkStyle',
                    args = Config.Styles[r].value
                }
            }
        end

        walkStyles[#walkStyles+1] = {
            header = 'Close Menu',
            params = {
                event = 'qb-menu:client:closeMenu',
            }
        }

        exports['qb-menu']:openMenu(walkStyles)
    end
end)