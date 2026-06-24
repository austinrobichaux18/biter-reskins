require('helpers/common')
require('helpers/unit_logic')
require('helpers/worm_logic')
require('helpers/spawner_logic')

local armoured_biters = {}

function armoured_biters.apply_compatability()
    local armoured_biter_skin = settings.startup["armoured-biter-skin-setting"].value
    local armoured_spawner_skin = settings.startup["armoured-spawner-skin-setting"].value

    for name, unit in pairs(data.raw["unit"]) do
        if name:find("armoured") then
            if name:find("biter") and armoured_biter_skin ~= "default" then
                update_unit(unit, small_biter_scale, armoured_biter_skin .. ".png")
            end
        end
    end

    if armoured_spawner_skin ~= "default" then
        for name, spawner in pairs(data.raw["unit-spawner"]) do
            if name:find("armoured") then
                update_spawner(spawner, 3, armoured_spawner_skin .. ".png")
            end
        end
    end
end

return armoured_biters
