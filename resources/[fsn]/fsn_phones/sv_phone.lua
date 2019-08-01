local datastorePath = 'F:/FiveM/zfsn_fxs-server/resources/[fsn]/fsn_phones/datastore/'
local dbg = true -- misc notifications for the client

function createNumber()
	local created = false
	local num = 'not-defined-number'
	while not created do --Citizen.Wait(0)
		num = math.random(0,9)..math.random(0,9)..math.random(0,9)..'-'..math.random(0,9)..math.random(0,9)..math.random(0,9)..'-'..math.random(0,9)..math.random(0,9)..math.random(0,9)
		if not io.open(datastorePath..'contacts/'..num..'.txt', 'r') then
			
			local contactFile, err = io.open(datastorePath..'contacts/'..num..'.txt', 'a')
			if not contactFile then return print(err) end
			contactFile:write('[]')
			contactFile:close()
			
			local messagesFile = io.open(datastorePath..'messages/'..num..'.txt', 'a')
			messagesFile:write('[]')
			messagesFile:close()
			
			created = true
		end
	end
	if created then
		return num
	end
end

RegisterServerEvent('fsn_phones:SYS:request:details')
AddEventHandler('fsn_phones:SYS:request:details', function(num, details)
	local deets = {}
	
    local f = assert(io.open(datastorePath..details..'/'..num..'.txt', "rb"))
    local content = f:read("*all")
    f:close()

	deets = json.decode(deets)
	
	TriggerClientEvent('fsn_phones:SYS:recieve:details', source, details, deets)
end)

RegisterServerEvent('fsn_phones:SYS:set:details')
AddEventHandler('fsn_phones:SYS:set:details', function(num, details, tbl)
	local detailsFile = io.open(datastorePath..details..'/'..num..'.txt', 'w')
	detailsFile:write(json.encode(tbl))
	detailsFile:close()
	
	if dbg then
		TriggerClientEvent('fsn_phones:GUI:notification', source, 'img/Apple/Contact.png', 'DEBUG', 'Your '..details..' have been updated.', true)
	end
end)

--TriggerEvent('fsn_phones:SYS:set:details', '504-262-425', 'contacts', {{name='james',number='999-999-999'},{name='james',number='999-999-999'},{name='james',number='999-999-999'}})

RegisterServerEvent('fsn_phones:SYS:newNumber')
AddEventHandler('fsn_phones:SYS:newNumber', function(charid)
  local src = source
  local number = createNumber()
  MySQL.Async.execute('UPDATE `fsn_characters` SET `char_phone` = @number WHERE `fsn_characters`.`char_id` = @charid;', {['@charid'] = charid, ['@number'] = number}, function(rowsChanged)
    --TriggerClientEvent('fsn_notify:displayNotification', src, 'Your new number is: <b>'..number, 'centerLeft', 10000, 'info')
    TriggerClientEvent('fsn_phones:SYS:updateNumber', src, number)
	TriggerClientEvent('fsn_phones:GUI:notification', src, 'img/Apple/Contact.png', 'PHONE', 'Your phone number has been updated to:<br><b>'..number..'</b>', true)
    TriggerClientEvent('fsn_phones:USE:Email', src, {
		subject = 'Welcome to LifeInvader!',
		image = 'https://vignette.wikia.nocookie.net/gtawiki/images/b/b6/Lifeinvader-GTAV-Logo.png/revision/latest/scale-to-width-down/350?cb=20150929201009',
		body = 'Hi,<br><br>Welcome to LifeInvader, the home of all things technology. We\'ve just processed your request for a new mobile number and have charged your account $250.<br><br><b>New number: </b>'..number..'<br><br>Regards,<br>LifeInvader Team',
    })
	--[[
	TriggerClientEvent('fsn_phones:USE:Message', src, {
		to = number,
		from = '999-999-888',
		body = 'I am a sexy teapotI am a sexy teapotI am a sexy teapotI am a sexy teapotI am a sexy teapot',
		time = os.time()
	})
	TriggerClientEvent('fsn_phones:USE:Message', src, {
		to = number,
		from = '888-888-887',
		body = 'I am fucking terrible at replying...',
		time = os.time()
	})
	]]--
  end)
end)

RegisterServerEvent('fsn_phones:UTIL:chat')
AddEventHandler('fsn_phones:UTIL:chat', function(str, players)
  for k, v in pairs(players) do
    TriggerClientEvent('chatMessage', v, '', {255,255,255}, str)
  end
end)

RegisterServerEvent('fsn_phones:USE:sendMessage')
AddEventHandler('fsn_phones:USE:sendMessage', function(msg)
	TriggerClientEvent('fsn_phones:USE:Message', -1, msg)
end)

RegisterServerEvent('fsn_phones:SYS:sendTweet')
AddEventHandler('fsn_phones:SYS:sendTweet', function(twt)
	twt.datetime = os.time()
	TriggerClientEvent('fsn_phones:USE:Tweet', -1, twt)
end)
