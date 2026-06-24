require('helpers/common')

small_worm = data.raw["turret"]["small-worm-turret"]
medium_worm = data.raw["turret"]["medium-worm-turret"]
big_worm = data.raw["turret"]["big-worm-turret"]
behemoth_worm = data.raw["turret"]["behemoth-worm-turret"]

---@param worm data.TurretPrototype
local function update_worm(worm, scale, filesuffix)
    local filename = "__enemy-reskins__/graphics/worms/" .. filesuffix
    if not worm then return end

    local animation = {
        layers = {
            {
                filename = filename,
                width = 128,
                height = 128,
                frame_count = 1, --if frame_count is 8 and direction_count is not listed, they spin.
                direction_count = 8,
                line_length = 3,
                shift = util.by_pixel(0, 0),
                scale = scale_modifier(scale, "worm-scale-setting")
            }
        }
    }

    worm.folded_animation = animation
    worm.preparing_animation = animation
    worm.prepared_animation = animation
    worm.folding_animation = animation
    worm.attacking_animation = animation
    worm.energy_glow_animation = animation
    worm.ending_attack_animation = animation
    worm.starting_attack_animation = animation
    worm.attack_parameters.animation = animation
    worm.prepared_alternative_animation = animation

    -- local corpse = data.raw["corpse"][worm.corpse]
    -- local corpse_animation = {
    --     layers = {
    --         {
    --             filename = filename:gsub("%.png$", "_corpse.png"),
    --             width = 128,
    --             height = 128,
    --             frame_count = 8,
    --             line_length = 3,
    --             direction_count = 1,
    --             shift = util.by_pixel(0, 0),
    --             scale = scale_modifier(scale, "worm-scale-setting") / 2,
    --             tint = { 1, 1, 1, 0.5 }
    --         }
    --     }
    -- }

    -- corpse.animation = corpse_animation
    -- corpse.decay_animation = table.deepcopy(corpse_animation) -- doesn't work without deep copy. Idk why. OK now it doesnt work with or without. shrug
    -- corpse.direction_shuffle = nil
end


function set_all_worms()
    local small_worm_skin = settings.startup["small-worm-skin-setting"].value
    local medium_worm_skin = settings.startup["medium-worm-skin-setting"].value
    local big_worm_skin = settings.startup["big-worm-skin-setting"].value
    local behemoth_worm_skin = settings.startup["behemoth-worm-skin-setting"].value

    update_worm(small_worm, 1, small_worm_skin .. ".png")
    update_worm(medium_worm, 1.2, medium_worm_skin .. ".png")
    update_worm(big_worm, 1.4, big_worm_skin .. ".png")
    update_worm(behemoth_worm, 2, behemoth_worm_skin .. ".png")
end
