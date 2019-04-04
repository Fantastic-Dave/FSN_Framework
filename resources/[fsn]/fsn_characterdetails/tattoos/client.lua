local _menuPool = NativeUI.CreatePool()
local mainMenu = NativeUI.CreateMenu("InKed uP", "~b~TATTOO PARLOUR")
_menuPool:Add(mainMenu)

Citizen.CreateThread(function()
	for k, store in pairs(locations) do
		local blip = AddBlipForCoord(store.x, store.y, store.z)
		SetBlipSprite(blip, 75)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("InKed uP")
		EndTextCommandSetBlipName(blip)
	end
	while true do
		Citizen.Wait(0)
		_menuPool:ProcessMenus()
		for k, v in pairs(locations) do
			if GetDistanceBetweenCoords(v.x,v.y,v.z,GetEntityCoords(GetPlayerPed(-1)), true) < 10 then
				DrawMarker(1,v.x,v.y,v.z-1,0,0,0,0,0,0,1.001,1.0001,0.4001,0,155,255,175,0,0,0,0)
				if GetDistanceBetweenCoords(v.x,v.y,v.z,GetEntityCoords(GetPlayerPed(-1)), true) < 1 then
					SetTextComponentFormat("STRING")
					AddTextComponentString("Press ~INPUT_PICKUP~ to get a ~y~tattoo")
					DisplayHelpTextFromStringLabel(0, 0, 1, -1)
					if IsControlJustPressed(0,38) then
						mainMenu:Visible(not mainMenu:Visible())
					end
				end
			end
		end
	end
end)

function AddMenus(menu)
    local newitem = NativeUI.CreateItem("Beach", "Beach styled tattoos!")
    menu:AddItem(newitem)
    menu.OnItemSelect = function(sender, item, index)
	
    end
end