require('helpers/common')

biter_spawner = data.raw["unit-spawner"]["biter-spawner"]
spitter_spawner = data.raw["unit-spawner"]["spitter-spawner"]

---@param enemy_spawner data.EnemySpawnerPrototype
function update_spawner(enemy_spawner, scale, filesuffix)
    local filename = "__enemy-reskins__/graphics/spawners/" .. filesuffix
    if not enemy_spawner then return end

    local anim = {
        layers = {
            {
                filename = filename,
                width = 64,
                height = 64,
                frame_count = 1,
                line_length = 1,
                shift = util.by_pixel(0, 0),
                scale = scale_modifier(scale, "spawner-scale-setting")
            }
        }
    }
    enemy_spawner.graphics_set.animations = anim

    local corpse = data.raw["corpse"][enemy_spawner.corpse]
    local corpse_animation = {
        layers = {
            {
                --replace the .png part with _corpse.png
                filename = filename:gsub("%.png$", "_corpse.png"),
                width = 64,
                height = 64,
                frame_count = 1,
                line_length = 1,
                shift = util.by_pixel(0, 0),
                scale = scale_modifier(scale, "spawner-scale-setting") / 2,
                tint = { 1, 1, 1, 0.5 }
            },
        }
    }
    corpse.time_before_removed = 3600
    corpse.animation = corpse_animation
    corpse.decay_animation = corpse_animation

    -- Fix direction-related data from vanilla corpse
    corpse.direction_shuffle = nil
end

function set_spawners()
    local biter_spawner_skin_setting = settings.startup["biter-spawner-skin-setting"].value
    update_spawner(biter_spawner, 3, biter_spawner_skin_setting .. ".png")

    local spitter_spawner_skin_setting = settings.startup["spitter-spawner-skin-setting"].value
    update_spawner(spitter_spawner, 3, spitter_spawner_skin_setting .. ".png")
end
