function invLog(str)
	SendNUIMessage({
		action = 'log',
		string = str
	})
end

--[[
	New inventory shit
]]--
local beingused = false
local firstInventory = {{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},}
local secondInventory_type = 'ply'
local secondInventory_id = 0
local secondInventory = {}
function updateGUI()
	SendNUIMessage({
		action = 'update',
		inuse = beingused,
		first = firstInventory,
		second = secondInventory
	})
end

--[[
	Exports
]]--
local max_weight = 30
function fsn_CanCarry(item, amt)
	if presetItems[item] and presetItems[item].data and presetItems[item].data.weight then
		local maff = presetItems[item].data.weight * amt
		if fsn_CurrentWeight() + maff <= max_weight then
			return true
		else
			return false
		end
	else
		print('no preset weight data for '..item)
		return true
	end
end
function fsn_CurrentWeight()
	local weight = 0
	for k,v in pairs(firstInventory) do 
		if v.index then
			if v.data and v.data.weight then
				 weight = weight + v.data.weight * v.amt
			end
		end
	end
	print('currently carrying '..weight)
	return weight
end
function fsn_HasItem(item)	
	for k,v in pairs(firstInventory) do
		if v.index == item then
			return true
		end
	end
	return false
end
function fsn_HasPhone()
	return fsn_HasItem('phone')
end
function fsn_GetItemAmount(item)
	local amt = 0
	for k,v in pairs(firstInventory) do
		if v.index == item then
			amt = amt + v.amt
		end
	end
	return amt
end
function fsn_GetItemDetails(item)
	return presetItems[item]
end
--[[
	Manage item data
]]--
RegisterNUICallback( "viewData", function(data, cb)
	data.slot = data.slot +1
	local strang = ''
	local index = 'default'
	local name = 'default'
	if data.inv == 'playerInventory' then
		local item = firstInventory[data.slot]
		if item then
			index = item.index
			name = item.name
			if item.data then
				strang = strang..'<h2>Item Data</h2>'
				for k, d in pairs(item.data) do
					strang = strang..'<p><span>'..k..':</span> '..d..'</p>'
				end
			end
			if item.customData then
				strang = strang..'<h2>Custom Data</h2>'
				for k, d in pairs(item.customData) do
					strang = strang..'<p><span>'..k..':</span> '..d..'</p>'
				end
			end
			
		end
	else
		local item = secondInventory[data.slot]
		if item then
			index = item.index
			name = item.name
			if item.data then
				strang = strang..'<h2>Item Data</h2>'
				for k, d in pairs(item.data) do
					strang = strang..'<p><span>'..k..':</span> '..d..'</p>'
				end
			end
			if item.customData then
				strang = strang..'<h2>Custom Data</h2>'
				for k, d in pairs(item.customData) do
					strang = strang..'<p><span>'..k..':</span> '..d..'</p>'
				end
			end
		end
	end
	SendNUIMessage({
		action = 'data',
		index = index,
		name = name,
		html = strang
	})
end)

