function fsn_SplitString(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end
AddEventHandler('chatMessage', function(source, auth, msg)
	local split = fsn_SplitString(string.lower(msg), ' ')
	local origSplit = fsn_SplitString(msg, ' ')
	--if split[1] == '/getinv' then
	--	TriggerClientEvent('fsn_inventory:ply:request', tonumber(split[2]), source)
	--end
	if split[1] == '/inv' then
		TriggerClientEvent('fsn_inventory:gui:display', source)
	end
end)

RegisterServerEvent('fsn_inventory:sys:send')
AddEventHandler('fsn_inventory:sys:send', function(to, tbl)
	print('got inventory from '..source..' for '..to)
	TriggerClientEvent('fsn_inventory:ply:recieve', to, source, tbl)
end)

RegisterServerEvent('fsn_inventory:ply:update')
AddEventHandler('fsn_inventory:ply:update', function(to, tbl)
	TriggerClientEvent('fsn_inventory:me:update', to, tbl)
end)

RegisterServerEvent('fsn_inventory:ply:finished')
AddEventHandler('fsn_inventory:ply:finished', function(ply)
	TriggerClientEvent('fsn_inventory:ply:done', ply)
end)

RegisterServerEvent('fsn_licenses:id:display')
AddEventHandler('fsn_licenses:id:display', function(plytbl, name, job, dob, issue, id)
	for _, ply in pairs(plytbl) do
		TriggerClientEvent('chatMessage', ply, '', {0,0,0}, '^6*-----------------------------------------------------------')
		TriggerClientEvent('chatMessage', ply, '', {0,0,0}, '^6| ID |^0 '..name..' | '..job..' | '..dob..'/dob | '..issue..'/issue')
		--TriggerClientEvent('chatMessage', ply, '', {0,0,0}, '^6| ID |^0 CharID: '..id..' | ServerID: '..source)
		TriggerClientEvent('chatMessage', ply, '', {0,0,0}, '^6*-----------------------------------------------------------')
	end
end)