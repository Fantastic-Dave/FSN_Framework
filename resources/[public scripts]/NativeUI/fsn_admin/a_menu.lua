function drawTxt(text,font,centre,x,y,scale,r,g,b,a)
  SetTextFont(font)
  SetTextProportional(0)
  SetTextScale(scale, scale)
  SetTextColour(r, g, b, a)
  SetTextDropShadow(0, 0, 0, 0,255)
  SetTextEdge(1, 0, 0, 0, 255)
  SetTextDropShadow()
  SetTextOutline()
  SetTextCentre(centre)
  SetTextEntry("STRING")
  AddTextComponentString(text)
  DrawText(x , y)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Data storage
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
characters = {}
RegisterNetEvent('fsn_main:updateCharacters')
AddEventHandler('fsn_main:updateCharacters', function(tbl)
 characters = tbl
end)
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Menu
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_menuPool = MenuPool.New()
AdminMenu = UIMenu.New("Admin", "~b~:FSN: Admin Module", 1425, 20)
_menuPool:Add(AdminMenu)

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Random
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local checkbox_god = UIMenuCheckboxItem.New("Godmode", AdminMenu, "Enables/disables godmode")
local checkbox_pblips = UIMenuCheckboxItem.New("Player Blips", AdminMenu, "Enables/disables player blips")
AdminMenu:AddItem(checkbox_god)
AdminMenu:AddItem(checkbox_pblips)

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Character
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local submenu_char = _menuPool:AddSubMenu(AdminMenu, "Character Management", 'Manage a character', true)
local char_button_refresh = UIMenuItem.New("", "")
char_button_refresh:RightLabel("~r~REFRESH")
submenu_char:AddItem(char_button_refresh)
submenu_char.OnItemSelect = function(sender, item, index)
  if item == char_button_refresh then
    for k, v in pairs(characters) do
      print("["..v.ply_id.."] "..v.char_fname..' '..v.char_fname)
      submenu_char:AddItem(UIMenuItem.New("["..v.ply_id.."] "..v.char_fname..' '..v.char_fname, ""))
    end
  end
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Player
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--print("[S: "..GetPlayerServerId(i).." C:"..idee.."] "..char.ply_name)
local submenu_ply = _menuPool:AddSubMenu(AdminMenu, "Connection Management", 'Manage a player', true)
local ply_button_refresh = UIMenuItem.New("", "")
ply_button_refresh:RightLabel("~r~REFRESH")
submenu_ply:AddItem(ply_button_refresh)

