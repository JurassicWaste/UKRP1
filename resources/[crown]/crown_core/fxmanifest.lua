fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name 'crown_core'
author 'Matthew Hector'
description 'Crown Framework core - built for serious british roleplay'
version '0.1.0'

shared_scripts {
    '@oxmysql/lib/MySQL.lua',
    'shared/config.lua',
    'shared/jobs.lua',
    'shared/utils.lua'
}

client_scripts {
    'client/main.lua'
}

server_scripts {
    'server/main.lua',
    'server/callbacks.lua'
}

exports {
    'GetPlayerData'
}

server_exports {
    'GetPlayer',
    'GetPlayerByCitizenId',
    'SetJob',
    'HasPermission'
}
