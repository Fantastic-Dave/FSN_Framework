local moneystore = {}

RegisterNetEvent('fsn_main:money:initChar')
AddEventHandler('fsn_main:money:initChar', function(src, cid, cash, balance)
	local exists = false
	for k, v in pairs(moneystore) do
		if v.char_id == cid then
			v.wallet = cash
			v.ply_id = src
			v.bank = balance
			exists = true
			return
		end
	end
	if not exists then
		table.insert(moneystore, #moneystore+1, {
			char_id = cid,
			ply_id = src,
			wallet = cash,
			bank = balance
		})
	end
	Citizen.Wait(500)
	TriggerClientEvent('fsn_main:money:update', src, cash, balance)
end)


RegisterServerEvent('fsn_main:money:wallet:Set')
AddEventHandler('fsn_main:money:wallet:Set', function(ply, amt)
	for k, v in pairs(moneystore) do
		if v.ply_id == ply then
			if tonumber(amt) then
				v.wallet = tonumber(amt)
				MySQL.Sync.execute("UPDATE `fsn_characters` SET `char_money` = @money WHERE `char_id` = @id", {['@id'] = v.char_id, ['@money'] = v.wallet})
				TriggerClientEvent('fsn_main:money:updateSilent', ply, v.wallet, v.bank)
				Citizen.Wait(500)
				TriggerClientEvent('fsn_main:gui:money:changeAmount', ply, amt)
			else 
				print('fsn_main:money:wallet:Set tried to set money to a non numeric value')
			end
		end
	end
end)

RegisterServerEvent('fsn_main:money:bank:Set')
AddEventHandler('fsn_main:money:bank:Set', function(ply, amt)
	for k, v in pairs(moneystore) do
		if v.ply_id == ply then
			if tonumber(amt) then
				v.bank = tonumber(amt)
				MySQL.Sync.execute("UPDATE `fsn_characters` SET `char_bank` = @money WHERE `char_id` = @id", {['@id'] = v.char_id, ['@money'] = v.bank})
				TriggerClientEvent('fsn_main:money:updateSilent', ply, v.wallet, v.bank)
				Citizen.Wait(500)
				TriggerClientEvent('fsn_main:gui:bank:changeAmount', ply, amt)
			else 
				print('fsn_main:money:bank:Set tried to set bank to a non numeric value')
			end
		end
	end
end)

RegisterServerEvent('fsn_main:money:wallet:Add')
AddEventHandler('fsn_main:money:wallet:Add', function(ply, amt)
	for k, v in pairs(moneystore) do
		if v.ply_id == ply then
			if tonumber(amt) then
				local newamt = v.wallet + tonumber(amt)
				v.wallet = newamt
				MySQL.Sync.execute("UPDATE `fsn_characters` SET `char_money` = @money WHERE `char_id` = @id", {['@id'] = v.char_id, ['@money'] = v.wallet})
				TriggerClientEvent('fsn_main:money:updateSilent', ply, v.wallet, v.bank)
				Citizen.Wait(500)
				TriggerClientEvent('fsn_main:gui:money:addMoney', ply, amt, newamt)
			else
				print('fsn_main:money:Add tried to add to wallet a non numerical value')
			end
		end
	end
end)

RegisterServerEvent('fsn_main:money:bank:Add')
AddEventHandler('fsn_main:money:bank:Add', function(ply, amt)
	for k, v in pairs(moneystore) do
		if v.ply_id == ply then
			if tonumber(amt) then
				local newamt = v.bank + tonumber(amt)
				v.bank = newamt
				MySQL.Sync.execute("UPDATE `fsn_characters` SET `char_bank` = @money WHERE `char_id` = @id", {['@id'] = v.char_id, ['@money'] = v.bank})
				TriggerClientEvent('fsn_main:money:updateSilent', ply, v.wallet, v.bank)
				Citizen.Wait(500)
				TriggerClientEvent('fsn_main:gui:bank:addMoney', ply, amt, newamt)
			else
				print('fsn_main:money:bank:Add tried to add to bank a non numerical value')
			end
		end
	end
end)

RegisterServerEvent('fsn_main:money:wallet:Minus')
AddEventHandler('fsn_main:money:wallet:Minus', function(ply, amt)
	print('starting ')
	for k, v in pairs(moneystore) do
		if v.ply_id == ply then
			if tonumber(amt) then
				local newamt = v.wallet - tonumber(amt)
				v.wallet = newamt
				MySQL.Sync.execute("UPDATE `fsn_characters` SET `char_money` = @money WHERE `char_id` = @id", {['@id'] = v.char_id, ['@money'] = v.wallet})
				TriggerClientEvent('fsn_main:money:updateSilent', ply, v.wallet, v.bank)
				Citizen.Wait(500)
				TriggerClientEvent('fsn_main:gui:minusMoney', ply, amt, newamt)
			else
				print('fsn_main:money:wallet:Minus tried to minus wallet a non numerical value')
			end
		end
	end
end)

RegisterServerEvent('fsn_main:money:bank:Minus')
AddEventHandler('fsn_main:money:bank:Minus', function(ply, amt)
	for k, v in pairs(moneystore) do
		if v.ply_id == ply then
			if tonumber(amt) then
				local newamt = v.bank - tonumber(amt)
				v.bank = newamt
				MySQL.Sync.execute("UPDATE `fsn_characters` SET `char_bank` = @money WHERE `char_id` = @id", {['@id'] = v.char_id, ['@money'] = v.bank})
				TriggerClientEvent('fsn_main:money:updateSilent', ply, v.wallet, v.bank)
				Citizen.Wait(500)
				TriggerClientEvent('fsn_main:gui:bank:minusMoney', ply, amt, newamt)
			else
				print('fsn_main:money:bank:Minus tried to minus wallet a non numerical value')
			end
		end
	end
end)