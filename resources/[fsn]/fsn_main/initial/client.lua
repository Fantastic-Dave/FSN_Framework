Citizen.CreateThread(function()
	while true do
	    Citizen.Wait(0)
	    SetVehicleDensityMultiplierThisFrame(0.6)
	    SetRandomVehicleDensityMultiplierThisFrame(0.6)
	end
end)
local fsn_spawned = false
local current_character_id = 0
local current_character = {}
RegisterNetEvent('spawnme')
AddEventHandler('spawnme', function()
  fsn_spawned = true
end)
local function freezePlayer(id, freeze)
    local player = id
    SetPlayerControl(player, not freeze, false)

    local ped = GetPlayerPed(player)

    if not freeze then
        if not IsEntityVisible(ped) then
            --SetEntityVisible(ped, true)
        end

        if not IsPedInAnyVehicle(ped) then
            SetEntityCollision(ped, true)
        end

        FreezeEntityPosition(ped, false)
        SetPlayerInvincible(player, false)
    else
        if IsEntityVisible(ped) then
            SetEntityVisible(ped, false)
        end

        SetEntityCollision(ped, false)
        FreezeEntityPosition(ped, true)
        SetPlayerInvincible(player, true)

        if not IsPedFatallyInjured(ped) then
            ClearPedTasksImmediately(ped)
        end
    end
end
function fsn_IPLManager()
  LoadMpDlcMaps()
  EnableMpDlcMaps(true)
  RequestIpl("chop_props")
  RequestIpl("FIBlobby")
  RemoveIpl("FIBlobbyfake")
  RequestIpl("FBI_colPLUG")
  RequestIpl("FBI_repair")
  RequestIpl("v_tunnel_hole")
  RequestIpl("TrevorsMP")
  RequestIpl("TrevorsTrailer")
  RequestIpl("TrevorsTrailerTidy")
  RemoveIpl("farm_burnt")
  RemoveIpl("farm_burnt_lod")
  RemoveIpl("farm_burnt_props")
  RemoveIpl("farmint_cap")
  RemoveIpl("farmint_cap_lod")
  RequestIpl("farm")
  RequestIpl("farmint")
  RequestIpl("farm_lod")
  RequestIpl("farm_props")
  RequestIpl("facelobby")
  RemoveIpl("CS1_02_cf_offmission")
  RequestIpl("CS1_02_cf_onmission1")
  RequestIpl("CS1_02_cf_onmission2")
  RequestIpl("CS1_02_cf_onmission3")
  RequestIpl("CS1_02_cf_onmission4")
  RequestIpl("v_rockclub")
  RemoveIpl("hei_bi_hw1_13_door")
  RequestIpl("bkr_bi_hw1_13_int")
  RequestIpl("ufo")
  RemoveIpl("v_carshowroom")
  RemoveIpl("shutter_open")
  RemoveIpl("shutter_closed")
  RemoveIpl("shr_int")
  RemoveIpl("csr_inMission")
  RequestIpl("v_carshowroom")
  RequestIpl("shr_int")
  RequestIpl("shutter_closed")
  RequestIpl("smboat")
  RequestIpl("cargoship")
  RequestIpl("railing_start")
  RemoveIpl("sp1_10_fake_interior")
  RemoveIpl("sp1_10_fake_interior_lod")
  RequestIpl("sp1_10_real_interior")
  RequestIpl("sp1_10_real_interior_lod")
  RemoveIpl("id2_14_during_door")
  RemoveIpl("id2_14_during1")
  RemoveIpl("id2_14_during2")
  RemoveIpl("id2_14_on_fire")
  RemoveIpl("id2_14_post_no_int")
  RemoveIpl("id2_14_pre_no_int")
  RemoveIpl("id2_14_during_door")
  RequestIpl("id2_14_during1")
  RequestIpl("coronertrash")
  RequestIpl("Coroner_Int_on")
  RemoveIpl("Coroner_Int_off")
  RemoveIpl("bh1_16_refurb")
  RemoveIpl("jewel2fake")
  RemoveIpl("bh1_16_doors_shut")
  RequestIpl("refit_unload")
  RequestIpl("post_hiest_unload")
  RequestIpl("Carwash_with_spinners")
  RequestIpl("ferris_finale_Anim")
  RemoveIpl("ch1_02_closed")
  RequestIpl("ch1_02_open")
  RequestIpl("AP1_04_TriAf01")
  RequestIpl("CS2_06_TriAf02")
  RequestIpl("CS4_04_TriAf03")
  RemoveIpl("scafstartimap")
  RequestIpl("scafendimap")
  RemoveIpl("DT1_05_HC_REMOVE")
  RequestIpl("DT1_05_HC_REQ")
  RequestIpl("DT1_05_REQUEST")
  RequestIpl("FINBANK")
  RemoveIpl("DT1_03_Shutter")
  RemoveIpl("DT1_03_Gr_Closed")
  RequestIpl("ex_sm_13_office_01a")
  RequestIpl("ex_sm_13_office_01b")
  RequestIpl("ex_sm_13_office_02a")
  RequestIpl("ex_sm_13_office_02b")
  RequestIpl("rc12b_hospitalinterior")
  RequestIpl("rc12b_hospitalinterior_lod")
  --RequestIpl("rc12b_fixed")
  RequestIpl("CS3_05_water_grp1")
  RequestIpl("CS3_05_water_grp2")
  RequestIpl("canyonriver01")
  RequestIpl("canyonrvrdeep")
