require('helpers/common')

small_biter = data.raw["unit"]["small-biter"]
medium_biter = data.raw["unit"]["medium-biter"]
big_biter = data.raw["unit"]["big-biter"]
behemoth_biter = data.raw["unit"]["behemoth-biter"]

small_biter_scale = 0.3
medium_biter_scale = 0.5
big_biter_scale = 1.0
behemoth_biter_scale = 1.5


small_spitter = data.raw["unit"]["small-spitter"]
medium_spitter = data.raw["unit"]["medium-spitter"]
big_spitter = data.raw["unit"]["big-spitter"]
behemoth_spitter = data.raw["unit"]["behemoth-spitter"]

small_spitter_scale = 0.3
medium_spitter_scale = 0.5
big_spitter_scale = .6
behemoth_spitter_scale = .8

---@param enemy_unit data.UnitPrototype
function update_unit(enemy_unit, scale, filesuffix)
    local filename = "__enemy-reskins__/graphics/units/" .. filesuffix
    if not enemy_unit then return end
    local unit_type = enemy_unit.name:find("biter") and "biter" or (enemy_unit.name:find("spitter") and "spitter" or nil)

    local animation_walk = {
        layers = {
            {
                filename = filename,
                width = 162,
                height = 162,
                frame_count = 1,
                direction_count = 8,
                line_length = 3,
                scale = scale_modifier(scale, unit_type .. "-scale-setting")
            }
        }
    }

    local animation_spin = {
        layers = {
            {
                filename = filename,
                width = 162,
                height = 162,
                frame_count = 8,
                line_length = 3,
                scale = scale_modifier(scale, unit_type .. "-scale-setting")
            }
        }
    }

    enemy_unit.run_animation = animation_walk
    enemy_unit.attack_parameters.animation = animation_spin

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
                scale = scale_modifier(scale, unit_type .. "-scale-setting"),
            }
        }
    }
    corpse.animation = corpse_animation
    corpse.decay_animation = corpse_animation

    -- Fix direction-related data from vanilla corpse
    corpse.direction_shuffle = nil
end

function set_biters()
    local small_biter_skin = settings.startup["small-biter-skin-setting"].value
    local medium_biter_skin = settings.startup["medium-biter-skin-setting"].value
    local big_biter_skin = settings.startup["big-biter-skin-setting"].value
    local behemoth_biter_skin = settings.startup["behemoth-biter-skin-setting"].value

    update_unit(small_biter, small_biter_scale, small_biter_skin .. ".png")
    tint(small_biter, default_small_tint_color, 0.6, true)

    update_unit(medium_biter, medium_biter_scale, medium_biter_skin .. ".png")
    tint(medium_biter, default_medium_tint_color_all_same_troop, true)

    update_unit(big_biter, big_biter_scale, big_biter_skin .. ".png")
    tint(
        big_biter,
        (medium_biter_skin == big_biter_skin)
        and default_big_tint_color
        or default_small_tint_color, true
    )

    update_unit(behemoth_biter, behemoth_biter_scale, behemoth_biter_skin .. ".png")
    tint(behemoth_biter, default_medium_tint_color, true)
end

function set_spitters()
    local small_spitter_skin = settings.startup["small-spitter-skin-setting"].value
    local medium_spitter_skin = settings.startup["medium-spitter-skin-setting"].value
    local big_spitter_skin = settings.startup["big-spitter-skin-setting"].value
    local behemoth_spitter_skin = settings.startup["behemoth-spitter-skin-setting"].value

    update_unit(small_spitter, small_spitter_scale, small_spitter_skin .. ".png")
    tint(small_spitter, default_small_tint_color, 0.6, true)

    update_unit(medium_spitter, medium_spitter_scale, medium_spitter_skin .. ".png")
    tint(medium_spitter, default_medium_tint_color_all_same_troop, true)

    update_unit(big_spitter, big_spitter_scale, big_spitter_skin .. ".png")
    tint(
        big_spitter,
        (medium_spitter_skin == big_spitter_skin)
        and default_big_tint_color
        or default_small_tint_color, true
    )

    update_unit(behemoth_spitter, behemoth_spitter_scale, behemoth_spitter_skin .. ".png")
    tint(behemoth_spitter, default_medium_tint_color, true)
end
