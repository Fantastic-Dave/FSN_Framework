local mysql = false

function init()
  MySQL.Async.fetchAll('SELECT * FROM `fsn_properties`', {}, function(res)
    for k, prop in pairs(res) do
      for k, _prop in pairs(enterable_properties) do
        if _prop.db_id == prop.property_id then
          _prop.owner = prop.property_owner
          _prop.expiry = prop.property_expiry

          local remaining = prop.property_expiry - os.time()
          local remaining_days = math.ceil(remaining / 86399)
          if remaining_days < 0 then
            _prop.owner = -1
            _prop.expiry = 0
            print(':fsn_properties: '.._prop.title..' RENT RAN OUT, RESETTING TO UNSOLD')
          end
          ----
          if prop.property_coowners ~= '' then
            _prop.coowners = json.decode(prop.property_coowners)
          else
            _prop.coowners = {}
          end
          ----
          if prop.property_inventory ~= '' then
            _prop.inventory = json.decode(prop.property_inventory)
          else
            _prop.inventory = {}
          end
          ----
          if prop.property_weapons ~= '' then
            _prop.weapons = json.decode(prop.property_weapons)
          else
            _prop.weapons = {}
          end
          ----
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
