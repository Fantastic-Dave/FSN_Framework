function showLoadingPrompt(showText, showTime, showType)
  Citizen.CreateThread(function()
    Citizen.Wait(0)
    N_0xaba17d7ce615adbf("STRING") -- set type
    AddTextComponentString(showText) -- sets the text
    N_0xbd12f8228410d9b4(showType) -- show promt (types = 3)
    Citizen.Wait(showTime) -- show time
    N_0x10d373323e5b9c0d() -- remove promt
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