submenu_ply.OnItemSelect = function(sender, item, index)
  if item == ply_button_refresh then
    print('refreshing players')
    submenu_ply:Clear()
    ply_button_refresh:RightLabel("~r~REFRESH")
    submenu_ply:AddItem(ply_button_refresh)
    players = {}
  	local localplayers = {}
  	for i = 0, 31 do
  		if NetworkIsPlayerActive(i) then
  			table.insert(localplayers, GetPlayerServerId(i))
  		end
  	end
  	table.sort(localplayers)
  	for i,thePlayer in ipairs(localplayers) do
  		table.insert(players,GetPlayerFromServerId(thePlayer))
  	end
    for i,player in ipairs(players) do
      local charid = -1
      for k,v in pairs(characters) do
        if v.ply_id == GetPlayerServerId(player) then
          charid = k
        end
      end
      local player_char = characters[charid]
      local thisPlayerSubMenu = _menuPool:AddSubMenu(submenu_ply,"[S: "..GetPlayerServerId(player).." C:"..charid.."] "..GetPlayerName(player),"",true)

      local thisplayer_Freeze = UIMenuItem.New("Freeze "..GetPlayerName(player), "Freeze the player and disable their keyboard")
      thisPlayerSubMenu:AddItem(thisplayer_Freeze)

      local thisplayer_Kick = UIMenuItem.New("Kick "..GetPlayerName(player), "")
      thisPlayerSubMenu:AddItem(thisplayer_Kick)

      thisPlayerSubMenu.OnItemSelect = function(sender, item, index)
        if item == thisplayer_Freeze then
          ExecuteCommand('admin freeze '..GetPlayerServerId(player))
        elseif item == thisplayer_Kick then
          Citizen.CreateThread(function()
            _menuPool:CloseAllMenus()
            DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "Reason", "", "", "", "", 10)
            local editOpen = true
            while UpdateOnscreenKeyboard() == 0 or editOpen do
              Wait(0)
              drawTxt('Reason for kicking the individual',4,1,0.5,0.35,0.6,255,255,255,255)
              drawTxt('~r~Escaping this textarea will cancel the kicking of '..GetPlayerName(player)..'#'..GetPlayerServerId(player),4,1,0.5,0.49,0.4,255,255,255,255)
              if UpdateOnscreenKeyboard() ~= 0 then
                editOpen = false
                if UpdateOnscreenKeyboard() == 1 then
                  res = tostring(GetOnscreenKeyboardResult())
                  ExecuteCommand('admin kick '..GetPlayerServerId(player)..' '..res)
                end
                break
              end
            end
          end)
        end
      end

      local thisplayer_banmenu = _menuPool:AddSubMenu(thisPlayerSubMenu,"Ban "..GetPlayerName(player),"",true)
      local thisplayer_banmenu_1d = UIMenuItem.New("1 day", "")
      thisplayer_banmenu:AddItem(thisplayer_banmenu_1d)
      local thisplayer_banmenu_2d = UIMenuItem.New("2 days", "")
      thisplayer_banmenu:AddItem(thisplayer_banmenu_2d)
      local thisplayer_banmenu_3d = UIMenuItem.New("3 days", "")
      thisplayer_banmenu:AddItem(thisplayer_banmenu_3d)
      local thisplayer_banmenu_4d = UIMenuItem.New("4 days", "")
      thisplayer_banmenu:AddItem(thisplayer_banmenu_4d)
      local thisplayer_banmenu_5d = UIMenuItem.New("5 days", "")
      thisplayer_banmenu:AddItem(thisplayer_banmenu_5d)
      local thisplayer_banmenu_6d = UIMenuItem.New("6 days", "")
      thisplayer_banmenu:AddItem(thisplayer_banmenu_6d)
      local thisplayer_banmenu_1w = UIMenuItem.New("1 Week", "")
      thisplayer_banmenu:AddItem(thisplayer_banmenu_1w)
      local thisplayer_banmenu_2w = UIMenuItem.New("2 Weeks", "")
      thisplayer_banmenu:AddItem(thisplayer_banmenu_2w)
      local thisplayer_banmenu_3w = UIMenuItem.New("3 Weeks", "")
      thisplayer_banmenu:AddItem(thisplayer_banmenu_3w)
      local thisplayer_banmenu_1m = UIMenuItem.New("1 month", "")
      thisplayer_banmenu:AddItem(thisplayer_banmenu_1m)
      local thisplayer_banmenu_2m = UIMenuItem.New("2 months", "")
      thisplayer_banmenu:AddItem(thisplayer_banmenu_2m)
      local thisplayer_banmenu_perm = UIMenuItem.New("PERMANENT", "")
      thisplayer_banmenu:AddItem(thisplayer_banmenu_perm)

      thisplayer_banmenu.OnItemSelect = function(sender, item, index)
        if item == thisplayer_banmenu_1d then
          Citizen.CreateThread(function()
            _menuPool:CloseAllMenus()
            DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "Reason", "", "", "", "", 10)
            local editOpen = true
            while UpdateOnscreenKeyboard() == 0 or editOpen do
              Wait(0)
              drawTxt('Reason for banning the individual',4,1,0.5,0.35,0.6,255,255,255,255)
              drawTxt('~r~Escaping this textarea will cancel the banning of '..GetPlayerName(player)..'#'..GetPlayerServerId(player),4,1,0.5,0.49,0.4,255,255,255,255)
              if UpdateOnscreenKeyboard() ~= 0 then
                editOpen = false
                if UpdateOnscreenKeyboard() == 1 then
                  res = tostring(GetOnscreenKeyboardResult())
                  ExecuteCommand('admin ban '..GetPlayerServerId(player)..' 1d '..res)
                end
                break
              end
            end
          end)
        elseif item == thisplayer_banmenu_2d then
          Citizen.CreateThread(function()
            _menuPool:CloseAllMenus()
            DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "Reason", "", "", "", "", 10)
            local editOpen = true
            while UpdateOnscreenKeyboard() == 0 or editOpen do
              Wait(0)
              drawTxt('Reason for banning the individual',4,1,0.5,0.35,0.6,255,255,255,255)
              drawTxt('~r~Escaping this textarea will cancel the banning of '..GetPlayerName(player)..'#'..GetPlayerServerId(player),4,1,0.5,0.49,0.4,255,255,255,255)
              if UpdateOnscreenKeyboard() ~= 0 then
                editOpen = false
                if UpdateOnscreenKeyboard() == 1 then
                  res = tostring(GetOnscreenKeyboardResult())
                  ExecuteCommand('admin ban '..GetPlayerServerId(player)..' 2d '..res)
                end
                break
              end
            end
          end)
        elseif item == thisplayer_banmenu_3d then
          Citizen.CreateThread(function()
            _menuPool:CloseAllMenus()
            DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "Reason", "", "", "", "", 10)
            local editOpen = true
            while UpdateOnscreenKeyboard() == 0 or editOpen do
              Wait(0)
              drawTxt('Reason for banning the individual',4,1,0.5,0.35,0.6,255,255,255,255)
              drawTxt('~r~Escaping this textarea will cancel the banning of '..GetPlayerName(player)..'#'..GetPlayerServerId(player),4,1,0.5,0.49,0.4,255,255,255,255)
              if UpdateOnscreenKeyboard() ~= 0 then
                editOpen = false
                if UpdateOnscreenKeyboard() == 1 then
                  res = tostring(GetOnscreenKeyboardResult())
                  ExecuteCommand('admin ban '..GetPlayerServerId(player)..' 3d '..res)
                end
                break
              end
            end
          end)
        elseif item == thisplayer_banmenu_4d then
          Citizen.CreateThread(function()
            _menuPool:CloseAllMenus()
            DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "Reason", "", "", "", "", 10)
            local editOpen = true
            while UpdateOnscreenKeyboard() == 0 or editOpen do
              Wait(0)
              drawTxt('Reason for banning the individual',4,1,0.5,0.35,0.6,255,255,255,255)
              drawTxt('~r~Escaping this textarea will cancel the banning of '..GetPlayerName(player)..'#'..GetPlayerServerId(player),4,1,0.5,0.49,0.4,255,255,255,255)
              if UpdateOnscreenKeyboard() ~= 0 then
                editOpen = false
                if UpdateOnscreenKeyboard() == 1 then
                  res = tostring(GetOnscreenKeyboardResult())
                  ExecuteCommand('admin ban '..GetPlayerServerId(player)..' 4d '..res)
                end
                break
              end
            end
          end)
        elseif item == thisplayer_banmenu_5d then
          Citizen.CreateThread(function()
            _menuPool:CloseAllMenus()
            DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "Reason", "", "", "", "", 10)
            local editOpen = true
            while UpdateOnscreenKeyboard() == 0 or editOpen do
              Wait(0)
              drawTxt('Reason for banning the individual',4,1,0.5,0.35,0.6,255,255,255,255)
              drawTxt('~r~Escaping this textarea will cancel the banning of '..GetPlayerName(player)..'#'..GetPlayerServerId(player),4,1,0.5,0.49,0.4,255,255,255,255)
              if UpdateOnscreenKeyboard() ~= 0 then
                editOpen = false
                if UpdateOnscreenKeyboard() == 1 then
                  res = tostring(GetOnscreenKeyboardResult())
                  ExecuteCommand('admin ban '..GetPlayerServerId(player)..' 5d '..res)
                end
                break
              end
            end
          end)
        elseif item == thisplayer_banmenu_6d then
          Citizen.CreateThread(function()
            _menuPool:CloseAllMenus()
            DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "Reason", "", "", "", "", 10)
            local editOpen = true
            while UpdateOnscreenKeyboard() == 0 or editOpen do
              Wait(0)
              drawTxt('Reason for banning the individual',4,1,0.5,0.35,0.6,255,255,255,255)
              drawTxt('~r~Escaping this textarea will cancel the banning of '..GetPlayerName(player)..'#'..GetPlayerServerId(player),4,1,0.5,0.49,0.4,255,255,255,255)
              if UpdateOnscreenKeyboard() ~= 0 then
                editOpen = false
                if UpdateOnscreenKeyboard() == 1 then
                  res = tostring(GetOnscreenKeyboardResult())
                  ExecuteCommand('admin ban '..GetPlayerServerId(player)..' 6d '..res)
                end
                break
              end
            end
          end)
        elseif item == thisplayer_banmenu_1w then
          Citizen.CreateThread(function()
            _menuPool:CloseAllMenus()
            DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "Reason", "", "", "", "", 10)
            local editOpen = true
            while UpdateOnscreenKeyboard() == 0 or editOpen do
              Wait(0)
              drawTxt('Reason for banning the individual',4,1,0.5,0.35,0.6,255,255,255,255)
              drawTxt('~r~Escaping this textarea will cancel the banning of '..GetPlayerName(player)..'#'..GetPlayerServerId(player),4,1,0.5,0.49,0.4,255,255,255,255)
              if UpdateOnscreenKeyboard() ~= 0 then
                editOpen = false
                if UpdateOnscreenKeyboard() == 1 then
                  res = tostring(GetOnscreenKeyboardResult())
                  ExecuteCommand('admin ban '..GetPlayerServerId(player)..' 1w '..res)
                end
                break
              end
            end
          end)
        elseif item == thisplayer_banmenu_2w then
          Citizen.CreateThread(function()
            _menuPool:CloseAllMenus()
            DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "Reason", "", "", "", "", 10)
            local editOpen = true
            while UpdateOnscreenKeyboard() == 0 or editOpen do
              Wait(0)
              drawTxt('Reason for banning the individual',4,1,0.5,0.35,0.6,255,255,255,255)
              drawTxt('~r~Escaping this textarea will cancel the banning of '..GetPlayerName(player)..'#'..GetPlayerServerId(player),4,1,0.5,0.49,0.4,255,255,255,255)
              if UpdateOnscreenKeyboard() ~= 0 then
                editOpen = false
                if UpdateOnscreenKeyboard() == 1 then
                  res = tostring(GetOnscreenKeyboardResult())
                  ExecuteCommand('admin ban '..GetPlayerServerId(player)..' 2w '..res)
                end
                break
              end
            end
          end)
        elseif item == thisplayer_banmenu_3w then
          Citizen.CreateThread(function()
            _menuPool:CloseAllMenus()
            DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "Reason", "", "", "", "", 10)
            local editOpen = true
            while UpdateOnscreenKeyboard() == 0 or editOpen do
              Wait(0)
              drawTxt('Reason for banning the individual',4,1,0.5,0.35,0.6,255,255,255,255)
              drawTxt('~r~Escaping this textarea will cancel the banning of '..GetPlayerName(player)..'#'..GetPlayerServerId(player),4,1,0.5,0.49,0.4,255,255,255,255)
              if UpdateOnscreenKeyboard() ~= 0 then
                editOpen = false
                if UpdateOnscreenKeyboard() == 1 then
                  res = tostring(GetOnscreenKeyboardResult())
                  ExecuteCommand('admin ban '..GetPlayerServerId(player)..' 3w '..res)
                end
                break
              end
            end
          end)
        elseif item == thisplayer_banmenu_1m then
          Citizen.CreateThread(function()
            _menuPool:CloseAllMenus()
            DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "Reason", "", "", "", "", 10)
            local editOpen = true
            while UpdateOnscreenKeyboard() == 0 or editOpen do
              Wait(0)
              drawTxt('Reason for banning the individual',4,1,0.5,0.35,0.6,255,255,255,255)
              drawTxt('~r~Escaping this textarea will cancel the banning of '..GetPlayerName(player)..'#'..GetPlayerServerId(player),4,1,0.5,0.49,0.4,255,255,255,255)
              if UpdateOnscreenKeyboard() ~= 0 then
                editOpen = false
                if UpdateOnscreenKeyboard() == 1 then
                  res = tostring(GetOnscreenKeyboardResult())
                  ExecuteCommand('admin ban '..GetPlayerServerId(player)..' 1m '..res)
                end
                break
              end
            end
          end)
        elseif item == thisplayer_banmenu_2m then
          Citizen.CreateThread(function()
            _menuPool:CloseAllMenus()
            DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "Reason", "", "", "", "", 10)
            local editOpen = true
            while UpdateOnscreenKeyboard() == 0 or editOpen do
              Wait(0)
              drawTxt('Reason for banning the individual',4,1,0.5,0.35,0.6,255,255,255,255)
              drawTxt('~r~Escaping this textarea will cancel the banning of '..GetPlayerName(player)..'#'..GetPlayerServerId(player),4,1,0.5,0.49,0.4,255,255,255,255)
              if UpdateOnscreenKeyboard() ~= 0 then
                editOpen = false
                if UpdateOnscreenKeyboard() == 1 then
                  res = tostring(GetOnscreenKeyboardResult())
                  ExecuteCommand('admin ban '..GetPlayerServerId(player)..' 2m '..res)
                end
                break
              end
            end
          end)
        elseif item == thisplayer_banmenu_perm then
          Citizen.CreateThread(function()
            _menuPool:CloseAllMenus()
            DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "Reason", "", "", "", "", 10)
            local editOpen = true
            while UpdateOnscreenKeyboard() == 0 or editOpen do
              Wait(0)
              drawTxt('Reason for banning the individual',4,1,0.5,0.35,0.6,255,255,255,255)
              drawTxt('~r~Escaping this textarea will cancel the banning of '..GetPlayerName(player)..'#'..GetPlayerServerId(player),4,1,0.5,0.49,0.4,255,255,255,255)
              if UpdateOnscreenKeyboard() ~= 0 then
                editOpen = false
                if UpdateOnscreenKeyboard() == 1 then
                  res = tostring(GetOnscreenKeyboardResult())
                  ExecuteCommand('admin ban '..GetPlayerServerId(player)..' perm '..res)
                end
                break
              end
            end
          end)
        end
      end
    end
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- World
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local submenu_world = _menuPool:AddSubMenu(AdminMenu, "World Management", 'Manage the world', true)
local submenu_world_weather = _menuPool:AddSubMenu(submenu_world, "Weather", 'Change the current weather', true)
local world_button_freezeweather = UIMenuItem.New("FREEZE WEATHER", "")
submenu_world_weather:AddItem(world_button_freezeweather)
local world_button_extrasunny = UIMenuItem.New("EXTRASUNNY", "")
submenu_world_weather:AddItem(world_button_extrasunny)
local world_button_clear = UIMenuItem.New("CLEAR", "")
submenu_world_weather:AddItem(world_button_clear)
local world_button_neutral = UIMenuItem.New("NEUTRAL", "")
submenu_world_weather:AddItem(world_button_neutral)
local world_button_smog = UIMenuItem.New("SMOG", "")
submenu_world_weather:AddItem(world_button_smog)
local world_button_foggy = UIMenuItem.New("FOGGY", "")
submenu_world_weather:AddItem(world_button_foggy)
local world_button_overcast = UIMenuItem.New("OVERCAST", "")
submenu_world_weather:AddItem(world_button_overcast)
local world_button_clouds = UIMenuItem.New("CLOUDS", "")
submenu_world_weather:AddItem(world_button_clouds)
local world_button_clearing = UIMenuItem.New("CLEARING", "")
submenu_world_weather:AddItem(world_button_clearing)
local world_button_thunder = UIMenuItem.New("THUNDER", "")
submenu_world_weather:AddItem(world_button_thunder)
local world_button_snow = UIMenuItem.New("SNOW", "")
submenu_world_weather:AddItem(world_button_snow)
local world_button_blizzard = UIMenuItem.New("BLIZZARD", "")
submenu_world_weather:AddItem(world_button_blizzard)
local world_button_snowlight = UIMenuItem.New("SNOWLIGHT", "")
submenu_world_weather:AddItem(world_button_snowlight)
local world_button_xmas = UIMenuItem.New("XMAS", "")
submenu_world_weather:AddItem(world_button_xmas)
local world_button_halloween = UIMenuItem.New("HALLOWEEN", "")
submenu_world_weather:AddItem(world_button_halloween)

