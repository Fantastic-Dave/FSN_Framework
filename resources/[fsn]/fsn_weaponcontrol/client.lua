---------------------------------------------------------------------
-- WEAPONS
---------------------------------------------------------------------
local weapons = {
	{name = 'WEAPON_KNIFE', 		   	 bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'melee', 		model = 'prop_w_me_knife_01'},
	{name = 'WEAPON_NIGHTSTICK', 	 	 bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'melee', 		model = 'w_me_nightstick'},
	{name = 'WEAPON_HAMMER', 		     bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'melee', 		model = 'prop_tool_hammer'},
	{name = 'WEAPON_BAT', 			     bone = 24818, x = 0.0, y = 0.0, z = 0.0, xRot = 320.0, yRot = 320.0, zRot = 320.0, category = 'melee', 		model = 'w_me_bat'},
	{name = 'WEAPON_GOLFCLUB', 		   bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'melee', 		model = 'w_me_gclub'},
	{name = 'WEAPON_CROWBAR', 		 	 bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'melee', 		model = 'w_me_crowbar'},
	{name = 'WEAPON_BOTTLE', 		     bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'melee', 		model = 'prop_w_me_bottle'},
	{name = 'WEAPON_KNUCKLE', 		 	 bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'melee', 		model = 'prop_w_me_dagger'},
	{name = 'WEAPON_HATCHET', 		 	 bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'melee', 		model = 'w_me_hatchet'},
	{name = 'WEAPON_MACHETE', 		 	 bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'melee', 		model = 'prop_ld_w_me_machette'},
	{name = 'WEAPON_SWITCHBLADE',  	 bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'melee', 		model = 'prop_w_me_dagger'},
	{name = 'WEAPON_FLASHLIGHT', 	 	 bone = 24818, x = 0.0, y = 0.0, z = 0.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'melee', 		model = 'prop_w_me_dagger'},

	{name = 'WEAPON_PISTOL', 		     bone = 51826, x = -0.01, y = 0.10, z = 0.07,  xRot = -115.0, yRot = 0.0,  zRot = 0.0, category = 'handguns', 	model = 'w_pi_pistol'},
	{name = 'WEAPON_COMBATPISTOL', 	 bone = 51826, x = -0.01, y = 0.10, z = 0.07,  xRot = -115.0, yRot = 0.0,  zRot = 0.0, category = 'handguns', 	model = 'w_pi_combatpistol'},
	{name = 'WEAPON_APPISTOL', 			 bone = 51826, x = -0.01, y = 0.10, z = 0.07,  xRot = -115.0, yRot = 0.0,  zRot = 0.0, category = 'handguns', 	model = 'w_pi_appistol'},
	{name = 'WEAPON_PISTOL50', 			 bone = 51826, x = -0.01, y = 0.10, z = 0.07,  xRot = -115.0, yRot = 0.0,  zRot = 0.0, category = 'handguns', 	model = 'w_pi_pistol50'},
	{name = 'WEAPON_VINTAGEPISTOL',	 bone = 51826, x = -0.01, y = 0.10, z = 0.07,  xRot = -115.0, yRot = 0.0,  zRot = 0.0, category = 'handguns', 	model = 'w_pi_vintage_pistol'},
	{name = 'WEAPON_HEAVYPISTOL', 	 bone = 51826, x = -0.01, y = 0.10, z = 0.07,  xRot = -115.0, yRot = 0.0,  zRot = 0.0, category = 'handguns', 	model = 'w_pi_heavypistol'},
	{name = 'WEAPON_SNSPISTOL', 		 bone = 58271, x = -0.01, y = 0.1,  z = -0.07, xRot = -55.0,  yRot = 0.10, zRot = 0.0, category = 'handguns', 	model = 'w_pi_sns_pistol'},
	{name = 'WEAPON_FLAREGUN', 			 bone = 58271, x = -0.01, y = 0.1,  z = -0.07, xRot = -55.0,  yRot = 0.10, zRot = 0.0, category = 'handguns', 	model = 'w_pi_flaregun'},
	{name = 'WEAPON_MARKSMANPISTOL', bone = 58271, x = -0.01, y = 0.1,  z = -0.07, xRot = -55.0,  yRot = 0.10, zRot = 0.0, category = 'handguns', 	model = ''},
	{name = 'WEAPON_REVOLVER', 			 bone = 58271, x = -0.01, y = 0.1,  z = -0.07, xRot = -55.0,  yRot = 0.10, zRot = 0.0, category = 'handguns', 	model = ''},
	{name = 'WEAPON_STUNGUN', 			 bone = 58271, x = -0.01, y = 0.1,  z = -0.07, xRot = -55.0,  yRot = 0.10, zRot = 0.0, category = 'handguns', 	model = 'w_pi_stungun'},

	{name = 'WEAPON_MICROSMG', 			 bone = 24818, x = 0.09, y = -0.15, z = 0.1, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'machine', 	model = 'w_sb_microsmg'},
	{name = 'WEAPON_SMG', 				   bone = 24818, x = 0.09, y = -0.15, z = 0.1, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'machine', 	model = 'w_sb_smg'},
	{name = 'WEAPON_MG', 				     bone = 24818, x = 0.09, y = -0.15, z = 0.1, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'machine', 	model = 'w_mg_mg'},
	{name = 'WEAPON_COMBATMG', 			 bone = 24818, x = 0.09, y = -0.15, z = 0.1, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'machine', 	model = 'w_mg_combatmg'},
	{name = 'WEAPON_GUSENBERG', 		 bone = 24818, x = 0.09, y = -0.15, z = 0.1, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'machine', 	model = 'w_sb_gusenberg'},
	{name = 'WEAPON_COMBATPDW', 		 bone = 24818, x = 0.09, y = -0.15, z = 0.1, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'machine', 	model = ''},
	{name = 'WEAPON_MACHINEPISTOL',  bone = 24818, x = 0.09, y = -0.15, z = 0.1, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'machine', 	model = ''},
	{name = 'WEAPON_ASSAULTSMG', 		 bone = 24818, x = 0.09, y = -0.15, z = 0.1, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'machine', 	model = 'w_sb_assaultsmg'},
	{name = 'WEAPON_MINISMG', 			 bone = 24818, x = 0.09, y = -0.15, z = 0.1, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'machine', 	model = ''},

  {name = 'WEAPON_ASSAULTRIFLE', 		bone = 24818, x = 0.09, y = -0.15, z = 0.1, xRot = 10.0, yRot = 160.0, zRot = 10.0, category = 'assault', 	model = 'w_ar_assaultrifle'},
	{name = 'WEAPON_CARBINERIFLE', 	  bone = 24818, x = 0.09, y = -0.15, z = 0.1, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'assault', 	model = 'w_ar_carbinerifle'},
	{name = 'WEAPON_ADVANCEDRIFLE',   bone = 24818, x = 0.09, y = -0.15, z = 0.1, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'assault', 	model = 'w_ar_advancedrifle'},
	{name = 'WEAPON_SPECIALCARBINE',  bone = 24818, x = 0.09, y = -0.15, z = 0.1, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'assault', 	model = 'w_ar_specialcarbine'},
	{name = 'WEAPON_BULLPUPRIFLE', 	  bone = 24818, x = 0.09, y = -0.15, z = 0.1, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'assault', 	model = 'w_ar_bullpuprifle'},

	{name = 'WEAPON_PUMPSHOTGUN', 	 bone = 24818, x = 0.1, y = -0.15, z = 0.0, xRot = 0.0, yRot = 135.0, zRot = 0.0, category = 'shotgun', 	model = 'w_sg_pumpshotgun'},
	{name = 'WEAPON_SAWNOFFSHOTGUN', bone = 24818, x = 0.1, y = -0.15, z = 0.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'shotgun', 	model = ''},
	{name = 'WEAPON_BULLPUPSHOTGUN', bone = 24818, x = 0.1, y = -0.15, z = 0.0, xRot = 0.0, yRot = 135.0, zRot = 0.0, category = 'shotgun', 	model = 'w_sg_bullpupshotgun'},
	{name = 'WEAPON_ASSAULTSHOTGUN', bone = 24818, x = 0.1, y = -0.15, z = 0.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'shotgun', 	model = 'w_sg_assaultshotgun'},
	{name = 'WEAPON_MUSKET', 			   bone = 24818, x = 0.1, y = -0.15, z = 0.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'shotgun', 	model = 'w_ar_musket'},
	{name = 'WEAPON_HEAVYSHOTGUN', 	 bone = 24818, x = 0.1, y = -0.15, z = 0.0, xRot = 0.0, yRot = 225.0, zRot = 0.0, category = 'shotgun', 	model = 'w_sg_heavyshotgun'},
	{name = 'WEAPON_DBSHOTGUN', 		 bone = 24818, x = 0.1, y = -0.15, z = 0.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'shotgun', 	model = ''},
	{name = 'WEAPON_AUTOSHOTGUN', 	 bone = 24818, x = 0.1, y = 0.15, z = 0.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'shotgun', 	model = ''},

	{name = 'WEAPON_SNIPERRIFLE', 	 bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'sniper', 	model = 'w_sr_sniperrifle'},
	{name = 'WEAPON_HEAVYSNIPER', 	 bone = 24818, x = 0.1, y = -0.15, z = 0.0, xRot = 0.0, yRot = 135.0, zRot = 0.0, category = 'sniper', 	model = 'w_sr_heavysniper'},
	{name = 'WEAPON_MARKSMANRIFLE',  bone = 24818, x = 0.1, y = -0.15, z = 0.0, xRot = 0.0, yRot = 135.0, zRot = 0.0, category = 'sniper', 	model = 'w_sr_marksmanrifle'},

	{name = 'WEAPON_REMOTESNIPER', 	 bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'none', 		model = ''},
	{name = 'WEAPON_STINGER', 			 bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'none', 		model = ''},

	{name = 'WEAPON_GRENADELAUNCHER',bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'heavy', 		model = 'w_lr_grenadelauncher'},
	{name = 'WEAPON_RPG', 				   bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'heavy', 		model = 'w_lr_rpg'},
	{name = 'WEAPON_MINIGUN', 		   bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'heavy', 		model = 'w_mg_minigun'},
	{name = 'WEAPON_FIREWORK', 			 bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'heavy', 		model = 'w_lr_firework'},
	{name = 'WEAPON_RAILGUN', 			 bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'heavy', 		model = 'w_ar_railgun'},
	{name = 'WEAPON_HOMINGLAUNCHER', bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'heavy', 		model = 'w_lr_homing'},
	{name = 'WEAPON_COMPACTLAUNCHER',bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'heavy', 		model = ''},

	{name = 'WEAPON_STICKYBOMB', 		   bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'thrown', 	model = 'prop_bomb_01_s'},
	{name = 'WEAPON_MOLOTOV', 			   bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'thrown', 	model = 'w_ex_molotov'},
	{name = 'WEAPON_FIREEXTINGUISHER', bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'thrown', 	model = 'w_am_fire_exting'},
	{name = 'WEAPON_PETROLCAN', 		bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'thrown', 	model = 'w_am_jerrycan'},
	{name = 'WEAPON_PROXMINE', 			bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'thrown', 	model = ''},
	{name = 'WEAPON_SNOWBALL', 			bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'thrown', 	model = 'w_ex_snowball'},
	{name = 'WEAPON_BALL', 				bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'thrown', 	model = 'w_am_baseball'},
	{name = 'WEAPON_GRENADE', 			bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'thrown', 	model = 'w_ex_grenadefrag'},
	{name = 'WEAPON_SMOKEGRENADE', 		bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'thrown', 	model = 'w_ex_grenadesmoke'},
	{name = 'WEAPON_BZGAS', 			bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'thrown', 	model = 'w_ex_grenadesmoke'},

	{name = 'WEAPON_DIGISCANNER', 		bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'others', 	model = 'w_am_digiscanner'},
	{name = 'WEAPON_DAGGER', 			bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'others', 	model = 'prop_w_me_dagger'},
	{name = 'WEAPON_GARBAGEBAG', 		bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'others', 	model = ''},
	{name = 'WEAPON_HANDCUFFS', 		bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'others', 	model = ''},
	{name = 'WEAPON_BATTLEAXE', 		bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'others', 	model = 'prop_tool_fireaxe'},
	{name = 'WEAPON_PIPEBOMB', 			bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'others', 	model = ''},
	{name = 'WEAPON_POOLCUE', 			bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'others', 	model = 'prop_pool_cue'},
	{name = 'WEAPON_WRENCH', 			bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'others', 	model = 'w_me_hammer'},
	{name = 'GADGET_NIGHTVISION', 		bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'others', 	model = ''},
	{name = 'GADGET_PARACHUTE', 		bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'others', 	model = 'p_parachute_s'}
}
local weapon_models = {}

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(500)
		if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
			for k, v in pairs(weapon_models) do
				DetachEntity(weapon_models[k].obj, true, true)
	      DeleteObject(weapon_models[k].obj)
	      weapon_models[k] = nil
			end
		else
	    for k, wepdetails in pairs(weapons) do
	      if HasPedGotWeapon(GetPlayerPed(-1), GetHashKey(wepdetails.name), false) then
	        if GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey(wepdetails.name) then
	          if weapon_models[wepdetails.name] then
	            DetachEntity(weapon_models[wepdetails.name].obj, true, true)
	            DeleteObject(weapon_models[wepdetails.name].obj)
	            weapon_models[wepdetails.name] = nil
	          end
	        else
	          if not weapon_models[wepdetails.name] then
	            if wepdetails.model ~= '' then
	              local bonePos = GetWorldPositionOfEntityBone(GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), wepdetails.bone))
	              local startLoad = GetNetworkTime()
	              RequestModel(GetHashKey(wepdetails.model))
	              while not HasModelLoaded(GetHashKey(wepdetails.model)) do
	                Wait(0)
	                print(':fsn_weaponcontrol: Loading model for: '..wepdetails.name)
	                if startLoad+500 < GetNetworkTime() then
	                  print(':fsn_weaponcontrol: Loading FAILED for model: '..wepdetails.name)
	                  --TriggerEvent('fsn_notify:displayNotification', ':fsn_weaponcontrol: Loading FAILED for model: '..wepdetails.name, 'centerRight', 3000, 'error')
	                else
	                  Wait(1)
	                end
	              end
	              if HasModelLoaded(GetHashKey(wepdetails.model)) then
	                print(':fsn_weaponcontrol: Adding weapon for: '..wepdetails.name)
	                local object = CreateObject(GetHashKey(wepdetails.model), bonePos.x, bonePos.y, bonePos.z, true, true, true)
	                weapon_models[wepdetails.name] = {}
	                weapon_models[wepdetails.name].obj = object
									SetEntityCollision(object, false, false)
	                AttachEntityToEntity(object, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), wepdetails.bone), wepdetails.x, wepdetails.y, wepdetails.z, wepdetails.xRot, wepdetails.yRot, wepdetails.zRot, false, false, false, false, 2, true)
	              end
	            end
	          end
	        end
	      else
	        if weapon_models[wepdetails.name] then
	          DetachEntity(weapon_models[wepdetails.name].obj, true, true)
	          DeleteObject(weapon_models[wepdetails.name].obj)
	          weapon_models[wepdetails.name] = nil
	        end
	      end
	    end
		end
  end
end)