end
function fsn_mainSpawn()
  fsn_spawned = false
  local spawncoords = {x = -931.23278808594, y= 5587.6728515625, z= 91.584693908691}
  DoScreenFadeOut(500)
  --NetworkResurrectLocalPlayer(spawncoords.x, spawncoords.y, spawncoords.z, Citizen.PointerValueVector(), true, true, false)
  --TriggerEvent('PlayerSpawned')
  SetEntityCoords(GetPlayerPed(-1), spawncoords.x, spawncoords.y, spawncoords.z)
  freezePlayer(-1, true)
  Citizen.CreateThread(function()
	Citizen.Wait(2000)
	DoScreenFadeIn(3500)
    while true do
      Citizen.Wait(0)
      if fsn_spawned then
        DisableControlAction(0, 1, false)
        DisableControlAction(0, 2, false)
        DisableControlAction(0, 142, false)
        DisableControlAction(0, 106, false)
        DisableControlAction(0, 24, false)
        DisableControlAction(0, 140, false)
        DisableControlAction(0, 141, false)
        DisableControlAction(0, 257, false)
        DisableControlAction(0, 263, false)
        DisableControlAction(0, 264, false)
        DisableControlAction(0, 25, false)
        DisableControlAction(0, 50, false)
        freezePlayer(-1, false)
        break
      else
        HideHudAndRadarThisFrame()
        --ShowCursorThisFrame()
        DisableControlAction(0, 1, true)
  			DisableControlAction(0, 2, true)
  			DisableControlAction(0, 142, true)
  			DisableControlAction(0, 106, true)
  			DisableControlAction(0, 24, true)
  			DisableControlAction(0, 140, true)
  			DisableControlAction(0, 141, true)
  			DisableControlAction(0, 257, true)
  			DisableControlAction(0, 263, true)
  			DisableControlAction(0, 264, true)
  			DisableControlAction(0, 25, true)
  			DisableControlAction(0, 50, true)
      end
    end
  end)
end
----------------------- Character Shit
current_characters = {}
RegisterNetEvent('fsn_main:updateCharacters')
AddEventHandler('fsn_main:updateCharacters', function(tbl)
  current_characters = tbl
end)
current_character_index = 0
RegisterNetEvent('fsn_main:charMenu')
AddEventHandler('fsn_main:charMenu', function()
  SetNuiFocus(true,true)
  SendNUIMessage({type='charMenu', enable=true})
  fsn_mainSpawn()
  TriggerServerEvent('fsn_main:requestCharacters')
end)

