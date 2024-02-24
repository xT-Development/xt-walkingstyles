local Utils = require 'client.utils'
local config = require 'configs.client'

-- Menu of Searched Walkingstyles --
local function searchedMenu(styles)
    local walkStyles = {}

    for x = 1, #styles do
        local styleIndex = styles[x]

        walkStyles[#walkStyles+1] = {
            title = config.Styles[styleIndex].name,
            onSelect = function()
                Utils.setState(config.Styles[styleIndex].value)
            end,
        }
    end

    lib.registerContext({
        id = 'walkingstyles_searched_menu',
        title = 'Found Walking Styles',
        menu = 'walkingstyles_menu',
        options = walkStyles
    })
    lib.showContext('walkingstyles_searched_menu')
end

-- Return Search --
local function searchForStyles(input)
    local foundStyles = {}

    for x = 1, #config.Styles do
        local info = config.Styles[x]
        local checkName = string.find(info.name, input)
        local checkClipset = string.find(info.value, input)

        if checkName or checkClipset then
            foundStyles[#foundStyles+1] = x
        end
    end

    return foundStyles
end

-- Walk Styles Menu --
RegisterNetEvent('xt-walkstyles:client:openMenu', function()
    local walkStyles = {}

    walkStyles[#walkStyles+1] = {
        title = 'Search For Walkstyle',
        icon = 'fas fa-magnifying-glass',
        onSelect = function()
            local styleSearch = lib.inputDialog('Walkstyle Search', {
                { type = 'input', label = 'Style', required = true },
            }) if not styleSearch then lib.showContext('walkingstyles_menu') return end
            local found = searchForStyles(styleSearch[1])

            if not found[1] then
                lib.notify({ title = 'None Found', type = 'error' })
                lib.showContext('walkingstyles_menu')
                return
            end

            searchedMenu(found)
        end
    }

    for x = 1, #config.Styles do
        walkStyles[#walkStyles+1] = {
            title = config.Styles[x].name,
            onSelect = function()
                Utils.setState(config.Styles[x].value)
            end,
        }
    end

    lib.registerContext({
        id = 'walkingstyles_menu',
        title = 'Walking Styles',
        options = walkStyles
    })
    lib.showContext('walkingstyles_menu')
end)