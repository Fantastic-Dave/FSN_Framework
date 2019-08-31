local properties_xyz = {}

AddEventHandler('fsn_main:character', function(c)
	-- what properties do i have keys to papa
	TriggerServerEvent('fsn_properties:request')
	TriggerServerEvent('fsn_properties:requestKeys', c.char_id)
end)

RegisterNetEvent('fsn_properties:updateXYZ')
AddEventHandler('fsn_properties:updateXYZ', function(tbl)
	for k,v in pairs(properties_xyz) do
		if v.blip and DoesBlipExist(v.blip) then
			RemoveBlip(v.blip)
		end
	end 
	properties_xyz = tbl
	for k,v in ipairs(properties_xyz) do
		print('adding blip for '..v.name)
		local blip = AddBlipForCoord(v.xyz.x, v.xyz.y, v.xyz.z)
		SetBlipSprite(blip, 350)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('Prop: '..v.name)
		EndTextCommandSetBlipName(blip)
		properties_xyz[k].blip = blip
	end
end)

local currentmenu = 'home'
local menus = {
	['home'] = {'/pr access','/pr cash','/pr inv',},
	['access'] = {'/pr agrant {CHAR_ID}','/pr arevoke {CHAR_ID}','/pr aview','~r~/pr home'},
	['cash'] = {'/pr mdeposit {AMT}', '/pr mtake {AMT}', '/pr mview','~r~/pr home'},
	['inv'] = {'/pr iview','~r~/pr home'}
}
RegisterNetEvent('fsn_properties:menu')
AddEventHandler('fsn_properties:menu', function(m)
	currentmenu = m
end)
Citizen.CreateThread(function()
	while true do Citizen.Wait(0)
		for k,p in pairs(properties_xyz) do
			if GetDistanceBetweenCoords(p.xyz.x,p.xyz.y,p.xyz.z,GetEntityCoords(GetPlayerPed(-1)),true) < 20 then
				DrawMarker(25, p.xyz.x,p.xyz.y,p.xyz.z - 0.95, 0, 0, 0, 0, 0, 0, 0.50, 0.50, 10.3, 255, 255, 255, 140, 0, 0, 1, 0, 0, 0, 0)
				if GetDistanceBetweenCoords(p.xyz.x,p.xyz.y,p.xyz.z,GetEntityCoords(GetPlayerPed(-1)),true) < 0.5 then
					Util.DrawText3D(p.xyz.x,p.xyz.y,p.xyz.z, '~y~PROPERTY MENU~w~\n'..table.concat(menus[currentmenu], '\n'), {255, 255, 255, 140}, 0.25)
				end
			end
		end
	end
end)