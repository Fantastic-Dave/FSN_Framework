local myCharID = 0
local Whitelists = {}

function isWhitelisted(groupid)
	local _wl = Whitelists[groupid]
	local _me = exports['fsn_main']:fsn_CharID()
	
	if _wl.owner == _me or table.contains(_wl.access, _me) then
		return true
	else
		print(_me..' is not whitelisted in '.._wl.title..' (owned by: '.._wl.owner..')')
		return false
	end
end

function getWhitelistDetails(groupid)
	return Whitelists[groupid]
end

function inAnyWhitelist()
	local myWhitelists = {}
	for k, _wl in pairs(Whitelists) do
		if isWhitelisted(k) then
			table.insert(myWhitelists, #myWhitelists+1, k)
		end
	end
	if myWhitelists == {} then
		return false
	else
		return myWhitelists
	end
end

RegisterNetEvent('fsn_jobs:whitelist:update')
AddEventHandler('fsn_jobs:whitelist:update', function(tbl)
	Whitelists = tbl
end)
TriggerServerEvent('fsn_jobs:whitelist:request')