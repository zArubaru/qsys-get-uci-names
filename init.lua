-- Github repo: https://github.com/zArubaru/qsys-get-uci-names

local json = require("rapidjson")

local DESIGN_UCIS_PATH = "design/ucis.json"

local GUN = {}

GUN.init_UCI_Names = function()
  local file, err = io.open(DESIGN_UCIS_PATH)

  if file == nil or err ~= nil then
    error(string.format("Get-UCI-Names failed to load %s, with error: %s", DESIGN_UCIS_PATH, err))

    return
  end

  local raw_UCIs = file:read("a")
  local UCIs = json.decode(raw_UCIs).Ucis

  for _, UCI in ipairs(UCIs) do
    Uci.SetVariable(UCI.Name, "UCI_Name", UCI.Name)
  end
end

GUN.fire_with_UCI_Name = function(event_handler)
  local var_UCI_Name = Uci.Variables.UCI_Name

  if (var_UCI_Name.String ~= "") then
    event_handler(var_UCI_Name)
  else
    var_UCI_Name.EventHandler = function(UCI_Name)
      if (UCI_Name.String ~= "") then
        UCI_Name.EventHandler = function() end

        event_handler(UCI_Name)
      end
    end
  end
end

GUN.hook_and_fire_UCI_Name_changes = function(event_handler)
  Uci.Variables.UCI_Name.EventHandler = event_handler

  event_handler(Uci.Variables.UCI_Name)
end

GUN.hook_UCI_Name_changes = function(event_handler)
  Uci.Variables.UCI_Name.EventHandler = event_handler
end

return GUN
