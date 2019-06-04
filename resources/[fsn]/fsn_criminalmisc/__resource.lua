resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"
-- client
client_script 'client.lua'

-- handcuffs
client_script 'handcuffs/client.lua'
server_script 'handcuffs/server.lua'

-- robbing
client_script 'robbing/client.lua'
server_script 'robbing/server.lua'

-- streetracing
client_script 'streetracing/client.lua'
server_script 'streetracing/server.lua'

-- remapping
client_script 'remapping/client.lua'
server_script 'remapping/server.lua'

-- lockpicking
client_script 'lockpicking/client.lua'

-- weapon info
client_script 'weaponinfo/client.lua'
client_script 'weaponinfo/weapon_list.lua'
server_script 'weaponinfo/server.lua'

-- drugs
client_script 'drugs/client.lua'
client_script 'drugs/_streetselling/client.lua'
server_script 'drugs/_streetselling/server.lua'
client_script 'drugs/_weedprocess/client.lua'

exports {
	"GetWeapons",
	"weaponInfo",
	"HoldingWeapon"
}