local cur_channel = 0
RegisterServerEvent('fsn_voicecontrol:call:ring')
AddEventHandler('fsn_voicecontrol:call:ring', function(ringnum, ringingnum)
  local ring = exports.fsn_main:fsn_GetPlayerFromPhoneNumber(ringnum)
  local ringing = exports.fsn_main:fsn_GetPlayerFromPhoneNumber(ringnum)
  if ring ~= 0 then
    TriggerClientEvent('fsn_voicecontrol:call:ring', ring)
    TriggerClientEvent('fsn_notify:displayNotification', source, 'Ringing...', 'centerRight', 8000, 'info' )
  else
    TriggerClientEvent('fsn_voicecontrol:call:end', source)
    TriggerClientEvent('fsn_notify:displayNotification', source, 'No player found with this phone number!', 'centerRight', 5000, 'error' )
  end
end)

RegisterServerEvent('fsn_voicecontrol:call:answer')
AddEventHandler('fsn_voicecontrol:call:answer', function(ringnum)
  local ringing = exports.fsn_main:fsn_GetPlayerFromPhoneNumber(ringnum)
  cur_channel = cur_channel+1
  TriggerClientEvent('fsn_voicecontrol:call:start', source, cur_channel)
  TriggerClientEvent('fsn_voicecontrol:call:start', ringing, cur_channel)
  TriggerClientEvent('fsn_notify:displayNotification', source, 'Call connected (C:'..cur_channel..')', 'centerRight', 5000, 'success' )
  TriggerClientEvent('fsn_notify:displayNotification', ringing, 'Call connected (C:'..cur_channel..')', 'centerRight', 5000, 'success' )
end)

RegisterServerEvent('fsn_voicecontrol:call:hold')
AddEventHandler('fsn_voicecontrol:call:hold', function(ringnum)
  local ringing = exports.fsn_main:fsn_GetPlayerFromPhoneNumber(ringnum)
  TriggerClientEvent('fsn_voicecontrol:call:hold', source, true)
  TriggerClientEvent('fsn_voicecontrol:call:hold', ringing, false)
  TriggerClientEvent('fsn_notify:displayNotification', source, 'Call placed on hold', 'centerRight', 5000, 'info' )
  TriggerClientEvent('fsn_notify:displayNotification', ringing, 'Call is now on hold', 'centerRight', 5000, 'info' )
end)

RegisterServerEvent('fsn_voicecontrol:call:decline')
AddEventHandler('fsn_voicecontrol:call:decline', function(ringnum)
  local ringing = exports.fsn_main:fsn_GetPlayerFromPhoneNumber(ringnum)
  TriggerClientEvent('fsn_voicecontrol:call:end', source)
  TriggerClientEvent('fsn_voicecontrol:call:end', ringing)
  TriggerClientEvent('fsn_notify:displayNotification', ringing, 'Call was declined', 'centerRight', 5000, 'error' )
  TriggerClientEvent('fsn_notify:displayNotification', source, 'Call declined', 'centerRight', 5000, 'info' )
end)
