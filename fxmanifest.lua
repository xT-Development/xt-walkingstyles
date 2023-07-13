-- FX Information
fx_version 'cerulean'
use_experimental_fxv2_oal 'yes'
game 'gta5'
lua54 'yes'

-- Resource Information
name 'xt-walkingstyles'
author 'xThrasherrr'
version '2.0.0' -- Thrasherrr, you can set the version to whatever at this point
repository 'https://github.com/xT-Development/xt-walkingstyles'
description 'Walk Styles for QBCore / FiveM'

-- Manifest
client_scripts { 'client/*.lua' }
server_scripts { 'server/*.lua' }
shared_scripts { '@ox_lib/init.lua', 'shared/*.lua' }

dependency 'ox_lib'