--[[
	Manage slots
]]--
RegisterNUICallback( "dragToSlot", function(data, cb)
	if data.toSlot == data.fromSlot and data.fromInv == data.toInv then
		invLog('<span style="color:red">You cannot move this into itself</span>')
		return
	end
	if data.fromInv == 'playerInventory' then
		local oldSlot = firstInventory[data.fromSlot]
		if data.amt > oldSlot.amt then
			data.amt = oldSlot.amt
		end
		if data.toInv == 'playerInventory' then	
			if firstInventory[data.toSlot].index then
				if firstInventory[data.toSlot].index ~= oldSlot.index then
					invLog('<span style="color:red">This slot is occupied</span>')
					return
				end
				if firstInventory[data.toSlot].customData then
					invLog('<span style="color:red">You cannot merge items with custom data!</span>')
					return
				end
				if oldSlot.customData then
					invLog('<span style="color:red">You cannot merge items with custom data!</span>')
					return
				end
			end
		else
			if secondInventory[data.toSlot].index then
				if secondInventory[data.toSlot].index ~= oldSlot.index then
					invLog('<span style="color:red">This slot is occupied</span>')
					return
				end
				if secondInventory[data.toSlot].customData then
					invLog('<span style="color:red">You cannot merge items with custom data!</span>')
					return
				end
				if oldSlot.customData then
					invLog('<span style="color:red">You cannot merge items with custom data!</span>')
					return
				end
			end
		end
		if data.amt == oldSlot.amt or data.amt == -99 then -- if moving all of item
			if data.toInv == 'playerInventory' then	
				-- moving all of the stack around in my inv
				if firstInventory[data.toSlot].index == oldSlot.index then
					firstInventory[data.toSlot].amt = firstInventory[data.toSlot].amt + oldSlot.amt
				else
					firstInventory[data.toSlot] = firstInventory[data.fromSlot]
				end
			else
				-- moving all of the stack to their inv
				if secondInventory[data.toSlot].index == oldSlot.index then
					secondInventory[data.toSlot].amt = secondInventory[data.toSlot].amt + oldSlot.amt
				else
					secondInventory[data.toSlot] = firstInventory[data.fromSlot]
				end
			end
			firstInventory[data.fromSlot] = {}
		else -- if moving part of the stack
			if data.toInv == 'playerInventory' then
				-- moving part of the stack around in my inv
				if firstInventory[data.toSlot].index == firstInventory[data.fromSlot].index then
					firstInventory[data.toSlot].amt = firstInventory[data.toSlot].amt + data.amt
				else
					firstInventory[data.toSlot] = {
						index = firstInventory[data.fromSlot].index,
						name = firstInventory[data.fromSlot].name,
						amt = data.amt,
					}
				end
				firstInventory[data.fromSlot].amt = firstInventory[data.fromSlot].amt - data.amt
			else
				-- moving part of the stack to their inv
				if secondInventory[data.toSlot].index == firstInventory[data.fromSlot].index then
					secondInventory[data.toSlot].amt = secondInventory[data.toSlot].amt + data.amt
				else
					secondInventory[data.toSlot] = {
						index = firstInventory[data.fromSlot].index,
						name = firstInventory[data.fromSlot].name,
						amt = data.amt,
					}
				end
				firstInventory[data.fromSlot].amt = firstInventory[data.fromSlot].amt - data.amt
			end
		end
	elseif data.fromInv == 'otherInventory' then
		-- moving something from their inv
		local oldSlot = secondInventory[data.fromSlot]
		if data.amt > oldSlot.amt then
			data.amt = oldSlot.amt
		end
		if data.toInv == 'playerInventory' then
			if not fsn_CanCarry(oldSlot.index, oldSlot.amt) then
				invLog('<span style="color:red">You cannot carry this!</span>')
				return
			end
			if firstInventory[data.toSlot].index then
				if firstInventory[data.toSlot].index ~= oldSlot.index then
					invLog('<span style="color:red">This slot is occupied</span>')
					return
				end
				if firstInventory[data.toSlot].customData then
					invLog('<span style="color:red">You cannot merge items with custom data!</span>')
					return
				end
				if oldSlot.customData then
					invLog('<span style="color:red">You cannot merge items with custom data!</span>')
					return
				end
			end
		else
			if secondInventory[data.toSlot].index then
				if secondInventory[data.toSlot].index ~= oldSlot.index then
					invLog('<span style="color:red">This slot is occupied</span>')
					return
				end
				if secondInventory[data.toSlot].customData then
					invLog('<span style="color:red">You cannot merge items with custom data!</span>')
					return
				end
				if oldSlot.customData then
					invLog('<span style="color:red">You cannot merge items with custom data!</span>')
					return
				end
			end
		end
		if data.amt == oldSlot.amt or data.amt == -99 then -- if moving all of item
			if data.toInv == 'playerInventory' then	
				-- moving all of item to my inv
				if firstInventory[data.toSlot].index == oldSlot.index then
					firstInventory[data.toSlot].amt = firstInventory[data.toSlot].amt + oldSlot.amt
				else
					firstInventory[data.toSlot] = secondInventory[data.fromSlot]
				end
			else
				-- moving all of item to somewhere else in their inv
				if secondInventory[data.toSlot].index == oldSlot.index then
					secondInventory[data.toSlot].amt = secondInventory[data.toSlot].amt + oldSlot.amt
				else
					secondInventory[data.toSlot] = secondInventory[data.fromSlot]
				end
			end
			secondInventory[data.fromSlot] = {}
		else -- if moving part of the stack
			if data.toInv == 'playerInventory' then
				-- moving part of the stack to my inv
				if firstInventory[data.toSlot].index == secondInventory[data.fromSlot].index then
					firstInventory[data.toSlot].amt = firstInventory[data.toSlot].amt + data.amt
				else
					firstInventory[data.toSlot] = {
						index = secondInventory[data.fromSlot].index,
						name = secondInventory[data.fromSlot].name,
						amt = data.amt,
					}
				end
				secondInventory[data.fromSlot].amt = secondInventory[data.fromSlot].amt - data.amt
			else
				-- moving part of the stack around in their inv
				if secondInventory[data.toSlot].index == secondInventory[data.fromSlot].index then
					secondInventory[data.toSlot].amt = secondInventory[data.toSlot].amt + data.amt
				else
					secondInventory[data.toSlot] = {
						index = secondInventory[data.fromSlot].index,
						name = secondInventory[data.fromSlot].name,
						amt = data.amt,
					}
				end
				secondInventory[data.fromSlot].amt = secondInventory[data.fromSlot].amt - data.amt
			end
		end
	else
		exports['mythic_notify']:DoCustomHudText('error', 'Inventory ('..data.fromInv..') not found!', 4000)
	end
	--if player send them update
	if secondInventory_type == 'ply' and secondInventory_id ~= 0 then
		TriggerServerEvent('fsn_inventory:ply:update', secondInventory_id, secondInventory)
	end
	-- send server vehicle update
	if secondInventory_type == 'trunk' or secondInventory_type == 'glovebox' then
		TriggerServerEvent('fsn_inventory:veh:update', secondInventory_type, secondInventory_id, secondInventory)
	end
	if secondInventory_type == 'apt' then
		TriggerEvent('fsn_apartments:inv:update', secondInventory)
	end
	updateGUI()
end)

