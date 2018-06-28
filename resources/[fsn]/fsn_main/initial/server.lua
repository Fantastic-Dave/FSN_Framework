AddEventHandler('fsn_main:validatePlayer', function()

end)
---------------------------- Character Shit
current_characters = {}
RegisterServerEvent('fsn_main:updateCharacters')
RegisterServerEvent('fsn_main:createCharacter')
AddEventHandler('fsn_main:createCharacter', function(data)
  print(':fsn_main: got character information')
  for k, v in pairs(data) do
    print('> '..k..' = '..v)
  end
  local steamid = GetPlayerIdentifiers(source)
  steamid = steamid[1]
  MySQL.Sync.execute("INSERT INTO `fsn_characters` (`char_id`, `steamid`, `char_fname`, `char_lname`, `char_dob`, `char_desc`, `char_money`, `char_bank`, `char_model`, `mdl_extras`, `char_inventory`, `char_weapons`, `char_police`, `char_ems`) VALUES (NULL, @steamid, @char_fname, @char_lname, @char_dob, @char_desc, '500', '5000', '1885233650', '[]', '[]', '[]', '0', '0')", {['@steamid'] = steamid, ['@char_fname'] = data.char_fname, ['@char_lname'] = data.char_lname, ['@char_dob'] = data.char_dob, ['@char_desc'] = data.char_desc })
  local characters = MySQL.Sync.fetchAll("SELECT * FROM `fsn_characters` WHERE `steamid` = '"..steamid.."'")
  TriggerClientEvent('fsn_main:sendCharacters', source, characters)
end)

RegisterServerEvent('fsn_main:requestCharacters')
AddEventHandler('fsn_main:requestCharacters', function()
  local steamid = GetPlayerIdentifiers(source)
  steamid = steamid[1]
  local characters = MySQL.Sync.fetchAll("SELECT * FROM `fsn_characters` WHERE `steamid` = '"..steamid.."'")
  TriggerClientEvent('fsn_main:sendCharacters', source, characters)
end)

RegisterServerEvent('fsn_main:update:myCharacter')
AddEventHandler('fsn_main:update:myCharacter', function(index, char)
  current_characters[index] = char
end)

RegisterServerEvent('fsn_main:getCharacter')
AddEventHandler('fsn_main:getCharacter', function(char_id)
  local steamid = GetPlayerIdentifiers(source)
  steamid = steamid[1]
  local char = MySQL.Sync.fetchAll("SELECT * FROM `fsn_characters` WHERE `char_id` = '"..char_id.."'")
  if char[1].steamid == steamid then
    TriggerClientEvent('fsn_main:initiateCharacter', source, char)
    for k, v in pairs(current_characters) do
      if v.ply_id == source then
        table.remove(current_characters, k)
      end
    end
    table.insert(current_characters, #current_characters+1, {
      char_id = char[1].char_id,
      ply_id = source,
      ply_name = GetPlayerName(source),
      char_fname = char[1].char_fname,
      char_lname = char[1].char_lname,
      char_dob = char[1].char_dob,
      char_money = char[1].char_money,
      char_bank = char[1].char_bank,
      char_police = char[1].char_police,
      char_ems = char[1].char_ems,
      char_twituname = char[1].char_twituname
    })
    TriggerClientEvent('fsn_main:updateCharacters', -1, current_characters)
    TriggerEvent('fsn_main:updateCharacters', current_characters)
  else
    DropPlayer(source, ':FSN: You tried to load a character you do not own.')
  end
end)

function fsn_GetPlayerFromCharacterId(id)
  local idee = 0
  for k, v in pairs(current_characters) do
    if v.char_id == id then
      idee = v.ply_id
    end
  end
  return idee
end

RegisterServerEvent('fsn_main:money:Set')
AddEventHandler('fsn_main:money:Set', function(ply, amt)
  local indexid = 0
  for k, v in pairs(current_characters) do
    if v.ply_id == ply then
      indexid = k
    end
  end
  if indexid ~= 0 then
    local character = current_characters[indexid]
    if tonumber(amt) then
      local newamt = tonumber(amt)
      character.char_money = newamt
      MySQL.Sync.execute("UPDATE `fsn_characters` SET `char_money` = @money WHERE `char_id` = @id", {['@id'] = character.char_id, ['@money'] = newamt})
      TriggerClientEvent('fsn_main:updateCharacters', -1, current_characters)
      TriggerClientEvent('fsn_main:gui:money:changeAmount', ply, amt)
    else
      print(':fsn_main: Tried to set '..ply..'s money but the amount was incorrect. ('..amt..')')
    end
  else
    print(':fsn_main: Tried to set '..ply..'s money but they did not exist?')
  end
end)

