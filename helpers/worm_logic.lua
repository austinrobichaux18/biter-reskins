require('helpers/common')

worm_skin_setting = settings.startup["worm-skin-setting"].value
small_worm = data.raw["turret"]["small-worm-turret"]
medium_worm = data.raw["turret"]["medium-worm-turret"]
big_worm = data.raw["turret"]["big-worm-turret"]
behemoth_worm = data.raw["turret"]["behemoth-worm-turret"]

---@param worm data.TurretPrototype
local function update_worm(worm, scale, filesuffix)
    local filename = "__enemy-reskins__/graphics/worms/" .. filesuffix
    if not worm then return end

    local anim = {
        layers = {
            {
                filename = filename,
                width = 128,
                height = 128,
                frame_count = 8,
                line_length = 3,
                shift = util.by_pixel(0, 0),
                scale = scale_modifier(scale, "enemy-scale-setting")
            }
        }
    }

    worm.folded_animation = anim
    worm.preparing_animation = anim
    worm.prepared_animation = anim
    worm.folding_animation = anim
    worm.attacking_animation = anim
    worm.energy_glow_animation = anim
    worm.ending_attack_animation = anim
    worm.starting_attack_animation = anim
    worm.attack_parameters.animation = anim
    worm.prepared_alternative_animation = anim

    local corpse = data.raw["corpse"][worm.corpse]
    local corpse_animation = {
        layers = {
            {
                filename = filename:gsub("%.png$", "_corpse.png"),
                width = 128,
                height = 128,
                frame_count = 8,
                line_length = 3,
                direction_count = 1,
                shift = util.by_pixel(0, 0),
                scale = scale_modifier(scale, "enemy-scale-setting") / 2,
                tint = { 1, 1, 1, 0.5 }
            }
        }
    }

    corpse.animation = corpse_animation
    corpse.decay_animation = table.deepcopy(corpse_animation) -- doesn't work without deep copy. Idk why. OK now it doesnt work with or without. shrug
    corpse.direction_shuffle = nil
end


function set_all_worms(worm_skin_setting)
    update_worm(small_worm, 1, worm_skin_setting .. ".png")
    update_worm(medium_worm, 1.2, worm_skin_setting .. ".png")
    update_worm(big_worm, 1.4, worm_skin_setting .. ".png")
    update_worm(behemoth_worm, 2, worm_skin_setting .. ".png")
end
