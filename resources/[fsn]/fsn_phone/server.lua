RegisterServerEvent('fsn_phone:purchased')
AddEventHandler('fsn_phone:purchased', function(charid)
  local src = source
  local numbers = {0,1,2,3,4,5,6,7,8,9}
  local tbl = {}
  for id = 1, 6 do
    table.insert(tbl,#tbl+1,numbers[math.random(1, #numbers)])
  end
  local number = table.concat( tbl, '', 1, #tbl )
  MySQL.Async.execute('UPDATE `fsn_characters` SET `char_phone` = @number WHERE `fsn_characters`.`char_id` = @charid;', {['@charid'] = charid, ['@number'] = number}, function(rowsChanged)
    TriggerClientEvent('fsn_notify:displayNotification', src, 'Your new number is: <b>'..number, 'centerLeft', 10000, 'info')
    TriggerClientEvent('fsn_phone:updateNumber', src, number)
    TriggerClientEvent('fsn_phone:recieveMessage', src, {
      sender = 'Lifeinvader',
      from_number = 00000,
      to_number = number,
      message = 'Welcome to Lifeinvader! Your new mobile phone number is '..number..'. ~Lifeinvader Team'
    })
  end)
end)

RegisterServerEvent('fsn_phone:chat')
AddEventHandler('fsn_phone:chat', function(str, players)
  for k, v in pairs(players) do
    TriggerClientEvent('chatMessage', v, '', {255,255,255}, str)
  end
end)