RegisterServerEvent('fsn_main:bank:Set')
AddEventHandler('fsn_main:bank:Set', function(ply, amt)
  local indexid = 0
  for k, v in pairs() do
    if v.ply_id == ply then
      indexid = k
    end
  end
  if indexid ~= 0 then
    local character = current_characters[indexid]
    if tonumber(amt) then
      local newamt = tonumber(amt)
      character.char_bank = newamt
      MySQL.Sync.execute("UPDATE `fsn_characters` SET `char_bank` = @money WHERE `char_id` = @id", {['@id'] = character.char_id, ['@money'] = newamt})
      TriggerClientEvent('fsn_main:updateCharacters', -1, current_characters)
      TriggerEvent('fsn_main:updateCharacters', current_characters)
      TriggerClientEvent('fsn_main:gui:bank:changeAmount', ply, amt)
    else
      print(':fsn_main: Tried to set '..ply..'s bank but the amount was incorrect. ('..amt..')')
    end
  else
    print(':fsn_main: Tried to set '..ply..'s bank but they did not exist?')
  end
end)

RegisterServerEvent('fsn_main:money:Add')
AddEventHandler('fsn_main:money:Add', function(ply, amt)
  local indexid = 0
  for k, v in pairs() do
    if v.ply_id == ply then
      indexid = k
    end
  end
  if indexid ~= 0 then
    local character = current_characters[indexid]
    if tonumber(amt) then
      local newamt = character.char_money + tonumber(amt)
      character.char_money = newamt
      MySQL.Sync.execute("UPDATE `fsn_characters` SET `char_money` = @money WHERE `char_id` = @id", {['@id'] = character.char_id, ['@money'] = newamt})
      TriggerClientEvent('fsn_main:updateCharacters', -1, current_characters)
      TriggerEvent('fsn_main:updateCharacters', current_characters)
      TriggerClientEvent('fsn_main:gui:money:addMoney', ply, amt, newamt)
    else
      print(':fsn_main: Tried to add money to '..ply..' but the amount was incorrect. ('..amt..')')
    end
  else
    print(':fsn_main: Tried to add money to '..ply..' but they did not exist?')
  end
end)

RegisterServerEvent('fsn_main:bank:Add')
AddEventHandler('fsn_main:bank:Add', function(ply, amt)
  local indexid = 0
  for k, v in pairs() do
    if v.ply_id == ply then
      indexid = k
    end
  end
  if indexid ~= 0 then
    local character = current_characters[indexid]
    if tonumber(amt) then
      local newamt = character.char_bank + tonumber(amt)
      character.char_bank = newamt
      MySQL.Sync.execute("UPDATE `fsn_characters` SET `char_bank` = @money WHERE `char_id` = @id", {['@id'] = character.char_id, ['@money'] = newamt})
      TriggerClientEvent('fsn_main:updateCharacters', -1, current_characters)
      TriggerEvent('fsn_main:updateCharacters', current_characters)
      TriggerClientEvent('fsn_main:gui:bank:addMoney', ply, amt, newamt)
    else
      print(':fsn_main: Tried to add money to '..ply..' but the amount was incorrect. ('..amt..')')
    end
  else
    print(':fsn_main: Tried to add money to '..ply..' but they did not exist?')
  end
end)

RegisterServerEvent('fsn_main:money:Minus')
AddEventHandler('fsn_main:money:Minus', function(ply, amt)
  local indexid = 0
  for k, v in pairs() do
    if v.ply_id == ply then
      indexid = k
    end
  end
  if indexid ~= 0 then
    local character = current_characters[indexid]
    if tonumber(amt) then
      local newamt = character.char_money - tonumber(amt)
      character.char_money = newamt
      MySQL.Sync.execute("UPDATE `fsn_characters` SET `char_money` = @money WHERE `char_id` = @id", {['@id'] = character.char_id, ['@money'] = newamt})
      TriggerClientEvent('fsn_main:updateCharacters', -1, current_characters)
      TriggerEvent('fsn_main:updateCharacters', current_characters)
      TriggerClientEvent('fsn_main:gui:minusMoney', ply, amt, newamt)
    else
      print(':fsn_main: Tried to minus money from '..ply..' but the amount was incorrect. ('..amt..')')
    end
  else
    print(':fsn_main: Tried to minus money from '..ply..' but they did not exist?')
  end
end)

