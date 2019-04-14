local Whitelists = {
	[1] = {
		title = 'Premium Deluxe Motorsports',
		owner = 0,
		access = {},
		bank = 0,
	},
	[2] = {
		title = 'Mechanics',
		owner = 0,
		access = {},
		bank = 0,
	},
}

RegisterServerEvent('fsn_jobs:whitelist:request')
AddEventHandler('fsn_jobs:whitelist:request', function()
	TriggerClientEvent('fsn_jobs:whitelist:update', source, Whitelists)
end)

RegisterServerEvent('fsn_jobs:whitelist:access:add')
AddEventHandler('fsn_jobs:whitelist:access:add', function(wlid, ply)
	local recv = exports['fsn_main']:fsn_CharID(ply)
	local wl = Whitelists[wlid]
	if not table.contains(wl.access, recv) then
		table.insert(wl.access, #wl.access+1, recv)
		TriggerClientEvent('fsn_notify:displayNotification', source, 'You granted '..ply..' (#'..recv..') access to: <b>'..wl.title, 'centerLeft', 5000, 'success')
		TriggerClientEvent('fsn_notify:displayNotification', ply, 'You were given access to: <b>'..wl.title, 'centerLeft', 5000, 'success')
	else
		TriggerClientEvent('fsn_notify:displayNotification', source, 'This player already has access to the business!', 'centerLeft', 5000, 'error')
	end
	TriggerClientEvent('fsn_jobs:whitelist:update', -1, Whitelists)
end)

function save()
	for k, wl in pairs(Whitelists) do
		MySQL.Async.execute('UPDATE `fsn_whitelists` SET `wl_owner` = @owner, `wl_access` = @access WHERE `wl_id` = @id;', {['@id'] = k, ['@owner'] = wl.owner, ['@access'] = json.encode(wl.access)}, function(rowsChanged) end)
	end
end

function init()
  MySQL.Async.fetchAll('SELECT * FROM `fsn_whitelists`', {}, function(res)
    for k, wl in pairs(res) do
	  local _wl = Whitelists[wl.wl_id]
	  _wl.owner = wl.wl_owner
	  _wl.access = json.decode(wl.wl_access)
	  _wl.bank = wl.wl_bank
	  print(':fsn_jobs: Updated WL '.._wl.title..' owner to '.._wl.owner)
    end
	TriggerClientEvent('fsn_jobs:whitelist:update', -1, Whitelists)
  end)
end

MySQL.ready(function()
    init()
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(900000)
		save()
	end
end)