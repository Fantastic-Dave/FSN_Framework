local current_characters = {}
AddEventHandler('fsn_main:updateCharacters', function(tbl)
  current_characters = tbl
end)

local function getCharacter(source)
  for k, v in pairs(current_characters) do
    if v.ply_id == source then
      return current_characters[k]
    end
  end
end
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

local pd_cars = {
  [1] = "police",
  [2] = "police2",
  [3] = "police3",
  [4] = "police4",
  [5] = "police5",
  [6] = "police6",
  [7] = "police7",
  [8] = "police8",
  [1001] = "fbi",
  [1002] = "fbi2"
}

local clipsets = {
  ["reset"] = 'reset',
  ["franklin"] = 'move_characters@michael@fire',
  ["flee"] = 'move_f@flee@a',
  ["scared"] = 'move_f@scared',
  ["sexy"] = 'move_f@sexy@a',
  ["sexy"] = 'move_f@sexy@a',
  ["tazered"] = 'MOVE_M@BAIL_BOND_TAZERED',
  ["drunk1"] = "MOVE_M@DRUNK@SLIGHTLYDRUNK",
  ["drunk2"] = "MOVE_M@DRUNK@MODERATEDRUNK",
  ["drunk3"] = "MOVE_M@DRUNK@MODERATEDRUNK_HEAD_UP",
  ["drunk4"] = "MOVE_M@DRUNK@VERYDRUNK",
  ["gangster1"] = 'move_m@gangster@var_i',
  ["gangster2"] = 'move_m@gangster@var_e',
  ["gangster3"] = 'move_m@gangster@var_f',
  ["jog"] = 'move_m@JOG@',
  ["femme"] = 'MOVE_M@FEMME@',
  ["posh"] = 'MOVE_M@POSH@',
  ["tough"] = 'MOVE_M@TOUGH_GUY@'
}

function tobool(val)
  if val == 'true' then
    return true
  else
    return false
  end
end

local onduty_police = {}
AddEventHandler('fsn_police:update', function(tbl)
  onduty_police = tbl
end)
function fsn_policeOnDuty(id)
  for k, v in pairs(onduty_police) do
    if v.ply_id == id then
      return true
    end
  end
  return false
end
function fsn_policeCommand(id)
  for k, v in pairs(onduty_police) do
    if v.ply_id == id then
      if v.ply_lvl > 6 then
        return true
      else
        return false
      end
    end
  end
  return false
end

local onduty_ems = {}
AddEventHandler('fsn_ems:update', function(tbl)
  onduty_ems = tbl
end)
function fsn_emsOnDuty(id)
  for k, v in pairs(onduty_ems) do
    if v.ply_id == id then
      return true
    end
  end
  return false
end

function fsn_isDeveloper(source)
  local devid = 'steam:11000010e0828a9'
  local steamid = GetPlayerIdentifiers(source)
  steamid = steamid[1]
  if steamid == devid then
    return true
  else
    return false
  end
end
RegisterServerEvent('fsn_commands:me')
AddEventHandler('fsn_commands:me', function(action, players)
  local source_char = getCharacter(source)
  local msg = source_char.char_fname..' '..source_char.char_lname..' '..action
  for _, ply in pairs(players) do
    TriggerClientEvent('chatMessage', ply, '', {255,255,255}, msg)
  end
end)

