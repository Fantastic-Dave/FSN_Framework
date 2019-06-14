function showLoadingPrompt(showText, showTime, showType)
  Citizen.CreateThread(function()
    Citizen.Wait(0)
    BeginTextCommandBusyString("STRING") -- set type
    AddTextComponentString(showText) -- sets the text
    EndTextCommandBusyString(showType) -- show promt (types = 3)
    Citizen.Wait(showTime) -- show time
    RemoveLoadingPrompt() -- remove promt
  end)
end

local metime = 0
AddEventHandler('playerSpawned', function()
	DoScreenFadeOut(0)
	Citizen.CreateThread(function()
	  while true do
		Citizen.Wait(0)
		if metime > 10 then
			if GetPlayerPed(-1) then
			  DoScreenFadeIn(2000)
			  TriggerEvent('fsn_main:charMenu')
			  break
			end
		else
			showLoadingPrompt("Loading your characters ("..metime..")...", 3000, 3)
		end
	  end
	end)
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(1000)
	metime = metime + 1
  end
end)