RegisterNetEvent('fsn_main:character')
RegisterNetEvent('fsn_main:initiateCharacter')
AddEventHandler('fsn_main:initiateCharacter', function(character)
  fsn_IPLManager()
  local mainSpawn = {x = -216.92286682129, y = -1038.2293701172, z = 31.140268325806}
  local policeSpawn = {x = 458.97357177734, y = -991.02905273438, z = 31.689582824707}
  local char = character[1]
  local model = tonumber(char.char_model)
  current_character_id = char.char_id
  current_character = char
  SetNuiFocus(false,false)
  SendNUIMessage({type='charMenu', enable=false})
  SetEntityCoords(GetPlayerPed(-1), mainSpawn.x, mainSpawn.y, mainSpawn.z)
  fsn_spawned = true
  Citizen.CreateThread(function()
  SetEntityVisible(GetPlayerPed(-1), true)
  --[[
    RequestModel(model)
    
    while not HasModelLoaded(model) do
      Citizen.Wait(1)
      RequestModel(model)
    end
	
    SetPlayerModel(PlayerId(), model)
    SetModelAsNoLongerNeeded(model)
    SetEntityVisible(GetPlayerPed(-1), true)

    local weapons = json.decode(char.char_weapons)
    for k, v in pairs(weapons) do
      local hash = v.weaponHash
      local ammo = v.ammo
      GiveWeaponToPed(GetPlayerPed(-1), GetHashKey(hash), ammo, false, false)
    end
    if char.mdl_extras ~= '[]' then
      local variations = json.decode(char.mdl_extras)
      for _, tbl in pairs(variations) do
        if tbl.type == 'drawable' then
          SetPedComponentVariation(GetPlayerPed(-1), tbl.index, tbl.drawable, tbl.texture, tbl.texture)
        elseif tbl.type == 'prop' then
          SetPedPropIndex(GetPlayerPed(-1), tbl.index, tbl.prop, tbl.texture, true)
        end
      end
    else
      for i=1,10 do
        SetPedRandomComponentVariation(GetPlayerPed(-1), true)
      end
    end
	]]
	
	if char.char_model == '{}' or char.char_model == '[]' then
		TriggerServerEvent("clothes:firstspawn")
	else
		TriggerEvent("clothes:spawn", json.decode(char.char_model))
    end
	TriggerEvent('fsn_main:character', char)
    TriggerEvent('fsn_police:init', char.char_police)
    TriggerEvent('fsn_jail:init', char.char_id)
    TriggerEvent('fsn_inventory:initChar', char.char_inventory)
    TriggerEvent('fsn_bank:change:bankAdd', 0)
    TriggerEvent('fsn_ems:reviveMe:force')
    for k, v in pairs(current_characters) do
        if v.char_id == current_character_id then
          current_character_index = k
        end
    end
    TriggerEvent('chatMessage', '', {255,255,255}, '^1^*Warning:^r This is a beta release of the :FSN: Framework. We aren\'t expecting any bugs, but those that are found should be reported via dm to JamesSc0tt on discord or the forums.')
	TriggerServerEvent('fsn_apartments:getApartment', char.char_id)
  end)
end)