RegisterNUICallback("dropSlot", function(data, cb)
	if data.fromInv ~= 'playerInventory' then
		invLog('<span style="color:red">You can only drop from your inventory</span>')
		return
	end
	local slot = firstInventory[data.fromSlot]
	if data.amt >= slot.amt or data.amt == -99 then
		data.amt = slot.amt
	end
	if data.amt == slot.amt then
		-- start dropping -- 
		local coords = GetEntityCoords(GetPlayerPed(-1))
		local xyz = {x=coords.x, y=coords.y, z=coords.z}
		TriggerServerEvent('fsn_inventory:drops:drop', xyz, slot)
		-- end dropping --
		firstInventory[data.fromSlot] = {}
		updateGUI()
	else
		local item = {
			index=firstInventory[data.fromSlot].index,
			name=firstInventory[data.fromSlot].name,
			amt=data.amt,
			data = firstInventory[data.fromSlot].data,
			customData = firstInventory[data.fromSlot].customData
		}
		firstInventory[data.fromSlot].amt = firstInventory[data.fromSlot].amt - data.amt
		-- start dropping -- 
		local coords = GetEntityCoords(GetPlayerPed(-1))
		local xyz = {x=coords.x, y=coords.y, z=coords.z}
		TriggerServerEvent('fsn_inventory:drops:drop', xyz, item)
		-- end dropping --
		updateGUI()
	end
end)

RegisterNUICallback("useSlot", function(data, cb)
	if data.fromInv ~= 'playerInventory' then
		invLog('<span style="color:red">You can only use from your inventory</span>')
		return
	end
	local slot = firstInventory[data.fromSlot]
	if slot.index then
		if itemUses[slot.index] then
			itemUses[slot.index].use(slot)
			if itemUses[slot.index].takeItem then
				if firstInventory[data.fromSlot].amt ~= 1 then
					firstInventory[data.fromSlot].amt = firstInventory[data.fromSlot].amt-1
				else
					firstInventory[data.fromSlot] = {}
				end
				exports['mythic_notify']:DoHudText('success', 'You used 1: '..slot.name)
				updateGUI()
			else
				exports['mythic_notify']:DoHudText('success', 'You used: '..slot.name)
			end
			toggleGUI()
		else
			invLog('<span style="color:red">This item does not have a use associated</span>')
			exports['mythic_notify']:DoHudText('error', 'This item does not have a use associated')
			return
		end
	end
end)