submenu_world_weather.OnItemSelect = function(sender, item, index)
  if item == world_button_extrasunny then
    ExecuteCommand('weather extrasunny')
  elseif item == world_button_clear then
    ExecuteCommand('weather clear')
  elseif item == world_button_neutral then
    ExecuteCommand('weather neutral')
  elseif item == world_button_smog then
    ExecuteCommand('weather smog')
  elseif item == world_button_foggy then
    ExecuteCommand('weather foggy')
  elseif item == world_button_overcast then
    ExecuteCommand('weather overcast')
  elseif item == world_button_clouds then
    ExecuteCommand('weather clouds')
  elseif item == world_button_clearing then
    ExecuteCommand('weather clearing')
  elseif item == world_button_thunder then
    ExecuteCommand('weather thunder')
  elseif item == world_button_snow then
    ExecuteCommand('weather snow')
  elseif item == world_button_blizzard then
    ExecuteCommand('weather blizzard')
  elseif item == world_button_snowlight then
    ExecuteCommand('weather snowlight')
  elseif item == world_button_xmas then
    ExecuteCommand('weather xmas')
  elseif item == world_button_halloween then
    ExecuteCommand('weather halloween')
  elseif item == world_button_freezeweather then
    ExecuteCommand('freezeweather')
  end
