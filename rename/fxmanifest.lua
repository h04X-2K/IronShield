fx_version 'adamant'
games {'gta5'}

description 'IronShield'

client_scripts {
	'client.lua',
}

server_scripts {
	'configs/*.lua',
	'tables/*.lua',
	'server.lua',
	'installer.lua',
	'@mysql-async/lib/MySQL.lua'
}



