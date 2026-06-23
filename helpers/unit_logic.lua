require('helpers/common')

small_spitter = data.raw["unit"]["small-spitter"]
medium_spitter = data.raw["unit"]["medium-spitter"]
big_spitter = data.raw["unit"]["big-spitter"]
behemoth_spitter = data.raw["unit"]["behemoth-spitter"]

small_biter = data.raw["unit"]["small-biter"]
medium_biter = data.raw["unit"]["medium-biter"]
big_biter = data.raw["unit"]["big-biter"]
behemoth_biter = data.raw["unit"]["behemoth-biter"]

---@param enemy_unit data.UnitPrototype
local function update_unit(enemy_unit, scale, filesuffix)
    local filename = "__enemy-reskins__/graphics/units/" .. filesuffix
    if not enemy_unit then return end
    local unit_type = enemy_unit.name:find("biter") and "biter" or (enemy_unit.name:find("spitter") and "spitter" or nil)

    local anim = {
        layers = {
            {
                filename = filename,
                width = 162,
                height = 162,
                frame_count = 8,
                line_length = 3,
                shift = util.by_pixel(0, 0),
                scale = scale_modifier(scale, unit_type .. "-scale-setting")
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
                scale = scale_modifier(scale, unit_type .. "-scale-setting")
            }
        }
    }
    corpse.animation = corpse_animation
    corpse.decay_animation = corpse_animation

    -- Fix direction-related data from vanilla corpse
    corpse.direction_shuffle = nil
end


function set_all_biters(biter_skin_setting)
    set_low_tier_biters(biter_skin_setting)
    set_high_tier_biters(biter_skin_setting)
end

function set_low_tier_biters(biter_skin_setting)
    update_unit(small_biter, 0.3, biter_skin_setting .. ".png")
    tint(small_biter, default_small_tint_color, .6)

    update_unit(medium_biter, 0.5, biter_skin_setting .. ".png")
    tint(medium_biter, default_medium_tint_color_all_same_troop)
end

function set_high_tier_biters(biter_skin_setting, use_lower_tier_color)
    use_lower_tier_color = use_lower_tier_color or false

    update_unit(big_biter, 1, biter_skin_setting .. ".png")
    tint(big_biter, use_lower_tier_color and default_small_tint_color or default_big_tint_color)

    update_unit(behemoth_biter, 1.5, biter_skin_setting .. ".png")
    tint(behemoth_biter, default_medium_tint_color)
end

function set_all_spitters(spitter_skin_setting)
    set_low_tier_spitters(spitter_skin_setting)
    set_low_tier_spitters(spitter_skin_setting)
end

function set_low_tier_spitters(spitter_skin_setting)
    update_unit(small_spitter, 0.3, spitter_skin_setting .. ".png")
    tint(small_spitter, default_small_tint_color, .6)

    update_unit(medium_spitter, 0.5, spitter_skin_setting .. ".png")
    tint(medium_spitter, default_medium_tint_color_all_same_troop)
end

function set_high_tier_spitters(spitter_skin_setting, use_lower_tier_color)
    use_lower_tier_color = use_lower_tier_color or false

    update_unit(big_spitter, .6, spitter_skin_setting .. ".png")
    tint(big_spitter, use_lower_tier_color and default_small_tint_color or default_big_tint_color)

    update_unit(behemoth_spitter, .8, spitter_skin_setting .. ".png")
    tint(behemoth_spitter, default_medium_tint_color)
end
