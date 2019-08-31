local sv_properties = {}
local sv_properties_xyz = {}

function tblCount(tbl)
	local cnt = 0
	for k,v in pairs(tbl) do
		cnt = cnt+1
	end	
	return cnt
end

function init()
	MySQL.Async.fetchAll('SELECT * FROM `fsn_properties`', {}, function(res)
		for k, p in pairs(res) do
			print(':fsn_properties: INIT '..p.property_name)
			if p.property_inventory and p.property_inventory ~= '' then
				-- convert inventory
				p.property_inventory = json.decode(p.property_inventory)
				if tblCount(p.property_inventory) > 0 and #p.property_inventory == 0 then -- using string keys instead of numbers :thinking:
					local newinv = {{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false}}
					for key, val in pairs(p.property_inventory) do
						if not val.index then 
							-- this item is from the old inv
							print('>> :fsn_properties: '..p.property_name..' has old item: '..key..' ('..val.amount..')')
							local placed = false
							for k,v in ipairs(newinv) do
								if not placed and newinv[k].index == false then
									if itemConversions[key] then
										print('>>>> :fsn_properties: putting item ('..key..'/'..val.amount..') in new inv slot '..k)
										newinv[k] = {}
										newinv[k] = itemConversions[key]
										newinv[k]['amt'] = val.amount
									else
										print('>>>> :fsn_properties: item ('..key..') does not have a conversions table')
									end
									placed = true 
								end
							end
							if not placed then
								print('>>>> :fsn_properties: could not find inv slot spare for item ('..key..')')
							end
						end
					end
				else
					if p.property_inventory == {} or tblCount(p.property_inventory) == 0 then
						print('>> :fsn_properties: '..p.property_name..' has an empty table as inv, resetting')
						p.property_inventory = {{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false}}
					end
				end
			else
				print('>> :fsn_properties: '..p.property_name..' has no inventory')
				p.property_inventory = {{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false}}
			end
			sv_properties[p.property_id] = {
				owner = p.property_owner,
				keys = json.decode(p.property_coowners),
			}
			sv_properties_xyz[p.property_id] = {
				name = p.property_name,
				xyz = json.decode(p.property_xyz)
			}
			print(':fsn_properties: FINISHED '..p.property_name)
			print('')
		end
		TriggerClientEvent('fsn_properties:updateXYZ', -1, sv_properties_xyz)
	end)
end

MySQL.ready(function()
    mysql = true
    init()
end)

RegisterServerEvent('fsn_properties:request')
AddEventHandler('fsn_properties:request', function()
	TriggerClientEvent('fsn_properties:updateXYZ', source, sv_properties_xyz)
end)

--[[
	commands
]]--
local realators = {1}
RegisterServerEvent('fsn_properties:realator:clock')
AddEventHandler('fsn_properties:realator:clock', function()
	
end)
function fsn_isRealator(id)
	for k,v in pairs(realators) do
		if v == id then
			return true
		end
	end
	return false
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
AddEventHandler('chatMessage', function(source, auth, msg)
	local split = fsn_SplitString(string.lower(msg), ' ')
	if split[1] == '/pr' then
		if split[2] == 'home' or split[2] == 'access' or split[2] == 'cash'or split[2] == 'inv' then
			TriggerClientEvent('fsn_properties:menu', source, split[2])
		elseif split[2] == 'admin' and fsn_isRealator(source) then
		
		end
	end
end)