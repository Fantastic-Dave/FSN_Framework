-- GLOBAL UTILS
client_script '@fsn_main/cl_utils.lua'
server_script '@fsn_main/sv_utils.lua'

resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

client_script 'client.lua'

-- exports
exports {
	"fsn_ProgressBar",
	"removeBar"
}