RegisterNetEvent('fsn_main:sendCharacters')
AddEventHandler('fsn_main:sendCharacters', function(characters)
  if characters[1] then
    char1_id = characters[1].char_id
    char1_fname = characters[1].char_fname
    char1_lname = characters[1].char_lname
    char1_dob = characters[1].char_dob
  else
    char1_id = 'nothing'
    char1_fname = 'nothing'
    char1_lname = 'nothing'
    char1_dob = 'nothing'
  end
  if characters[2] then
    char2_id = characters[2].char_id
    char2_fname = characters[2].char_fname
    char2_lname = characters[2].char_lname
    char2_dob = characters[2].char_dob
  else
    char2_id = 'nothing'
    char2_fname = 'nothing'
    char2_lname = 'nothing'
    char2_dob = 'nothing'
  end
  if characters[3] then
    char3_id = characters[3].char_id
    char3_fname = characters[3].char_fname
    char3_lname = characters[3].char_lname
    char3_dob = characters[3].char_dob
  else
    char3_id = 'nothing'
    char3_fname = 'nothing'
    char3_lname = 'nothing'
    char3_dob = 'nothing'
  end
  SendNUIMessage({
    type='characterInfo',
    char1_id = char1_id,
    char1_fname = char1_fname,
    char1_lname = char1_lname,
    char1_dob = char1_dob,
    char2_id = char2_id,
    char2_fname = char2_fname,
    char2_lname = char2_lname,
    char2_dob = char2_dob,
    char3_id = char3_id,
    char3_fname = char3_fname,
    char3_lname = char3_lname,
    char3_dob = char3_dob
  })
end)

RegisterNUICallback('spawnCharacter', function(data, cb)
  TriggerServerEvent('fsn_main:getCharacter', data.character_id)
end)

