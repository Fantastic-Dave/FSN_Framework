function GetWeaponInfo(hash)
	for k, v in pairs(weaponsList) do
		if v.hash == tostring(hash) then
			return v
		end
	end
	return false
end
local name = ''
local myWeapons = {}
function GetWeapons()
	return myWeapons
end
--[[
{
	name = 'Pistol 50.',
	hash = 917418974,
	model = false,
	ammo = 200,
	owner = {
		serial = 'LS:1764135',
		name = 'Logan Whitehead'
	}
}
]]--

local droppedWeapons = {}
--[[
{
	dropid = 0,
	loc = {x = 0, y = 0, z = 0},
	weapon = {
		name = 'Pistol 50.',
		hash = 917418974,
		model = false,
		ammo = 200,
		owner = {
			serial = 'LS:1764135',
			name = 'Logan Whitehead'
		}
	}
}
]]--

function makeString(l)
	if l < 1 then return nil end
	local s = ""
	for i = 1, l do
		s = s .. math.random(32, 126)
	end
	return s
end
RegisterNetEvent('fsn_criminalmisc:weapons:add')
AddEventHandler('fsn_criminalmisc:weapons:add', function(hash, ammo)
	local info = GetWeaponInfo(hash)
	if info then
		for k, v in pairs(myWeapons) do
			if v.hash == hash then
				TriggerEvent('fsn_notify:displayNotification', 'You already have '..info.name..' so got 200 ammo', 'centerRight', 6000, 'info')
				SetPedAmmo(GetPlayerPed(-1), v.hash, 200)
				return
			end
		end
		local srl = "LS:"..makeString(6)
		table.insert(myWeapons, #myWeapons+1, {
			name = info.name,
			hash = hash,
			model = info.model,
			ammo = ammo,
			owner = {
				serial = srl,
				name = name
			}
		})
		TriggerEvent('fsn_notify:displayNotification', 'You got '..info.name, 'centerRight', 6000, 'info')
		TriggerEvent('fsn_criminalmisc:weapons:equip')
	else
		TriggerEvent('fsn_notify:displayNotification', 'Could not find weapon info, tell this to a developer ('..hash..')', 'centerRight', 10000, 'error')
	end
end)

RegisterNetEvent('fsn_criminalmisc:weapons:pickup')
AddEventHandler('fsn_criminalmisc:weapons:pickup', function(weapon)
	local info = GetWeaponInfo(weapon.hash)
	if info then
		for k, v in pairs(myWeapons) do
			if v.hash == weapon.hash then
				TriggerEvent('fsn_notify:displayNotification', 'You already have '..weapon.name..' so got 200 ammo', 'centerRight', 6000, 'info')
				SetPedAmmo(GetPlayerPed(-1), v.hash, 200)
				v.ammo = 200
				return
			end
		end
		table.insert(myWeapons, #myWeapons+1, weapon)
		TriggerEvent('fsn_notify:displayNotification', 'You got '..weapon.name..' with '..weapon.ammo..' ammo (Owned by: '..weapon.owner.name..')', 'centerRight', 8000, 'error')
		TriggerEvent('fsn_criminalmisc:weapons:equip')
	else
		TriggerEvent('fsn_notify:displayNotification', 'Could not find weapon info, tell this to a developer ('..hash..')', 'centerRight', 10000, 'error')
	end
end)

RegisterNetEvent('fsn_criminalmisc:weapons:info')
AddEventHandler('fsn_criminalmisc:weapons:info', function()
	if GetSelectedPedWeapon(GetPlayerPed(-1)) == -1569615261 then
		TriggerEvent('fsn_notify:displayNotification', 'Your fists do not have a serial number', 'centerRight', 10000, 'error')
		return
	end
	for k,v in pairs(myWeapons) do
		if v.hash == GetSelectedPedWeapon(GetPlayerPed(-1)) then
			 TriggerEvent('chatMessage', '', {255,255,255}, '^1^r:FSN:^0^* INFO | Registered to: '..v.owner.name..' / Serial: '..v.owner.serial)
		end
	end
end)

RegisterNetEvent('fsn_criminalmisc:weapons:equip')
AddEventHandler('fsn_criminalmisc:weapons:equip', function()
	for k, v in pairs(myWeapons) do
		if not HasPedGotWeapon(GetPlayerPed(-1), v.hash, false) then
			print('equipping '..v.name..' ('..v.hash..')')
			GiveWeaponToPed(GetPlayerPed(-1), v.hash, v.ammo, false, true)
		end
	end
end)

RegisterNetEvent('fsn_criminalmisc:weapons:drop')
AddEventHandler('fsn_criminalmisc:weapons:drop', function()
	if GetSelectedPedWeapon(GetPlayerPed(-1)) == -1569615261 then
		TriggerEvent('fsn_notify:displayNotification', 'You cannot drop your fists', 'centerRight', 10000, 'error')
		return
	end
	local weapon = {}
	local remov = 0
	for k,v in pairs(myWeapons) do
		if v.hash == GetSelectedPedWeapon(GetPlayerPed(-1)) then
			remov = k
			weapon = v
			print('droppping current weapon: '..weapon.name)
		end
	end
	TriggerServerEvent('fsn_criminalmisc:weapons:addDrop', weapon, {x=GetEntityCoords(GetPlayerPed(-1)).x, y=GetEntityCoords(GetPlayerPed(-1)).y, z=GetEntityCoords(GetPlayerPed(-1)).z})
	
	RemoveWeaponFromPed(GetPlayerPed(-1), GetSelectedPedWeapon(GetPlayerPed(-1)))
	myWeapons[remov] = nil
	table.remove(myWeapons, remov)
	
	TriggerEvent('fsn_main:characterSaving')
end)

RegisterNetEvent('fsn_criminalmisc:weapons:updateDropped')
AddEventHandler('fsn_criminalmisc:weapons:updateDropped', function(weapons)
	droppedWeapons = weapons
	for k, v in pairs(droppedWeapons) do
		print(v.weapon.name)
	end
end)

AddEventHandler('fsn_main:character', function(character)
	myWeapons = json.decode(character.char_weapons)
	name = character.char_fname..' '..character.char_lname
	
	TriggerEvent('fsn_criminalmisc:weapons:equip')
end)

---------------------------------------------------- system
function fsn_drawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    if onScreen then
        SetTextScale(0.3, 0.3)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 140)
        SetTextDropshadow(0, 0, 0, 0, 55)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		for k,v in pairs(droppedWeapons) do
			--if GetDistanceBetweenCoords(v.loc.x, v.loc.y, v.loc.z, GetEntityCoords(GetPlayerPed(-1))) < 10 then
				DrawMarker(25, v.loc.x, v.loc.y, v.loc.z - 0.95, 0, 0, 0, 0, 0, 0, 0.50, 0.50, 10.3, 255, 255, 255, 140, 0, 0, 1, 0, 0, 0, 0)
				if GetDistanceBetweenCoords(v.loc.x, v.loc.y, v.loc.z, GetEntityCoords(GetPlayerPed(-1))) < 1 then
					fsn_drawText3D(v.loc.x, v.loc.y, v.loc.z, "[E] pickup "..v.weapon.name)
					if IsControlJustPressed(0, 38) then
						TriggerServerEvent('fsn_criminalmisc:weapons:pickup', v.dropid)
					end
				end 
			--end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5000)
		for k,v in pairs(myWeapons) do
			v.ammo = GetAmmoInPedWeapon(GetPlayerPed(-1), v.hash)
		end
	end
end)