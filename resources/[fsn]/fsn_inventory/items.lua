picklocking = false
items_table = {
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
    weight = 1,
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
    weight = 0.5,
    desc = 'Eat some jerky then do the jerky.',
    use = function()
      TriggerEvent('fsn_inventory:use:food', 5)
      TriggerEvent('fsn_inventory:item:take', 'cupcake', 1)
    end,
  	price = 1,
    modelhash = -2054442544
  },
  ["microwave_burrito"] = {
    display_name = 'Microwave Burrito',
    weight = 1.5,
    desc = 'Eat some jerky then do the jerky.',
    use = function()
      TriggerEvent('fsn_inventory:use:food', 20)
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
      TriggerEvent('fsn_inventory:use:food', 15)
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
      TriggerEvent('fsn_inventory:use:drink', 15)
      TriggerEvent('fsn_inventory:item:take', 'pepsi_max', 1)
    end,
	price = 6,
  modelhash = -1301244203
  },
  ["water"] = {
    display_name = 'Water',
    weight = 1,
    desc = 'Healthy, I like it.',
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
  ["lockpick"] = {
    display_name = 'Lockpick',
    weight = 1.5,
    desc = 'you dodgy guy',
    use = function()
      if not picklocking then
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
    end,
	  price = 250,
    modelhash = 495450405
  },
  ["handcuffs"] = {
    display_name = 'Handcuffs',
    weight = 3,
    desc = 'you dodgy guy',
    use = 'unavailable',
	  price = 1500,
    modelhash = 1070220657
  },
  ["phone"] = {
    display_name = 'Phone',
    weight = 1,
    desc = 'Use this to repair your vehicle.',
    use = function()
      TriggerEvent('fsn_phone:togglePhone')
    end,
    modelhash = 974883178,
    price = 2500
  },
  ["2g_weed"] = {
    display_name = '2G Weed',
    weight = 2,
    desc = 'asscheeks',
    use = function()
      TriggerEvent('fsn_notify:displayNotification', 'Head to weed crafting to roll a joint', 'centerLeft', 3500, 'error')
    end,
    modelhash = -1964997422,
    price = 0
  },
  ["joint"] = {
    display_name = 'Joint',
    weight = 0.6,
    desc = 'asscheeks',
    use = function()
      TriggerEvent('fsn_notify:displayNotification', 'Sell this joint to locals<br>We\'re working on making these smokable', 'centerLeft', 3500, 'error')
    end,
    modelhash = -1199910959,
    price = 0
  },
  ["acetone"] = {
    display_name = 'Acetone',
    weight = 1.5,
    desc = 'asscheeks',
    use = function()
      TriggerEvent('fsn_notify:displayNotification', 'Head to Meth Crafting to cook this.', 'centerLeft', 3500, 'error')
    end,
    modelhash = -1964997422,
    price = 0
  },
  ["phosphorus"] = {
    display_name = 'Phosphorus',
    weight = 1.5,
    desc = 'asscheeks',
    use = function()
      TriggerEvent('fsn_notify:displayNotification', 'Head to Meth Cooking to cook this.', 'centerLeft', 3500, 'error')
    end,
    modelhash = -1964997422,
    price = 0
  },
  ["meth_rocks"] = {
    display_name = 'Meth Rocks',
    weight = 0.6,
    desc = 'asscheeks',
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
  }
}

--sendtojs = json.encode(items_table)