RegisterNUICallback('createCharacter', function(data, cb)
  TriggerServerEvent('fsn_main:createCharacter', data)
end)
-------------------------------------------- Store stuffs
AddEventHandler('fsn_inventory:buyItem', function(item, price, amount)
  if fsn_CanAfford(price) then
    TriggerEvent('fsn_inventory:item:add', item, amount)
    TriggerEvent('fsn_bank:change:walletMinus', price)
  else
    TriggerEvent('fsn_notify:displayNotification', 'You cannot afford this!', 'centerLeft', 3000, 'error')
  end
end)
-------------------------------------------- Character Saving
local savingWeapons = {
  "WEAPON_KNIFE",
  "WEAPON_NIGHTSTICK",
  "WEAPON_HAMMER",
  "WEAPON_BAT",
  "WEAPON_GOLFCLUB",
  "WEAPON_CROWBAR",
  "WEAPON_PISTOL",
  "WEAPON_COMBATPISTOL",
  "WEAPON_APPISTOL",
  "WEAPON_PISTOL50",
  "WEAPON_MICROSMG",
  "WEAPON_SMG",
  "WEAPON_ASSAULTSMG",
  "WEAPON_ASSAULTRIFLE",
  "WEAPON_CARBINERIFLE",
  "WEAPON_ADVANCEDRIFLE",
  "WEAPON_MG",
  "WEAPON_COMBATMG",
  "WEAPON_PUMPSHOTGUN",
  "WEAPON_SAWNOFFSHOTGUN",
  "WEAPON_ASSAULTSHOTGUN",
  "WEAPON_BULLPUPSHOTGUN",
  "WEAPON_STUNGUN",
  "WEAPON_SNIPERRIFLE",
  "WEAPON_SMOKEGRENADE",
  "WEAPON_BZGAS",
  "WEAPON_MOLOTOV",
  "WEAPON_FIREEXTINGUISHER",
  "WEAPON_PETROLCAN",
  "WEAPON_SNSPISTOL",
  "WEAPON_SPECIALCARBINE",
  "WEAPON_HEAVYPISTOL",
  "WEAPON_BULLPUPRIFLE",
  "WEAPON_HOMINGLAUNCHER",
  "WEAPON_PROXMINE",
  "WEAPON_SNOWBALL",
  "WEAPON_VINTAGEPISTOL",
  "WEAPON_DAGGER",
  "WEAPON_FIREWORK",
  "WEAPON_MUSKET",
  "WEAPON_MARKSMANRIFLE",
  "WEAPON_HEAVYSHOTGUN",
  "WEAPON_GUSENBERG",
  "WEAPON_HATCHET",
  "WEAPON_COMBATPDW",
  "WEAPON_KNUCKLE",
  "WEAPON_MARKSMANPISTOL",
  "WEAPON_BOTTLE",
  "WEAPON_FLAREGUN",
  "WEAPON_FLARE",
  "WEAPON_REVOLVER",
  "WEAPON_SWITCHBLADE",
  "WEAPON_MACHETE",
  "WEAPON_FLASHLIGHT",
  "WEAPON_MACHINEPISTOL",
  "WEAPON_DBSHOTGUN",
  "WEAPON_COMPACTRIFLE",
  "GADGET_PARACHUTE"
}
RegisterNetEvent('fsn_main:characterSaving')
AddEventHandler('fsn_main:characterSaving', function()
  ---------------------------------------------------------------------- Weapons
  local weapons = {}
  for i=1, #savingWeapons do
    if HasPedGotWeapon(GetPlayerPed(-1), GetHashKey(savingWeapons[i])) then
      local ammo = GetAmmoInPedWeapon(GetPlayerPed(-1), GetHashKey(savingWeapons[i]))
      weapons[#weapons+1] = {weaponHash = savingWeapons[i], ammo = ammo}
    end
  end
  weapons = json.encode(weapons)
  --------------------------------------------------------------------- Clothing
  local model = json.encode(exports["fsn_clothing"]:GetOutfit())
  local vars = 'unused'
  ------------------------------------------------------------------------------
  TriggerServerEvent('fsn_main:saveCharacter', current_character_id, model, vars, weapons)
end)
-------------------------------------------------------------

NetworkSetFriendlyFireOption(true)
SetCanAttackFriendly(GetPlayerPed(-1), true, true)
------------------------------------------------------------- character changer
local char_changer = {x = -219.72131347656, y = -1054.1688232422, z = 30.14019203186}
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
local midswap = false
local swapstart = 0
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if GetDistanceBetweenCoords(char_changer.x,char_changer.y,char_changer.z,GetEntityCoords(GetPlayerPed(-1)), true) < 10 then
      DrawMarker(1,char_changer.x,char_changer.y,char_changer.z-1,0,0,0,0,0,0,3.001,3.0001,0.4001,0,155,255,175,0,0,0,0)
      if GetDistanceBetweenCoords(char_changer.x,char_changer.y,char_changer.z,GetEntityCoords(GetPlayerPed(-1)), true) < 3 then
        if midswap then
          local rem = swapstart + 30000
          if rem < GetNetworkTime() then
            TriggerEvent('fsn_main:charMenu')
            midswap = false
            swapstart = 0
          else
            drawTxt('PRESS ~g~BACKSPACE~w~ TO CANCEL CHARACTER SWAPPING',4,1,0.5,0.45,0.6,255,255,255,255)
            drawTxt('Changing character in ~b~'..string.sub(tostring(math.ceil(rem-GetNetworkTime())), 1, 2)..'~w~ seconds...',4,1,0.5,0.35,0.6,255,255,255,255)
            drawTxt('~r~DO NOT SWAP CHARACTER IN A ROLEPLAY SITUATION',4,1,0.5,0.25,0.6,255,255,255,255)
            if IsControlJustPressed(0,177) then
              midswap = false
              swapstart = 0
            end
          end
        else
          SetTextComponentFormat("STRING")
          AddTextComponentString("Press ~INPUT_PICKUP~ to ~r~change character")
          DisplayHelpTextFromStringLabel(0, 0, 1, -1)
          if IsControlJustPressed(0,38) then
            midswap = true
            swapstart = GetNetworkTime()
            --TriggerEvent('fsn_notify:displayNotification', 'This feature has been temporarily disabled.', 'centerRight', 4000, 'error')
          end
        end
      end
    end
  end
end)
------------------------------------------------------------- export stuff
function fsn_CharID()
  return current_character.char_id
end
print(" ")
print("::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::")
print(":::::::::::::::::: FSN :: fsn_main loaded ::::::::::::::::::")
print("::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::")
print("::::::::: FSN framework by JamesSc0tt licensed to ::::::::::")
print("::::::::::: ****************** (Fusion Roleplay) :::::::::::")
print("::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::")
print(" ")
