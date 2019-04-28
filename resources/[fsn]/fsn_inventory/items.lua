picklocking = false
items_table = {
  ["bandage"] = {
    display_name = 'Bandage',
    weight = 0.4,
    desc = 'Use this to repair yourself.',
    use = function()
		  if GetEntityHealth(GetPlayerPed(-1)) < 131 then
			  TriggerEvent('fsn_inventory:item:take', 'bandage', 1)
			  while ( not HasAnimDictLoaded( "oddjobs@assassinate@guard" ) ) do
				  RequestAnimDict( "oddjobs@assassinate@guard" )
				  Citizen.Wait( 5 )
			  end
			  TaskPlayAnim(GetPlayerPed(-1), "oddjobs@assassinate@guard", "unarmed_fold_arms", 8.0, 1.0, 2500, 2, 0, 0, 0, 0 )  
			  Citizen.Wait(1500)
			  SetEntityHealth(GetPlayerPed(-1), GetEntityHealth(GetPlayerPed(-1))+15)
	  else
		TriggerEvent('fsn_notify:displayNotification', 'You don\'t need to use a bandage!<br>Visit an EMS personnel or a hospital to heal more.', 'centerLeft', 3500, 'error')
	  end
    end,
    modelhash = -2140074399,
    price = 500
  },
  ["repair_kit"] = {
    display_name = 'Repair Kit',
    weight = 0.2,
    desc = 'Use this to repair your vehicle.',
    use = function()
      while ( not HasAnimDictLoaded( "mini@safe_cracking" ) ) do
          RequestAnimDict( "mini@safe_cracking" )
          Citizen.Wait( 5 )
      end
      TaskPlayAnim(GetPlayerPed(-1), "mini@safe_cracking", "idle_base", 8.0, 1.0, 2500, 2, 0, 0, 0, 0 )
      TriggerEvent('fsn_vehiclecontrol:damage:repairkit')
    end,
    modelhash = -1674314660,
    price = 250
  },
  ["uncooked_meat"] = {
    display_name = 'Uncooked Meat',
    weight = 2,
    desc = 'Use this to repair your vehicle...not.',
    use = function()
    end,
    modelhash = 611319348
  },
  ["cooked_meat"] = {
    display_name = 'Cooked Meat',
    weight = 0.3,
    desc = 'Yum! Time to sell it on.',
    use = function()
    end,
    modelhash = 1302435108
  },
  ["minced_meat"] = {
    display_name = 'Minced Meat',
    weight = 0.3,
    desc = 'Time to make something meaty.',
    use = function()
    end,
    modelhash = 1302435108
  },
  ["dirty_money"] = {
    display_name = 'Dirty money',
    weight = 0.0,
    desc = 'Launder this.',
    use = 'unavailable',
    modelhash = 290621560
  },
  ["backpack"] = {
    display_name = 'Backpack',
    weight = 3.0,
    desc = 'This lets you hold more',
    use = 'unavailable',
	  price = 1000,
    modelhash = 332394125
  },
  ["beef_jerky"] = {
    display_name = 'Beef Jerky',
    weight = 0.5,
    desc = 'Eat some jerky then do the jerky.',
    use = function()
      TriggerEvent('fsn_inventory:use:food', 15)
      TriggerEvent('fsn_inventory:item:take', 'beef_jerky', 1)
    end,
  	price = 4,
    modelhash = -2054442544
  },
  ["cupcake"] = {
    display_name = 'Cupcake',
    weight = 0.3,
    desc = 'Eat some jerky then do the jerky.',
    use = function()
      TriggerEvent('fsn_inventory:use:food', 5)
      TriggerEvent('fsn_inventory:item:take', 'cupcake', 1)
    end,
  	price = 1,
    modelhash = -2054442544
  },
  ["burger"] = {
    display_name = 'Burger Supreme',
    weight = 1.5,
    desc = 'Aint no Doge in here',
    use = function()
     TriggerEvent('fsn_inventory:use:food', 23)
     TriggerEvent('fsn_inventory:item:take', 'burger', 1)
    end,
    modelhash = -2054442544
  },
  ["microwave_burrito"] = {
    display_name = 'Microwave Burrito',
    weight = 1.5,
    desc = 'Eat some jerky then do the jerky.',
    use = function()
      TriggerEvent('fsn_inventory:use:food', 15)
      TriggerEvent('fsn_inventory:item:take', 'microwave_burrito', 1)
    end,
  	price = 8,
    modelhash = -2054442544
  },
  ["panini"] = {
    display_name = 'Panini',
    weight = 1,
    desc = 'Eat some jerky then do the jerky.',
    use = function()
      TriggerEvent('fsn_inventory:use:food', 13)
      TriggerEvent('fsn_inventory:item:take', 'panini', 1)
    end,
  	price = 6,
    modelhash = -2054442544
  },
  ["pepsi"] = {
    display_name = 'Pepsi',
    weight = 1,
    desc = 'Drink this you fat fuck-.',
    use = function()
      TriggerEvent('fsn_inventory:use:drink', 10)
      TriggerEvent('fsn_inventory:item:take', 'pepsi', 1)
    end,
  	price = 5,
    modelhash = -1301244203
  },
  ["pepsi_max"] = {
    display_name = 'Pepsi Max',
    weight = 1,
    desc = 'Healthy, I like it.',
    use = function()
      TriggerEvent('fsn_inventory:use:drink', 10)
      TriggerEvent('fsn_inventory:item:take', 'pepsi_max', 1)
    end,
	price = 6,
  modelhash = -1301244203
  },
  ["water"] = {
    display_name = 'Water',
    weight = 1,
    desc = 'Bleh, Not so sure!.',
    use = function()
      TriggerEvent('fsn_inventory:use:drink', 20)
      TriggerEvent('fsn_inventory:item:take', 'water', 1)
    end,
	  price = 3,
    modelhash = -1301244203
  },
  ["coffee"] = {
    display_name = 'Coffee',
    weight = 1,
    desc = 'Get that ENERGYYYYYYY',
    use = function()
      TriggerEvent('fsn_inventory:use:drink', 25)
      TriggerEvent('fsn_inventory:item:take', 'coffee', 1)
    end,
	  price = 10,
    modelhash = -1301244203
  },
  ["drill"] = {
    display_name = 'Drill',
    weight = 15,
    desc = 'saw, drill? who knows',
    use = function()
      
    end,
	price = 10,
    modelhash = -617072343
  },
  ["lockpick"] = {
    display_name = 'Lockpick',
    weight = 1.5,
    desc = 'you dodgy guy',
    use = function()
      if not picklocking then
		local lost_safe = {x = 977.23968505859, y = -104.10308074951, z = 74.845184326172}
		if GetDistanceBetweenCoords(lost_safe.x, lost_safe.y, lost_safe.z, GetEntityCoords(GetPlayerPed(-1))) < 2 then
			if exports['fsn_police']:fsn_getCopAmt() >= 3 then
				TriggerEvent('fsn_bankrobbery:LostMC:spawn')
				TriggerEvent('fsn_notify:displayNotification', 'There are not enough police to do this heist.', 'centerLeft', 3500, 'error')
			else
				picklocking = true
				while ( not HasAnimDictLoaded( "mini@safe_cracking" ) ) do
					RequestAnimDict( "mini@safe_cracking" )
					Citizen.Wait( 5 )
				end
				TaskPlayAnim(GetPlayerPed(-1), "mini@safe_cracking", "idle_base", 8.0, 1.0, 12000, 2, 0, 0, 1, 1 )
				Citizen.Wait( 12000 )
				if math.random(1,100) > 50 then
					TriggerEvent('fsn_bankrobbery:LostMC:spawn')
				end
				if math.random(1,100) > 80 then
					TriggerEvent('fsn_notify:displayNotification', 'You got into the LostMC safe...', 'centerLeft', 6000, 'success')
					if math.random(1,100) > 50 then
						TriggerEvent('fsn_inventory:item:add', 'modified_drillbit', 1)
					end
					TriggerEvent('fsn_inventory:item:add', 'dirty_money', math.random(450,4000))
					if math.random(1, 100) > 50 then TriggerEvent('fsn_inventory:item:add', 'lockpick', math.random(1,5)) end
					if math.random(1, 100) > 50 then TriggerEvent('fsn_inventory:item:add', 'zipties', math.random(1,3)) end
					if math.random(1, 100) > 50 then TriggerEvent('fsn_inventory:item:add', 'joint', math.random(1,10)) end
					if math.random(1, 100) > 50 then TriggerEvent('fsn_inventory:item:add', 'joint', math.random(1,10)) end
					if math.random(1, 100) > 50 then TriggerEvent('fsn_inventory:item:add', 'packaged_cocaine', math.random(1,20)) end
					TriggerEvent('fsn_bankrobbery:LostMC:spawn')
				else
					TriggerEvent('fsn_notify:displayNotification', 'You broke your lockpick...', 'centerLeft', 3500, 'error')
					TriggerEvent('fsn_inventory:item:take', 'lockpick', 1)
				end
			end
			picklocking = false
		else
			picklocking = true
			FreezeEntityPosition(GetPlayerPed(-1), true)
			while ( not HasAnimDictLoaded( "mini@safe_cracking" ) ) do
				RequestAnimDict( "mini@safe_cracking" )
				Citizen.Wait( 5 )
			end
			TaskPlayAnim(GetPlayerPed(-1), "mini@safe_cracking", "idle_base", 8.0, 1.0, 6000, 2, 0, 0, 1, 1 )
			TriggerEvent('fsn_vehiclecontrol:lockpick')
			Citizen.Wait(6000)
			FreezeEntityPosition(GetPlayerPed(-1), false)
			picklocking = false
		end
      end
    end,
	  price = 250,
    modelhash = 495450405
  },
  ["modified_drillbit"] = {
    display_name = 'Modified Drillbit',
    weight = 10,
    desc = 'you dodgy guy',
    use = 'unavailable',
	price = 0,
    modelhash = 1070220657
  },
  ["zipties"] = {
    display_name = 'Zip Ties',
    weight = 3,
    desc = 'you dodgy guy',
    use = 'unavailable',
	price = 1500,
    modelhash = 1070220657
  },
  ["handcuffs"] = {
    display_name = 'DEAD_ITEM',
    weight = 0,
    desc = 'item has been removed',
	price = 1500,
	use = function()
	
	end
  },
  ["phone"] = {
    display_name = 'Phone',
    weight = 1,
    desc = 'Talkie walky....noice!',
    use = function()
      TriggerEvent('fsn_phone:togglePhone')
    end,
    modelhash = 974883178,
    price = 1000
  },
  ["2g_weed"] = {
    display_name = '2G Weed',
    weight = 2,
    desc = '2g of weed for you.',
    use = function()
      TriggerEvent('fsn_notify:displayNotification', 'Head to weed crafting to roll a joint', 'centerLeft', 3500, 'error')
    end,
    modelhash = -1964997422,
    price = 0
  },
  ["joint"] = {
    display_name = 'Joint',
    weight = 0.6,
    desc = 'Lets sell this Joint!?',
    use = function()
      TriggerEvent('fsn_notify:displayNotification', 'Sell this joint to locals<br>We\'re working on making these smokable', 'centerLeft', 3500, 'error')
    end,
    modelhash = -1199910959,
    price = 0
  },
  ["acetone"] = {
    display_name = 'Acetone',
    weight = 1.5,
    desc = 'Need to make this into something.',
    use = function()
      TriggerEvent('fsn_notify:displayNotification', 'Head to Meth Crafting to cook this.', 'centerLeft', 3500, 'error')
    end,
    modelhash = -1964997422,
    price = 0
  },
  ["phosphorus"] = {
    display_name = 'Phosphorus',
    weight = 1.5,
    desc = 'Lets go Meth cooking',
    use = function()
      TriggerEvent('fsn_notify:displayNotification', 'Head to Meth Cooking to cook this.', 'centerLeft', 3500, 'error')
    end,
    modelhash = -1964997422,
    price = 0
  },
  ["meth_rocks"] = {
    display_name = 'Meth Rocks',
    weight = 0.6,
    desc = 'This Meth Rocks - Sell Sell!',
    use = function()
      TriggerEvent('fsn_notify:displayNotification', 'Sell this meth to locals<br>We\'re working on making these takeable', 'centerLeft', 3500, 'error')
    end,
    price = 0,
    hashmodel = 285917444
  },
  ["packaged_cocaine"] = {
    display_name = 'Packaged Cocaine',
    weight = 0.3,
    desc = 'sell this to locals',
    use = function()

    end,
  },
  ["binoculars"] = {
    display_name = 'Binoculars',
    weight = 3,
    desc = 'Look closely.',
    use = function()
		TriggerEvent('binoculars:Activate')
    end,
    modelhash = -736560690,
    price = 250
  },
  ["frozen_fries"] = {
    display_name = 'Frozen Fries',
    weight = 1,
    desc = 'you dodgy guy',
    use = function()
      
    end,
  },
  ["fries"] = {
    display_name = 'Fries',
    weight = 1,
    desc = 'you dodgy guy',
    use = function()
      TriggerEvent('fsn_inventory:use:food', 50)
      TriggerEvent('fsn_inventory:item:take', 'fries', 1)
    end,
  },
  ["frozen_patty"] = {
    display_name = 'Frozen Patty',
    weight = 1,
    desc = 'you dodgy guy',
    use = function()
      
    end,
  },
  ["cooked_patty"] = {
    display_name = 'Cooked Patty',
    weight = 1,
    desc = 'you dodgy guy',
    use = function()
      
    end,
  },
  ["burger_bun"] = {
    display_name = 'Burger Bun',
    weight = 1,
    desc = 'you dodgy guy',
    use = function()
      
    end,
  },
  ["burger"] = {
    display_name = 'Burger',
    weight = 1,
    desc = 'you dodgy guy',
    use = function()
      TriggerEvent('fsn_inventory:use:food', 50)
      TriggerEvent('fsn_inventory:item:take', 'burger', 1)
    end,
  },
  ["ecola_drink"] = {
    display_name = 'eCola',
    weight = 1,
    desc = 'you dodgy guy',
    use = function()
      TriggerEvent('fsn_inventory:use:drink', 50)
      TriggerEvent('fsn_inventory:item:take', 'ecola_drink', 1)
    end,
  },
}

--sendtojs = json.encode(items_table)
