local myCharID = 0
local Whitelists = {}

function isWhitelisted(groupid)
	local _wl = Whitelists[groupid]
	local _me = exports['fsn_main']:fsn_CharID()
	
	if _wl.owner == _me then -- or table.contains(_wl.access, _me) then
		print(_me..' is whitelisted in '.._wl.title..' (owned by: '.._wl.owner..')')
		return true
	else
		for k, v in pairs(_wl.access) do
			if v.charid == _me then
				print(_me..' is whitelisted in '.._wl.title..' (owned by: '.._wl.owner..')')
				return true
			end
		end
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

----------------------------------------------
-- CLOCKIN SHIT
----------------------------------------------
local current_clockid = 0
function toggleWhitelistClock(id)
	print('toggling clock for id '..id)
	if current_clockid == 0 then
		-- not clocked in
		TriggerServerEvent('fsn_jobs:whitelist:clock:in', exports["fsn_main"]:fsn_CharID(), id)
	else
		-- is clocked in 
		TriggerServerEvent('fsn_jobs:whitelist:clock:out', exports["fsn_main"]:fsn_CharID(), current_clockid)
	end
end
function isWhitelistClockedIn(id)
	if current_clockid == id then
		return true
	else
		return false
	end
end

RegisterNetEvent('fsn_jobs:whitelist:clock:in')
AddEventHandler('fsn_jobs:whitelist:clock:in', function(id)
	current_clockid = id
end)
RegisterNetEvent('fsn_jobs:whitelist:clock:out')
AddEventHandler('fsn_jobs:whitelist:clock:out', function()
	current_clockid = 0
end)

RegisterNetEvent('fsn_jobs:whitelist:update')
AddEventHandler('fsn_jobs:whitelist:update', function(tbl)
	Whitelists = tbl
end)

TriggerServerEvent('fsn_jobs:whitelist:request')