AddEventHandler('chatMessage', function(source, auth, msg)
  local split = fsn_SplitString(msg, ' ')
  -------------------------------------------------------------------------------------------------------------------------------------------------
  -- CHAT COMMANDS
  -------------------------------------------------------------------------------------------------------------------------------------------------
  if split[1] == '/walk' then
    if clipsets[split[2]] then
      TriggerClientEvent('fsn_commands:walk:set', -1, source, clipsets[split[2]])
    else
      TriggerClientEvent('fsn_notify:displayNotification', source, '/walktypes for a list of types.', 'centerRight', 4000, 'error')
    end
  end
  if split[1] == '/walktypes' then
    local str = ''
    for k, v in pairs(clipsets) do
      str = str..k..', '
    end
    TriggerClientEvent('chatMessage', source, '', {255,255,255}, '^1^*:FSN:^0^r Walk types: '..str)
  end
  if split[1] == '/dropweapon' then
    TriggerClientEvent('fsn_commands:dropweapon', source)
  end
  if split[1] == '/phone' or split[1] == '/p' then
    TriggerClientEvent('fsn_phone:togglePhone', source)
  end
  if split[1] == '/phonenumber' or split[1] == '/pn' then
    TriggerClientEvent('fsn_phone:displayNumber', source)
  end
  if split[1] == '/sit' or split[1] == '/s' then
    TriggerClientEvent('fsn_emotecontrol:sit', source)
  end
  if split[1] == '/me' or split[1] == '/m' then
    local action = table.concat( split, ' ', 2, #split )
    TriggerClientEvent('fsn_commands:me', source, action)
  end
  if split[1] == '/ooc' or split[1] == '/looc' then
    local action = table.concat( split, ' ', 2, #split )
    TriggerClientEvent('chatMessage', -1, '', {255,255,255}, '^*ooc '..GetPlayerName(source)..'#'..source..' | ^r'.. action)
  end
  if split[1] == '/tweet' or split[1] == '/twt' then
    local char = getCharacter(source)
    local at = string.sub(char.char_fname, 1, 1)..char.char_lname
    if char.char_twituname ~= 'notset' then
      at = char.char_twituname
    end
    local tweet = table.concat( split, ' ', 2, #split )
    TriggerClientEvent('chatMessage', -1, ':tweet: @'..at, {6, 213, 224}, tweet)
  end
  -------------------------------------------------------------------------------------------------------------------------------------------------
  -- MISC COMMANDS
  -------------------------------------------------------------------------------------------------------------------------------------------------
  if msg == '/money' then
    TriggerClientEvent('fsn_main:displayBankandMoney', source)
  end
  if msg == '/save' then
    TriggerClientEvent('fsn_main:characterSaving', source)
  end
  -------------------------------------------------------------------------------------------------------------------------------------------------
  -- INVENTORY COMMANDS
  -------------------------------------------------------------------------------------------------------------------------------------------------
  if split[1] == '/use' then
    if split[2] then
      if split[2] == 'repair_kit' then
        TriggerClientEvent('fsn_vehiclecontrol:damage:repair', source)
      end
    end
  end
  -------------------------------------------------------------------------------------------------------------------------------------------------
  -- DEVELOPER COMMANDS
  -------------------------------------------------------------------------------------------------------------------------------------------------
  if split[1] == '/dev' and fsn_isDeveloper(source) then
    if split[2] then
      if split[2] == 'pdduty' then
        if split[3] then
          TriggerClientEvent('fsn_police:command:duty', tonumber(split[3]))
        else
          TriggerClientEvent('fsn_police:command:duty', source)
        end
      end
      if split[2] == 'setinfractions' then
        TriggerClientEvent('fsn_licenses:setinfractions', split[3], split[4], tonumber(split[5]))
        TriggerClientEvent('fsn_notify:displayNotification', split[3], ':FSN: A developer ('..source..') set your '..split[4]..' license infractions to '..split[5], 'centerLeft', 8000, 'info')
        TriggerClientEvent('fsn_notify:displayNotification', source, ':FSN: You set '..split[3]..'\'s '..split[4]..' infractions to '..split[5], 'centerRight', 8000, 'success')
      end
      if split[2] == 'debug' then
        TriggerClientEvent('fsn_dev:debug', source)
      end
      if split[2] == 'mdt' then
        TriggerClientEvent('fsn_police:MDT:toggle', source)
      end
      if split[2] == 'revive' then
        TriggerClientEvent('fsn_ems:reviveMe', source)
      end
      if split[2] == 'xyz' then
        TriggerClientEvent('fsn_commands:sendxyz', source)
      end
      if split[2] == 'car' then
        if split[3] then
          TriggerClientEvent('fsn_commands:dev:spawnCar', source, split[3])
        end
      end
      if split[2] == 'weapon' then
        if split[3] then
          TriggerClientEvent('fsn_commands:dev:weapon', source, split[3])
        end
      end
      if split[2] == 'fix' then
        TriggerClientEvent('fsn_commands:dev:fix', source)
      end
      if split[2] == 'giveitem' then
        if split[3] then
          if split[4] then
            TriggerClientEvent('fsn_inventory:item:add', source, split[3], tonumber(split[4]))
          end
        end
      end
      if split[2] == 'kill' then
        if split[3] then
            TriggerClientEvent('fsn_ems:killMe', tonumber(split[3]))
        else
          TriggerClientEvent('fsn_ems:killMe', source)
        end
      end
    end
  end
  -------------------------------------------------------------------------------------------------------------------------------------------------
  -- EMS COMMANDS
  -------------------------------------------------------------------------------------------------------------------------------------------------
  if split[1] == '/ems' then
    if fsn_emsOnDuty(source) then

    end
  end
  -------------------------------------------------------------------------------------------------------------------------------------------------
  -- POLICE COMMANDS
  -------------------------------------------------------------------------------------------------------------------------------------------------
  if split[1] == '/police' or split[1] == '/pd' then
    if fsn_policeOnDuty(source) then
      if split[2] then
        if split[2] == 'search' then
          if split[3] == 'inventory' then
            if split[4] then
              local char = getCharacter(source)
              local officername = char.char_fname..' '..char.char_lname
              TriggerClientEvent('fsn_police:search:start:inventory', tonumber(split[4]), source)
              TriggerClientEvent('fsn_notify:displayNotification', source, 'Searching <b>'..tonumber(split[4]), 'centerRight', 7000, 'info')
              TriggerClientEvent('fsn_notify:displayNotification', tonumber(split[4]), 'You are being searched by officer <b>'..officername..'</b><br><i>This search is for inventory items', 'centerRight', 7000, 'info')
            else
              TriggerClientEvent('chatMessage', source, ':FSN:', {255,0,0}, 'You need to provide a target.')
            end
          end
          if split[3] == 'weapons' then
            if split[4] then
              local char = getCharacter(source)
              local officername = char.char_fname..' '..char.char_lname
              TriggerClientEvent('fsn_police:search:start:weapons', tonumber(split[4]), source)
              TriggerClientEvent('fsn_notify:displayNotification', source, 'Patting down <b>'..tonumber(split[4]), 'centerRight', 7000, 'info')
              TriggerClientEvent('fsn_notify:displayNotification', tonumber(split[4]), 'You are being patted down by officer <b>'..officername..'</b><br><i>This search is for weapons', 'centerRight', 7000, 'info')
            else
              TriggerClientEvent('chatMessage', source, ':FSN:', {255,0,0}, 'You need to provide a target.')
            end
          end
          if split[3] == 'strip' then
            if split[4] then
              local char = getCharacter(source)
              local officername = char.char_fname..' '..char.char_lname
              TriggerClientEvent('fsn_police:search:strip', tonumber(split[4]))
              TriggerClientEvent('fsn_notify:displayNotification', source, 'Strip searching <b>'..tonumber(split[4]), 'centerRight', 7000, 'info')
              TriggerClientEvent('fsn_notify:displayNotification', tonumber(split[4]), 'You have been strip searched by <b>'..officername..'</b><br><i>Weapons, Inventory & cash', 'centerRight', 7000, 'info')
            else
              TriggerClientEvent('chatMessage', source, ':FSN:', {255,0,0}, 'You need to provide a target.')
            end
          end
        end
        if split[2] == 'command' then
          if fsn_policeCommand(source) then
            if split[3] == 'duty' then
              if tonumber(split[4]) then
                TriggerClientEvent('fsn_police:command:duty', tonumber(split[4]))
              else
                TriggerClientEvent('chatMessage', source, ':FSN:', {255,0,0}, 'You need to provide a target.')
              end
            end
            if split[3] == 'level' then
              if tonumber(split[4]) then
                if tonumber(split[5]) then

                else
                  TriggerClientEvent('chatMessage', source, ':FSN:', {255,0,0}, 'You need to provide a level.')
                end
              else
                TriggerClientEvent('chatMessage', source, ':FSN:', {255,0,0}, 'You need to provide a target.')
              end
            end
          else
            TriggerClientEvent('chatMessage', source, ':FSN:', {255,0,0}, 'You are not a command member.')
          end
        end
        if split[2] == 'license' then
          if split[3] == 'infraction' then
            if split[4] then
              if split[5] then
                TriggerClientEvent('fsn_licenses:infraction', split[4], split[5], split[6])
                TriggerClientEvent('fsn_notify:displayNotification', split[4], split[6]..' points have been added to your '..split[5]..' license', 'centerLeft', 6000, 'info')
                TriggerClientEvent('fsn_notify:displayNotification', source, split[6]..' points have been added to '..split[4]..'\'s '..split[5]..' license', 'centerLeft', 6000, 'info')
              else
                TriggerClientEvent('chatMessage', source, ':FSN:', {255,0,0}, 'You need to provide an amount.')
              end
            else
              TriggerClientEvent('chatMessage', source, ':FSN:', {255,0,0}, 'You need to provide a target.')
            end
          end
          if split[3] == 'take' then
            if split[4] then
              if split[4] == 'id' then
                if split[5] then
                  TriggerClientEvent('fsn_licenses:showid', tonumber(split[5]))
                else
                  TriggerClientEvent('chatMessage', source, ':FSN:', {255,0,0}, 'You need to provide a target.')
                end
              end
              if split[4] == 'driver' then
                if split[5] then
                  TriggerClientEvent('fsn_licenses:display', tonumber(split[5]), 'driver')
                else
                  TriggerClientEvent('chatMessage', source, ':FSN:', {255,0,0}, 'You need to provide a target.')
                end
              end
              if split[4] == 'pilot' then
                if split[5] then
                  TriggerClientEvent('fsn_licenses:display', tonumber(split[5]), 'pilot')
                else
                  TriggerClientEvent('chatMessage', source, ':FSN:', {255,0,0}, 'You need to provide a target.')
                end
              end
              if split[4] == 'all' then
                if split[5] then
                  TriggerClientEvent('fsn_licenses:display', tonumber(split[5]), 'all')
                else
                  TriggerClientEvent('chatMessage', source, ':FSN:', {255,0,0}, 'You need to provide a target.')
                end
              end
            else
              TriggerClientEvent('chatMessage', source, ':FSN:', {255,0,0}, 'You need to provide a license.')
            end
          end
        end
        if split[2] == 'dispatch' then
          TriggerClientEvent('fsn_police:dispatch:toggle', source)
        end
        if split[2] == 'runplate' then
          if split[3] then
            TriggerEvent('fsn_police:runplate', source, split[3])
          else
            TriggerClientEvent('fsn_police:runplate:target', source)
          end
        end
        if split[2] == 'revive' then
          if #onduty_ems > 0 then
            TriggerClientEvent('chatMessage', source, ':FSN:', {255,0,0}, 'EMS are online, reach them on the radio.')
          else
            if split[3] then
              if split[3] ~= source then
                TriggerClientEvent('fsn_ems:reviveMe', tonumber(split[3]))
              else
                TriggerClientEvent('chatMessage', source, ':FSN:', {255,0,0}, 'You are not a god. You cannot revive yourself.')
              end
            else
              TriggerClientEvent('chatMessage', source, ':FSN:', {255,0,0}, 'You need to provide a target.')
            end
          end
        end
        if split[2] == 'softcuff' or split[2] == 'sc' then
          if split[3] then
            local target = tonumber(split[3])
            if target then
              TriggerClientEvent('fsn_police:handcuffs:soft', target, target) --
            else
              TriggerClientEvent('chatMessage', source, ':FSN:', {255,0,0}, 'There was an issue with the arguments you provided.')
            end
          else
            TriggerClientEvent('chatMessage', source, ':FSN:', {255,0,0}, 'You need to provide a target.')
          end
        end
        if split[2] == 'cuff' or split[2] == 'c' then
          if split[3] then
            local target = tonumber(split[3])
            if target then
              TriggerClientEvent('fsn_police:handcuffs:hard', target, target) --
            else
              TriggerClientEvent('chatMessage', source, ':FSN:', {255,0,0}, 'There was an issue with the arguments you provided.')
            end
          else
            TriggerClientEvent('chatMessage', source, ':FSN:', {255,0,0}, 'You need to provide a target.')
          end
        end
        if split[2] == 'livery' then
          if split[3] then
            if tonumber(split[3]) then
              TriggerClientEvent('fsn_commands:police:livery', source, tonumber(split[3]))
            else
              TriggerClientEvent('chatMessage', source, ':FSN:', {255,0,0}, 'There was an issue with the arguments you provided.')``
            end
          else
            TriggerClientEvent('chatMessage', source, ':FSN:', {255,0,0}, 'There was an issue with the arguments you provided.')
          end
        end
        if split[2] == 'extras' then
          TriggerClientEvent('fsn_commands:police:extras', source)
        end
        if split[2] == 'extra' then
          if split[3] then
            if split[3] == 'all' then
              TriggerClientEvent('fsn_commands:police:extra', source, 'all', split[4])
              return
            end
            if tonumber(split[3]) then
              TriggerClientEvent('fsn_commands:police:extra', source, tonumber(split[3]))
            else
              TriggerClientEvent('chatMessage', source, ':FSN:', {255,0,0}, 'There was an issue with the arguments you provided.')
            end
          else
            TriggerClientEvent('chatMessage', source, ':FSN:', {255,0,0}, 'There was an issue with the arguments you provided.')
          end
        end
        if split[2] == 'escort' then
          if split[3] and tonumber(split[3]) then
            TriggerClientEvent('fsn_police:toggleDrag', split[3], source)
          end
        end
        if split[2] == 'boot' then
          TriggerClientEvent('fsn_commands:police:boot', source)
        end
        if split[2] == 'unboot' then
          TriggerClientEvent('fsn_commands:police:unboot', source)
        end
        if split[2] == 'putinveh' then
          if split[3] and tonumber(split[3]) then
            TriggerClientEvent('fsn_police:putMeInVeh', split[3])
          end
        end
        if split[2] == 'car' then
          if tonumber(split[3]) then
            TriggerClientEvent('fsn_commands:police:car', source, pd_cars[tonumber(split[3])])
          else
            TriggerClientEvent('chatMessage', source, ':FSN:', {255,0,0}, 'There was an issue with the arguments you provided.')
          end
        end
        if split[2] == 'fix' then
          TriggerClientEvent('fsn_commands:police:fix', source)
        end
        if split[2] == 'impound' then
          TriggerClientEvent('fsn_commands:police:impound', source)
        end
        if split[2] == 'impound2' then
          TriggerClientEvent('fsn_commands:police:impound2', source)
        end
        if split[2] == 'jail' then
          if split[3] then
            if split[4] then
              if tonumber(split[3]) and tonumber(split[4]) then
                local jailtime = tonumber(split[4])*60
                TriggerEvent('fsn_jail:sendsuspect', source, split[3], jailtime)
              else
                TriggerClientEvent('chatMessage', source, ':FSN:', {255,0,0}, 'There was an issue with the arguments you provided.')
              end
            else
              TriggerClientEvent('chatMessage', source, ':FSN:', {255,0,0}, 'You need to provide a time.')
            end
          else
            TriggerClientEvent('chatMessage', source, ':FSN:', {255,0,0}, 'You need to provide a target.')
          end
        end
      else
        TriggerClientEvent('chatMessage', source, ':FSN:', {255,0,0}, 'There was an issue with the arguments you provided.')
      end
    else
      TriggerClientEvent('chatMessage', source, ':FSN:', {255,0,0}, 'You are not signed in on duty as a police officer.')
    end
  end
end)

RegisterServerEvent('fsn_commands:printxyz')
AddEventHandler('fsn_commands:printxyz', function(x,y,z,h)
  print("{x = "..x..", y = "..y..", z = "..z.."}")
  print("{x = "..x..", y = "..y..", z = "..z..", h = "..h.."}")
end)

RegisterServerEvent('fsn_commands:police:booted')
AddEventHandler('fsn_commands:police:booted', function(plate, model)
  TriggerClientEvent('fsn_commands:police:updateBoot', -1, plate, model, true)
end)

RegisterServerEvent('fsn_commands:police:unbooted')
AddEventHandler('fsn_commands:police:unbooted', function(plate, model)
  TriggerClientEvent('fsn_commands:police:updateBoot', -1, plate, model, false)
end)
