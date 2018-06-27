local jailtime = 0
local beginSentence = 0
local isinjail = false
local characterid = 0

function drawTxt(x,y ,width,height,scale, text, r,g,b,a, outline)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    if(outline)then
	    SetTextOutline()
	end
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

RegisterNetEvent('fsn_jail:spawn:recieve')
AddEventHandler('fsn_jail:spawn:recieve', function(result)
	jailtime = result
  if jailtime >= 1 then
    TriggerEvent('fsn_jail:sendme', jailtime)
    TriggerServerEvent('fsn_jail:update:database', jailtime)
  else
    jailtime = 0
    beginSentence = 0
    isinjail = false
  end
end)

RegisterNetEvent('fsn_jail:sendme')
AddEventHandler('fsn_jail:sendme', function(time)
	jailtime = time
  isinjail = true
  RemoveAllPedWeapons(GetPlayerPed(-1))
  local jail = {x = 1653.5433349609, y = 2603.8093261719, z = 45.564876556396}
  SetEntityCoords(GetPlayerPed(-1), jail.x, jail.y,jail.z+1)
  TriggerEvent('pNotify:SendNotification', {text = "You've been sent to jail for: ".. math.floor(tonumber(jailtime) / 60) .." minutes",
    layout = "centerRight",
    timeout = 600,
    progressBar = true,
    type = "info"
  })
end)

RegisterNetEvent('fsn_jail:releaseme')
AddEventHandler('fsn_jail:releaseme', function()
	jailtime = 0
  isinjail = false
  SetEntityCoords(GetPlayerPed(-1), 1852.42, 2603.44,45.672)
  TriggerServerEvent('fsn_jail:update:database', jailtime)
  TriggerEvent('pNotify:SendNotification', {text = "You've been released from jail",
    layout = "centerRight",
    timeout = 600,
    progressBar = true,
    type = "info"
  })
end)

RegisterNetEvent('fsn_jail:init')
AddEventHandler('fsn_jail:init', function(char_id)
  characterid = char_id
  TriggerServerEvent("fsn_jail:spawn", characterid)
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if isinjail then
      local inmins = tonumber(jailtime) / 60
      drawTxt(1.24, 1.44, 1.0,1.0,0.4, "Jailtime: ~r~" .. math.floor(inmins) .. "~w~ minutes remaining", 255, 255, 255, 255)
    end
  end
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if isinjail then
      Citizen.Wait(1000)
      jailtime = jailtime - 1
      if jailtime <= 0 then
        TriggerEvent('fsn_jail:releaseme')
      end
    end
  end
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if isinjail then
      Citizen.Wait(60000)
      TriggerServerEvent('fsn_jail:update:database', jailtime)
    end
  end
end)
