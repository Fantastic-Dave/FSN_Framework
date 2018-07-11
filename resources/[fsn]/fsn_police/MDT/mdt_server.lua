RegisterServerEvent('fsn_police:database:CPIC')
AddEventHandler('fsn_police:database:CPIC', function(data)
  --[[
    "suspectID":$("#booking-player-id").val(),
		"suspectName":$("#booking-player-name").val(),
		"officerName":$("#booking-officer-name").val(),
		"charges":$("#booking-charges-textarea").val(),
	  "jailTime":$("#booking-jail").val(),
    "jailFine":$("#booking-fine").val(),
  ]]--
  local officerID = exports.fsn_main:fsn_CharID(source)
  local suspectID = exports.fsn_main:fsn_CharID(tonumber(data.suspectID))
  MySQL.Async.execute('INSERT INTO `fsn_tickets` (`ticket_id`, `officer_id`, `officer_name`, `receiver_id`, `ticket_amount`, `ticket_jailtime`, `ticket_charges`, `ticket_date`) VALUES (NULL, @officer_id, @officer_name, @receiver_id, @ticket_amount, @ticket_jailtime, @ticket_charges, @ticket_time)', {
    ["@officer_id"] = officerID,
    ["@officer_name"] = data.officerName,
    ["@receiver_id"] = suspectID,
    ["@ticket_amount"] = data.jailFine,
    ["@ticket_jailtime"] = data.jailTime,
    ["@ticket_charges"] = data.charges,
    ["@ticket_time"] = os.time()
  }, function(rowsChanged) end)
end)

RegisterServerEvent('fsn_police:database:CPIC:search')
AddEventHandler('fsn_police:database:CPIC:search', function(id)
  local res = {}
  local src = source
  local idee = exports.fsn_main:fsn_CharID(id)
  print(':fsn_police: Running CPIC for : (C: '..idee..' / S: '..id)
  MySQL.Async.fetchAll('SELECT * FROM `fsn_tickets` WHERE `receiver_id` = @id', {['@id'] = idee}, function(results)
    for k, v in pairs(results) do
      local ass = os.date("*t", v.ticket_date)
      v.ticket_date = ass.hour..':'..ass.min..' '..ass.month..'/'..ass.day..'/'..ass.year
    end
    TriggerClientEvent('fsn_police:database:CPIC:search:result', src, results)
  end)
end)