end

local submenu_world_time = _menuPool:AddSubMenu(submenu_world, "Time", 'Change the time of day', true)
local world_button_freezetime = UIMenuItem.New("FREEZE TIME", "")
submenu_world_time:AddItem(world_button_freezetime)
local world_button_morning = UIMenuItem.New("Morning", "")
submenu_world_time:AddItem(world_button_morning)
local world_button_evening = UIMenuItem.New("Evening", "")
submenu_world_time:AddItem(world_button_evening)

submenu_world_time.OnItemSelect = function(sender, item, index)
  if item == world_button_freezetime then
    ExecuteCommand('freezetime')
  elseif item == world_button_morning then
    ExecuteCommand('morning')
  elseif item == world_button_evening then
    ExecuteCommand('evening')
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Queue
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local submenu_queue = _menuPool:AddSubMenu(AdminMenu, "Queue Management", 'Manage/view the queue', true)
submenu_queue:AddItem(UIMenuItem.New("~r~This area is still in development!", ""))

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Dev
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local submenu_dev = _menuPool:AddSubMenu(AdminMenu, "Developer Tools", 'List of tools for developer usage. ~r~Not for use on the live server!', true)

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Command
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('fsn_admin:menu:toggle')
AddEventHandler('fsn_admin:menu:toggle', function()
  AdminMenu:Visible(not AdminMenu:Visible())
end)

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Process shit
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    _menuPool:ProcessMenus()
  end
end)
