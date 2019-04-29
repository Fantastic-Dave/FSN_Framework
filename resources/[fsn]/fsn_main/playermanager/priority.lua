local mysql = false
MySQL.ready(function()
	mysql = true
end)

Queue.OnReady(function() 
	while mysql == false do
		print(':fsn_main: mysql is not ready for prio')
		Citizen.Wait(1)
	end
	MySQL.Async.fetchAll('SELECT * FROM `fsn_users` WHERE `priority` != 0', {}, function(res)
		for k, usr in pairs(res) do
			--Config.Priority[usr.steamid] = usr.priority
			--Queue.AddPriority(usr.steamid, usr.priority)
			print(':connectqueue: Adding priority('..usr.priority..') for user '..usr.name..'('..usr.steamid..')')
		end
	end)
end)