--[[
	Manage GUI
]]--
local gui = false
function toggleGUI()
	if gui then
		if secondInventory_type == 'ply' and secondInventory_id ~= 0 then
			TriggerServerEvent('fsn_inventory:ply:finished', secondInventory_id)
		end
		if secondInventory_type == 'trunk' or secondInventory_type == 'glovebox' then
			TriggerServerEvent('fsn_inventory:veh:finished', secondInventory_id)
		end
		secondInventory_type = 'ply'
		secondInventory_id = 0
		secondInventory = {}
		SetNuiFocus( false )
		SendNUIMessage({
			action = 'display',
			val = false
		})
		gui = false
	else
		SetNuiFocus( true, true )
		SendNUIMessage({
			action = 'display',
			val = true
		})
		updateGUI()
		gui = true
	end
end
RegisterNetEvent('fsn_inventory:gui:display')
AddEventHandler('fsn_inventory:gui:display', function()
	toggleGUI()
end)
RegisterNUICallback( "closeGUI", function(data, cb)
	toggleGUI()
end)
RegisterNetEvent('fsn_inventory:me:update')
AddEventHandler('fsn_inventory:me:update', function(tbl)
	firstInventory = tbl
	updateGUI()
end)
--[[
	Manage second inventory
]]--
RegisterNetEvent('fsn_inventory:ply:request')
AddEventHandler('fsn_inventory:ply:request', function(to)
	beingused = true
	updateGUI()
	TriggerServerEvent('fsn_inventory:sys:send', to, firstInventory)
end)
RegisterNetEvent('fsn_inventory:ply:done')
AddEventHandler('fsn_inventory:ply:done', function()
	beingused = false
	updateGUI()
end)
RegisterNetEvent('fsn_inventory:ply:recieve')
AddEventHandler('fsn_inventory:ply:recieve', function(from, tbl)
	secondInventory_type = 'ply'
	secondInventory_id = from
	secondInventory = tbl
	updateGUI()
	if not gui then
		toggleGUI()
	end
	invLog('received inventory from Player('..from..')')
end)
RegisterNetEvent('fsn_inventory:veh:trunk:recieve')
AddEventHandler('fsn_inventory:veh:trunk:recieve', function(plate, tbl)
	secondInventory_type = 'trunk'
	secondInventory_id = plate
	secondInventory = tbl
	updateGUI()
	if not gui then
		toggleGUI()
	end
	invLog('received trunk from Vehicle('..plate..')')
end)
RegisterNetEvent('fsn_inventory:veh:glovebox:recieve')
AddEventHandler('fsn_inventory:veh:glovebox:recieve', function(plate, tbl)
	secondInventory_type = 'glovebox'
	secondInventory_id = plate
	secondInventory = tbl
	updateGUI()
	if not gui then
		toggleGUI()
	end
	invLog('received glovebox from Vehicle('..plate..')')
end)
RegisterNetEvent('fsn_inventory:apt:recieve')
AddEventHandler('fsn_inventory:apt:recieve', function(id, tbl)
	secondInventory_type = 'apt'
	secondInventory_id = id
	secondInventory = tbl
	updateGUI()
	if not gui then
		toggleGUI()
	end
	invLog('received glovebox from Apartment('..id..')')
end)
--[[
	Manage items
]]--
RegisterNetEvent('fsn_inventory:item:take')
AddEventHandler('fsn_inventory:item:take', function(item, amt)
	if amt == fsn_GetItemAmount(item) then
		-- take all
		for k,v in pairs(firstInventory) do
			if v.index == item then
				firstInventory[k] = {}
			end
		end
	else
		for k,v in pairs(firstInventory) do
			if v.index == item and amt > 0 then
				if v.amt == amt then
					firstInventory[k] = {}
					amt = 0
				else
					if firstInventory[k].amt < amt then
						local amount = firstInventory[k].amt
						firstInventory[k].amt = firstInventory[k].amt - amt
						amt = amt - amount
					end
				end
			end
		end
	end
	updateGUI()
end)
RegisterNetEvent('fsn_inventory:items:add')
AddEventHandler('fsn_inventory:items:add', function(item)
	local placed = false
	if fsn_CanCarry(item.index, item.amt) then
		for k, slot in pairs(firstInventory) do
			if not placed then 
				if slot.index then
					if not slot.customData then
						if not item.customData then
							if slot.index == item.index then
								firstInventory[k].amt = firstInventory[k].amt + item.amt
								placed = true
							end
						end
					end	
				else
					firstInventory[k] = item
					placed = true
				end
			end
		end
	else
		exports['mythic_notify']:DoHudText('error', 'You cannot carry '..item.amt..': '..item.name)
	end
	if not placed then
		exports['mythic_notify']:DoHudText('error', 'You do not have a slot free for this!')
		
		-- start dropping -- 
		local coords = GetEntityCoords(GetPlayerPed(-1))
		local xyz = {x=coords.x, y=coords.y, z=coords.z}
		TriggerServerEvent('fsn_inventory:drops:drop', xyz, item)
		-- end dropping --
	else
		exports['mythic_notify']:DoHudText('inform', 'You got '..item.amt..' '..item.name)
	end
	updateGUI()
end)
RegisterNetEvent('fsn_inventory:items:addPreset')
AddEventHandler('fsn_inventory:items:addPreset', function(item, amt)
	if presetItems[item] then
		local insert = presetItems[item]
		insert.amt = amt
		TriggerEvent('fsn_inventory:items:add', insert)
	else
		exports['mythic_notify']:DoHudText('error', 'Item reset '..item..' seems to be missing')
	end
end)
RegisterNetEvent('fsn_inventory:item:add')
AddEventHandler('fsn_inventory:item:add', function(item, amount)
	print('legacy adding: '..amount..' '..item)
	TriggerEvent('fsn_inventory:items:addPreset', item, amount)
end)
--[[
	Store stuffs
]]--
local prices = {
	["beef_jerky"] = 4,
	["cupcake"] = 1,
	["microwave_burrito"] = 8,
	["panini"] = 6,
	["pepsi"] = 5,
	["pepsi_max"] = 6,
	["water"] = 3,
	["coffee"] = 10,
	["repair_kit"] = 250,
	["lockpick"] = 200,
	["zipties"] = 1000,
	["phone"] = 250,
	["binoculars"] = 250,
	["bandage"] = 250,
}
RegisterNetEvent('fsn_inventory:prebuy')
RegisterNetEvent('fsn_inventory:buyItem')
AddEventHandler('fsn_inventory:prebuy', function(item)
  if not fsn_CanCarry(item, 1) then
    TriggerEvent('fsn_notify:displayNotification', 'You cannot carry this!', 'centerLeft', 3000, 'error')
  else
    TriggerEvent('fsn_inventory:buyItem', item, prices[item], 1)
  end
end)
--[[
	CONVERT OLD INV / GIVE ID CARD ON FIRST JOIN
]]--
intiiated = false
function init(charTbl)
	local inventory	= json.decode(charTbl.char_inventory)
	if inventory.firstSpawned == true then
		-- you have the new inv very nice
		firstInventory = inventory.table
		exports['mythic_notify']:DoHudText('success', 'You already got this system fam!', 8000)
		intiiated = true
	else
		exports['mythic_notify']:DoHudText('inform', 'Trying to update your inventory to the new system', 8000)
		Citizen.Wait(3000)
		for key, item in pairs(inventory) do
			if presetItems[key] then
				TriggerEvent('fsn_inventory:items:addPreset', key, item.amount)
			else
				exports['mythic_notify']:DoHudText('error', 'No preset found for: '..key, 10000)
			end
		end
		Citizen.Wait(500)
		TriggerEvent('fsn_licenses:giveID')
		Citizen.Wait(500)
		exports['mythic_notify']:DoHudText('success', 'Success', 8000)
		intiiated = true
	end
end
AddEventHandler('fsn_main:character', function(charTbl)
	init(charTbl)
end)
--[[
	saving :)
]]--
AddEventHandler('fsn_main:characterSaving', function()	
	if intiiated then
		local inv = {
			firstSpawned = true,
			table = firstInventory,
		}
		TriggerServerEvent('fsn_inventory:database:update', inv)
	end
end)