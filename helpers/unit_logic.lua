require('helpers/common')

spitter_skin_setting = settings.startup["spitter-skin-setting"].value
small_spitter = data.raw["unit"]["small-spitter"]
medium_spitter = data.raw["unit"]["medium-spitter"]
big_spitter = data.raw["unit"]["big-spitter"]
behemoth_spitter = data.raw["unit"]["behemoth-spitter"]

biter_skin_setting = settings.startup["biter-skin-setting"].value
small_biter = data.raw["unit"]["small-biter"]
medium_biter = data.raw["unit"]["medium-biter"]
big_biter = data.raw["unit"]["big-biter"]
behemoth_biter = data.raw["unit"]["behemoth-biter"]

---@param enemy_unit data.UnitPrototype
local function update_unit(enemy_unit, scale, filesuffix)
    local filename = "__enemy-reskins__/graphics/enemies/" .. filesuffix
    if not enemy_unit then return end

    local anim = {
        layers = {
            {
                filename = filename,
                width = 162,
                height = 162,
                frame_count = 8,
                line_length = 3,
                shift = util.by_pixel(0, 0),
                scale = scale_modifier(scale, "enemy-scale-setting")
            }
        }
    }

    enemy_unit.attack_parameters.animation = anim
    enemy_unit.run_animation = anim

    -- IMPORTANT: remove vanilla frame sequencing (it causes out-of-range errors)
    enemy_unit.alternative_attacking_frame_sequence = nil

    local corpse = data.raw["corpse"][enemy_unit.corpse]
    local corpse_animation = {
        layers = {
            {
                --replace the .png part with _corpse.png
                filename = filename:gsub("%.png$", "_corpse.png"),
                width = 128,
                height = 128,
                frame_count = 1,
                direction_count = 4,
                line_length = 2,
                shift = util.by_pixel(0, 0),
                scale = scale_modifier(scale, "enemy-scale-setting")
            }
        }
    }
    corpse.animation = corpse_animation
    corpse.decay_animation = corpse_animation

    -- Fix direction-related data from vanilla corpse
    corpse.direction_shuffle = nil
end


function update_unit_to_goblin_skin(biter, scale)
    update_unit(biter, scale, "goblin.png")
end

function update_unit_to_orc_skin(biter, scale)
    update_unit(biter, scale, "orc.png")
end

function update_unit_to_piggy_skin(biter, scale)
    update_unit(biter, scale, "piggy.png")
end

function update_unit_to_eye_skin(biter, scale)
    update_unit(biter, scale, "eyes.png")
end
