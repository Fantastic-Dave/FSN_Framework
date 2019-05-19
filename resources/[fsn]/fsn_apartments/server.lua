local apartments = {
	[1] = {occupied=false},
	[2] = {occupied=false},
	[3] = {occupied=false},
	[4] = {occupied=false},
	[5] = {occupied=false},
	[7] = {occupied=false},
	[8] = {occupied=false},
	[9] = {occupied=false},
	[10] = {occupied=false},
	[11] = {occupied=false},
	[12] = {occupied=false},
	[13] = {occupied=false},
	[14] = {occupied=false},
	[15] = {occupied=false},
	[16] = {occupied=false},
	[17] = {occupied=false},
	[18] = {occupied=false},
	[19] = {occupied=false},
	[20] = {occupied=false},
	[21] = {occupied=false},
	[22] = {occupied=false},
	[23] = {occupied=false},
	[24] = {occupied=false},
	[25] = {occupied=false},
	[26] = {occupied=false},
	[27] = {occupied=false},
	[28] = {occupied=false},
	[29] = {occupied=false},
	[30] = {occupied=false},
	[31] = {occupied=false},
	[32] = {occupied=false},
}

function getAvailableAppt(source)
	for k, v in pairs(apartments) do
		if v.occupied == false then
			print(k..' is not owned, giving to '..source)
			v.occupied = true
			v.owner = source
			return k
		else
			if v.owner == source then
				print(source..' already owns '..k)
				return k
			end
		end
	end
end

RegisterServerEvent('fsn_apartments:getApartment')
AddEventHandler('fsn_apartments:getApartment', function(char_id)
	local appt = MySQL.Sync.fetchAll("SELECT * FROM `fsn_apartments` WHERE `apt_owner` = '"..char_id.."'")
	if #appt > 0 then
		local myappt = appt[1]
		local mynum = getAvailableAppt(source)
		local sendappt = {
			number = mynum,
			apptinfo = myappt
		}
		TriggerClientEvent('fsn_apartments:sendApartment', source, sendappt)
	else
		TriggerClientEvent('fsn_apartments:characterCreation', source)
	end
end)

AddEventHandler('playerDropped', function(reason)
    for k, v in pairs(apartments) do
		if v.owner == source then
			print(source..' disconnected('..reason..') setting appt '..k..' to unoccupied')
			v.occupied = false
		end
	end
end)

RegisterServerEvent('fsn_apartments:createApartment')
AddEventHandler('fsn_apartments:createApartment', function(char_id)
	print('creating new appt for '..char_id)
	local SQL = "INSERT INTO `fsn_datastore`.`fsn_apartments` (`apt_id`, `apt_owner`, `apt_inventory`, `apt_cash`, `apt_outfits`, `apt_utils`) VALUES (NULL, '"..char_id.."', '{}', '0', '{}', '{}');"
	MySQL.Sync.execute(SQL)
	
	local appt = MySQL.Sync.fetchAll("SELECT * FROM `fsn_apartments` WHERE `apt_owner` = '"..char_id.."'")
	if #appt > 0 then
		local myappt = appt[1]
		local mynum = getAvailableAppt(source)
		local sendappt = {
			number = mynum,
			apptinfo = {
				apt_id = myappt.apt_id,
				apt_inventory = json.decode(myappt.apt_inventory),
				apt_cash = myappt.apt_cash,
				apt_outfits = json.decode(myappt.apt_outfits),
				apt_utils = json.decode(myappt.apt_utils)
			}
		}
		TriggerClientEvent('fsn_apartments:sendApartment', source, sendappt)
	end
end)

RegisterServerEvent('fsn_apartments:saveApartment')
AddEventHandler('fsn_apartments:saveApartment', function(appt)
--UPDATE `fsn_datastore`.`fsn_apartments` SET `apt_inventory` = '[]', `apt_cash` = '100', `apt_outfits` = '[]', `apt_utils` = '[]' WHERE `fsn_apartments`.`apt_id` = 4;
	--local SQL = "UPDATE fsn_apartments SET `apt_inventory` = '"..json.encode(appt.apt_inventory).."', `apt_cash` = '"..appt.apt_cash.."', `apt_outfits` = '"..json.encode(appt.apt_outfits).."', apt_utils` = '"..json.encode(appt.apt_utils).."' WHERE `apt_id` = '"..appt.apt_id.."'"
	MySQL.Sync.execute("UPDATE `fsn_apartments` SET `apt_inventory` = @inv, `apt_cash` = @cash, `apt_outfits` = @outfits, `apt_utils` = @utils WHERE `fsn_apartments`.`apt_id` = @id;", {
		['@id'] = appt.apt_id,
		['@inv'] = json.encode(appt.apt_inventory),
		['@cash'] = tonumber(appt.apt_cash),
		['@outfits'] = json.encode(appt.apt_outfits),
		['@utils'] = json.encode(appt.apt_utils)
	})
end)

--------------------------------------------------------- commands
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
	local split = fsn_SplitString(msg, ' ')
	if split[1] == '/stash' then
		if split[2] == 'add' then
			if tonumber(split[3]) then
				TriggerClientEvent('fsn_apartments:stash:add', source, tonumber(split[3]))
			else
				TriggerClientEvent('chatMessage', source, '', {255,255,255}, '^1^*:FSN:^0^r That is not a number.')
			end
		end
		if split[2] == 'take' then
			if tonumber(split[3]) then
				TriggerClientEvent('fsn_apartments:stash:take', source, tonumber(split[3]))
			else
				TriggerClientEvent('chatMessage', source, '', {255,255,255}, '^1^*:FSN:^0^r That is not a number.')
			end
		end
	end
	if split[1] == '/outfit' then
		if split[2] == 'add' then
			
		end
		if split[2] == 'use' then
		
		end 
		if split[2] == 'remove' then 
		
		end
	end
end)