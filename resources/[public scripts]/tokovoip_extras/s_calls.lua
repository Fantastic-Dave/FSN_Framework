local channelid = 1000
local calls = {}
--[[
	{
		caller = 999,
		calling = 999,
		time = os.time(),
		members = {},
		status = 'calling'
	}
	
]]

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

function isBusy(player)
	local number = exports.fsn_main:fsn_GetPlayerPhoneNumber(tonumber(player))
	for k,call in pairs(calls) do
		if call.status ~= 'finished' then
			if call.caller == number or call.calling == number then
				return true
			end
		end
	end
	return false
end

RegisterServerEvent('fsn_phone:call:startCalling')
AddEventHandler('fsn_phone:call:startCalling', function(src, toNumber)
	if isBusy(src) then
		TriggerClientEvent('fsn_notify:displayNotification', src, 'You are currently on a phonecall', 'centerRight', 3000, 'error')
	end
	local ply = exports.fsn_main:fsn_GetPlayerFromPhoneNumber(toNumber)
	if ply ~= 0 then
		if ply == src then
			TriggerClientEvent('fsn_notify:displayNotification', src, 'You cannot call yourself..', 'centerRight', 3000, 'error')
			return
		end
		if not isBusy(ply) then
			TriggerClientEvent('fsn_notify:displayNotification', src, 'Calling <b>'..toNumber..'</b>...', 'centerRight', 3000, 'info')
			TriggerClientEvent('fsn_phone:call:effects:calling', src)
			TriggerClientEvent('fsn_phone:call:effects:called', ply)
			
			TriggerClientEvent('chatMessage', ply, '', {255,255,255}, '^1^*:fsn_phone:^0^r You are being called by '..exports.fsn_main:fsn_GetPlayerPhoneNumber(tonumber(src))..'. Use /answer or /decline')
			TriggerClientEvent('fsn_notify:displayNotification', ply, 'You are being called by '..exports.fsn_main:fsn_GetPlayerPhoneNumber(tonumber(src))..'. Use /answer or /decline', 'centerRight', 3000, 'info')
			
			--TriggerClientEvent('fsn_phone:sound', ply, 'ringtone')
			--TriggerClientEvent('fsn_phone:sound', src, 'calling')
			channelid = channelid +1
			local tbl = {
				channel = channelid,
				caller = exports.fsn_main:fsn_GetPlayerPhoneNumber(src),
				calling = toNumber,
				time = os.time(),
				members = {src, ply},
				status = 'calling'
			}
			table.insert(calls, #calls+1, tbl)
		else
			TriggerClientEvent('fsn_notify:displayNotification', src, '<b>'..toNumber..'</b> is busy, try again later!', 'centerRight', 3000, 'error')
		end
	else
		TriggerClientEvent('fsn_notify:displayNotification', src, 'No player found with number <b>'..toNumber, 'centerRight', 3000, 'error')		
	end
end)

RegisterServerEvent('fsn_phone:call:startCall')
AddEventHandler('fsn_phone:call:startCall', function(callid)
	local v = calls[callid]
	--for k, v in pairs(calls) do
		v.status = 'incall'
		local called = exports.fsn_main:fsn_GetPlayerFromPhoneNumber(v.calling)
		local caller = exports.fsn_main:fsn_GetPlayerFromPhoneNumber(v.caller)
		
		TriggerClientEvent('fsn_phone:call:effects:isInCall', called, true)
		TriggerClientEvent('fsn_phone:call:effects:isInCall', caller, true)
		
		TriggerClientEvent('chatMessage', called, '', {255,255,255}, '^1^*:fsn_phone:^0^r Call started. Use CAPSLOCK to talk on the phone or use /hangup to end the call')
		TriggerClientEvent('chatMessage', caller, '', {255,255,255}, '^1^*:fsn_phone:^0^r Call started. Use CAPSLOCK to talk on the phone or use /hangup to end the call')
		
		TriggerClientEvent('TokoVoip:addPlayerToRadio', called, v.channel, GetPlayerName(called))
		TriggerClientEvent('TokoVoip:addPlayerToRadio', caller, v.channel, GetPlayerName(caller))
	--end
end)

RegisterServerEvent('fsn_phone:call:endCall')
AddEventHandler('fsn_phone:call:endCall', function(callid)
	local v = calls[callid]
	v.status = 'finished'
	local called = exports.fsn_main:fsn_GetPlayerFromPhoneNumber(v.calling)
	local caller = exports.fsn_main:fsn_GetPlayerFromPhoneNumber(v.caller)
		
	TriggerClientEvent('fsn_phone:call:effects:isInCall', called, false)
	TriggerClientEvent('fsn_phone:call:effects:isInCall', caller, false)
	
	TriggerClientEvent('fsn_notify:displayNotification', called, 'Call ended', 'centerRight', 5000, 'info')
	TriggerClientEvent('fsn_notify:displayNotification', caller, 'Call ended', 'centerRight', 5000, 'info')
	
	TriggerClientEvent('TokoVoip:removePlayerFromRadio', called, v.channel)
	TriggerClientEvent('TokoVoip:removePlayerFromRadio', caller, v.channel)
	
	TriggerClientEvent('fsn_phones:SYS:addCall', called, v.caller, true, false)
	TriggerClientEvent('fsn_phones:SYS:addCall', caller, v.calling, false, false)
end)

RegisterServerEvent('fsn_phone:call:answerCall')
AddEventHandler('fsn_phone:call:answerCall', function(src)
	for k,v in pairs(calls) do
		if v.status == 'calling' then
			if v.calling == exports.fsn_main:fsn_GetPlayerPhoneNumber(src) then
				TriggerEvent('fsn_phone:call:startCall', k)
				TriggerClientEvent('fsn_phone:call:effects:stop', src)
				TriggerClientEvent('fsn_phone:call:effects:stop', exports.fsn_main:fsn_GetPlayerFromPhoneNumber(v.caller))
			end
		end
	end
end)

RegisterServerEvent('fsn_phone:call:declineCall')
AddEventHandler('fsn_phone:call:declineCall', function(src)
	for k,v in pairs(calls) do
		if v.status == 'calling' then
			if v.calling == exports.fsn_main:fsn_GetPlayerPhoneNumber(tonumber(src)) then
				v.status = 'finished'
				
				TriggerClientEvent('fsn_phone:call:effects:stop', src)
				TriggerClientEvent('fsn_phone:call:effects:stop', exports.fsn_main:fsn_GetPlayerFromPhoneNumber(v.caller))
				TriggerClientEvent('fsn_phone:call:effects:isInCall', exports.fsn_main:fsn_GetPlayerFromPhoneNumber(v.caller), false)
				
				TriggerClientEvent('fsn_notify:displayNotification', exports.fsn_main:fsn_GetPlayerFromPhoneNumber(v.caller), '<b>'..v.calling..'</b> is busy, try again later!', 'centerRight', 3000, 'error')
				TriggerClientEvent('fsn_notify:displayNotification', exports.fsn_main:fsn_GetPlayerFromPhoneNumber(v.calling), 'Call declined', 'centerRight', 3000, 'error')
				
				TriggerClientEvent('fsn_phones:SYS:addCall', exports.fsn_main:fsn_GetPlayerFromPhoneNumber(v.calling), v.caller, true, true)
				TriggerClientEvent('fsn_phones:SYS:addCall', exports.fsn_main:fsn_GetPlayerFromPhoneNumber(v.caller), v.calling, false, true)
			end
		end
	end
end)


AddEventHandler('chatMessage', function(source, auth, msg)
	local split = fsn_SplitString(msg, ' ')
	if split[1] == '/stereo' then
		TriggerClientEvent('tokovoip:toggleStereo', source)
	end 
	if split[1] == '/call' then
		if split[2] and string.find(split[2], '-') then
			TriggerEvent('fsn_phone:call:startCalling', source, split[2])
		else
			TriggerClientEvent('chatMessage', source, '', {255,255,255}, '^1^*:fsn_phone:^0^r There was an issue with the number you provided. (Usage: /call 123-123-123)')
		end 
	end
	if split[1] == '/answer' then
		TriggerEvent('fsn_phone:call:answerCall', source)
	end
	if split[1] == '/decline' then
		TriggerEvent('fsn_phone:call:declineCall', source)
	end
	if split[1] == '/hangup' then
		for k, v in pairs(calls) do
			if v.status == 'incall' then
				if v.calling == exports.fsn_main:fsn_GetPlayerPhoneNumber(tonumber(source)) or v.caller == exports.fsn_main:fsn_GetPlayerPhoneNumber(tonumber(source)) then
					TriggerEvent('fsn_phone:call:endCall', k)
					return
				end
			end
		end
		TriggerClientEvent('fsn_notify:displayNotification', source, 'Either you are not in a call, or the system forgot about your call and you need to relog.', 'centerRight', 3000, 'error')
	end
end)

function table.contains(table, element)
  for _, value in pairs(table) do
    if value[1] == element then
      return true
    end
  end
  return false
end