RegisterServerEvent('fsn_main:bank:Minus')
AddEventHandler('fsn_main:bank:Minus', function(ply, amt)
  local indexid = 0
  for k, v in pairs() do
    if v.ply_id == ply then
      indexid = k
    end
  end
  if indexid ~= 0 then
    local character = current_characters[indexid]
    if tonumber(amt) then
      local newamt = character.char_bank - tonumber(amt)
      character.char_bank = newamt
      MySQL.Sync.execute("UPDATE `fsn_characters` SET `char_bank` = @money WHERE `char_id` = @id", {['@id'] = character.char_id, ['@money'] = newamt})
      TriggerClientEvent('fsn_main:updateCharacters', -1, current_characters)
      TriggerEvent('fsn_main:updateCharacters', current_characters)
      TriggerClientEvent('fsn_main:gui:bank:minusMoney', ply, amt, newamt)
    else
      print(':fsn_main: Tried to add money to '..ply..' but the amount was incorrect. ('..amt..')')
    end
  else
    print(':fsn_main: Tried to add money to '..ply..' but they did not exist?')
  end
end)
-------------------------------------------- inventory saving
RegisterServerEvent('fsn_inventory:database:update')
AddEventHandler('fsn_inventory:database:update', function(inv)
  local charid = 0
  for k, v in pairs(current_characters) do
    if v.ply_id == source then
      charid = v.char_id
    end
  end
  inv = json.encode(inv)
  MySQL.Sync.execute("UPDATE `fsn_characters` SET `char_inventory` = @inventory WHERE `fsn_characters`.`char_id` = @id", {['@id'] = charid, ['@inventory'] = inv})
end)
-------------------------------------------- vehicle shit
RegisterServerEvent('fsn_cargarage:buyVehicle')
AddEventHandler('fsn_cargarage:buyVehicle', function(hash, classname, plate, vehicle_price)
  print(source..' is attempting to buy '..classname)
  local char_id = 0
  for k, v in pairs(current_characters) do
    if v.ply_id == source then
      char_id = v.char_id
    end
  end
  MySQL.Async.execute("INSERT INTO `fsn_vehicles` (`veh_id`, `char_id`, `veh_name`, `veh_hash`, `veh_plate`, `veh_plate_style`, `veh_windows`, `veh_colours`, `veh_mods`, `veh_extras`, `veh_fuel`, `veh_health`, `veh_type`) VALUES (NULL, @char_id, @classname, @hash, @plate, '0', '0', '[]', '[]', '[]', '100', '1000', 'c')", {['@char_id'] = char_id, ['@hash'] = hash, ['@classname'] = classname, ['@plate'] = plate}, function(rowsChanged) end)
end)
-------------------------------------------- Character Saving
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(300000)
    local plys = GetPlayers()
    print(':fsn_main: Saving '..#plys..' player(s) data')
    for k, player in pairs(plys) do
      TriggerClientEvent('fsn_main:characterSaving', player)
    end
  end
end)
RegisterServerEvent('fsn_main:saveCharacter')
AddEventHandler('fsn_main:saveCharacter', function(charid, model, vars, weapons)
  MySQL.Sync.execute("UPDATE `fsn_characters` SET `char_model` = @model, `mdl_extras` = '"..vars.."', `char_weapons` = @weapons WHERE `fsn_characters`.`char_id` = @id", {['@id'] = charid, ['@model'] = model, ['@weapons'] = weapons})
  print(':FSN: Character information for '..GetPlayerName(source)..' updated!')
end)
------------------------------------------------------ POLICE
RegisterServerEvent('fsn_police:chat:ticket')
AddEventHandler('fsn_police:chat:ticket', function(suspectID, jailFine, jailTime, charges)
  for k, v in pairs(current_characters) do
    print(v.ply_id..' != '..suspectID)
    if v.ply_id == tonumber(suspectID) then
      if tonumber(jailTime) > 0 then
        TriggerClientEvent('chatMessage', -1, '', {255,255,255}, v.char_fname..' '..v.char_lname.. ' has been JAILED for ^3'..jailTime..'^0 months for ^1'..charges)
      end
      if tonumber(jailFine) > 0 then
        TriggerClientEvent('chatMessage', -1, '', {255,255,255}, v.char_fname..' '..v.char_lname.. ' has been FINED ^3$'..jailFine..'^0 for ^1'..charges)
      end
    end
  end
end)
-------------------------------------------------------------
print(" ")
print("::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::")
print(":::::::::::::::::: FSN :: fsn_main loaded ::::::::::::::::::")
print("::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::")
print("::::::::: FSN framework by JamesSc0tt licensed to ::::::::::")
print("::::::::::: Devyn Westfield (fusionroleplay.com) :::::::::::")
print("::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::")
print(" ")
