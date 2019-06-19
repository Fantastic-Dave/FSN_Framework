local evData
evData = AddEventHandler("playerSpawned", function()
	RemoveEventHandler(evData) -- Only do this once
	--[[DoScreenFadeOut(0)

	-- Display loading prompt
	BeginTextCommandBusyString("STRING")
	AddTextComponentString("Loading your characters")
	EndTextCommandBusyString(3)

	--Citizen.Wait(5*1000)

	RemoveLoadingPrompt()]]

	if GetPlayerPed(-1) then
		DoScreenFadeIn(2000)
		TriggerEvent("fsn_main:charMenu")
	end
end)