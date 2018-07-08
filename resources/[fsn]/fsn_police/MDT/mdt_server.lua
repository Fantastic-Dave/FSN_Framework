RegisterServerEvent('fsn_police:database:CPIC')
AddEventHandler('fsn_police:database:CPIC', function(data)
  print(':fsn_police: CPIC is disabled serverside')
  return
  --[[
    "suspectID":$("#booking-player-id").val(),
		"suspectName":$("#booking-player-name").val(),
		"officerName":$("#booking-officer-name").val(),
		"charges":$("#booking-charges-textarea").val(),
	  "jailTime":$("#booking-jail").val(),
    "jailFine":$("#booking-fine").val(),
  ]]--
  local jailTime = data.jailTime
  local jailFine = data.jailTime
  MySQL.Async.execute('INSERT INTO `fsn_tickets` (`ticket_id`, `officer_id`, `officer_name`, `receiver_id`, `ticket_amount`, `ticket_jailtime`, `ticket_charges`, `ticket_date`) VALUES (NULL, '', '', '', '', '', '', CURRENT_TIMESTAMP)', {}, function(rowsChanged) end)
end)
