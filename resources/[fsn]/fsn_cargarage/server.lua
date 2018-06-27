--TriggerServerEvent("fsn_cargarage:updateVehicle", plate, table.tostring(vehiclecol), table.tostring(extracol), table.tostring(neoncolor), plateindex, table.tostring(mods), GetVehicleNumberPlateTextIndex(veh), wheeltype);
RegisterServerEvent('fsn_cargarage:updateVehicle')
AddEventHandler('fsn_cargarage:updateVehicle', function(savetable)
  local colours = json.encode(savetable.colours)
  local mods = json.encode(savetable.mods)
  MySQL.Sync.execute("UPDATE `fsn_vehicles` SET `veh_plate_style` = @veh_plate_style, `veh_windows` = @veh_windows, `veh_wheeltype` = @veh_wheeltype, `veh_mods` = @veh_mods, `veh_colours` = @veh_colours WHERE `veh_plate` = @plate", {
    ['@plate'] = savetable.plate,
    ['@veh_plate_style'] = savetable.plateindex,
    ['@veh_windows'] = savetable.windows,
    ['@veh_wheeltype'] = savetable.wheeltype,
    ['@veh_mods'] = mods,
    ['@veh_colours'] = colours
  })
end)
--------------------------------------------------------------------------------
RegisterServerEvent('fsn_cargarage:requestVehicles')
AddEventHandler('fsn_cargarage:requestVehicles', function(type, charid)
  local player = source
  if type == 'cars' then
    MySQL.Async.fetchAll('SELECT * FROM `fsn_vehicles` WHERE `char_id` = @char_id AND `veh_type` = "c"', {['@char_id'] = charid}, function(vehicles)
      local vehtbl = {}
        for k, v in pairs(vehicles) do
          table.insert(vehtbl,#vehtbl+1,v)
        end

        TriggerClientEvent('fsn_cargarage:receiveVehicles', player, 'cars', vehtbl)
    end)
  elseif type == 'aircrafts' then
    MySQL.Async.fetchAll('SELECT * FROM `fsn_vehicles` WHERE `char_id` = @char_id AND `veh_type` = "a"', {['@char_id'] = charid}, function(vehicles)
      vehtbl = vehicles
    end)
  elseif type == 'boats' then
    MySQL.Async.fetchAll('SELECT * FROM `fsn_vehicles` WHERE `char_id` = @char_id AND `veh_type` = "b"', {['@char_id'] = charid}, function(vehicles)
      vehtbl = vehicles
    end)
  else
    TriggerClientEvent('fsn_notify:displayNotification', source, 'Something is wrong with this garage!', 'centerLeft', 3000, 'error')
  end
end)

--TriggerServerEvent('fsn_cargarage:impound', GetVehicleNumberPlateText(car))
RegisterServerEvent('fsn_cargarage:impound')
AddEventHandler('fsn_cargarage:impound', function(plate)
  local status = 2
  MySQL.Async.execute('UPDATE `fsn_vehicles` SET `veh_status` = @status WHERE `veh_plate` = @plate', {['@plate'] = plate, ['@status'] = status}, function() end)
end)

RegisterServerEvent('fsn_cargarage:vehicle:toggleStatus')
AddEventHandler('fsn_cargarage:vehicle:toggleStatus', function(plate, status)
  TriggerClientEvent('fsn_cargarage:vehicleStatus', source, plate, status)
  MySQL.Async.execute('UPDATE `fsn_vehicles` SET `veh_status` = @status WHERE `veh_plate` = @plate', {['@plate'] = plate, ['@status'] = status}, function() end)
end)
