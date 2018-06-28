local mysql = false

function init()
  MySQL.Async.fetchAll('SELECT * FROM `fsn_properties`', {}, function(res)
    for k, prop in pairs(res) do
      for k, _prop in pairs(enterable_properties) do
        if _prop.db_id == prop.property_id then
          _prop.owner = prop.property_owner
          _prop.coowners = json.decode(prop.property_coowners)
          _prop.inventory = json.decode(prop.property_inventory)
          _prop.weapons = json.decode(prop.property_weapons)
          _prop.money = prop.property_money      
          print(':fsn_properties: '.._prop.title..' is now owned by '.._prop.owner)
        end
      end
    end
  end)
end

MySQL.ready(function()
    mysql = true
    init()
end)
