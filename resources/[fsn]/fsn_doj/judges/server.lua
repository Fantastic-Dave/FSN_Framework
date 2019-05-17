local judges = {'steam:11000010e0828a9'}

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

function fsn_isJudge(src)
  local sid = GetPlayerIdentifiers(src)
  sid = sid[1]
  for k, v in pairs(judges) do
    if v == sid then
      return true
    end
  end
  return false
end

AddEventHandler('chatMessage', function(source, auth, msg)
	local split = fsn_SplitString(msg, ' ')
	if split[1] == '/judge' then
		if fsn_isJudge(source) then
			if split[2] == 'msg' then
				local msg = table.concat(split, " ", 3, #split)
				TriggerClientEvent('chatMessage', -1, '', {255,255,255}, '^*^1JUDGE ANNOUNCEMENT |^0^r '..msg)
			end
			if split[2] == 'setlock' then
				if split[3] == 'true' then
					TriggerClientEvent('fsn_doj:judge:toggleLock', -1, true)
					TriggerClientEvent('chatMessage', -1, '', {255,255,255}, '^*^1JUDGE ANNOUNCEMENT |^0^r The courtroom has been locked')
				elseif split[3] == 'false' then
					TriggerClientEvent('fsn_doj:judge:toggleLock', -1, false)
					TriggerClientEvent('chatMessage', -1, '', {255,255,255}, '^*^1JUDGE ANNOUNCEMENT |^0^r The courtroom has been unlocked')
				else
					TriggerClientEvent('chatMessage', -1, '', {255,255,255}, '^*^1:fsn_doj:^0^r Provide true/false')
				end
			end
			if split[2] == 'remand' then
				TriggerClientEvent('fsn_doj:court:remandMe', tonumber(split[3]), source)
			end
			if split[2] == 'car' then
				local cars = {
					[1] = 'p90d',
					[2] = 'm5f90'
				}
				local car = tonumber(split[3])
				if cars[car] then
					TriggerClientEvent('fsn_doj:judge:spawnCar', source, cars[car])
				else
					TriggerClientEvent('chatMessage', -1, '', {255,255,255}, '^*^1:fsn_doj:^0^r Unrecognised car')
				end
			end
		else
			TriggerClientEvent('chatMessage', -1, '', {255,255,255}, '^*^1:fsn_doj:^0^r You are not a judge, you cannot use this function')
		end
	end
end)