---@param enemy_unit data.UnitPrototype
local function update_unit(enemy_unit, scale, filesuffix)
    local filename = "__enemy-reskins__/graphics/entity/" .. filesuffix
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
                scale = scale
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
                scale = scale
            }
        }
    }
    corpse.animation = corpse_animation
    corpse.decay_animation = corpse_animation

    -- Fix direction-related data from vanilla corpse
    corpse.direction_shuffle = nil
end


local function update_unit_to_goblin_skin(biter, scale)
    update_unit(biter, scale, "goblin.png")
end

local function update_unit_to_orc_skin(biter, scale)
    update_unit(biter, scale, "orc.png")
end

local function update_unit_to_piggy_skin(biter, scale)
    update_unit(biter, scale, "piggy.png")
end

local function update_unit_to_eye_skin(biter, scale)
    update_unit(biter, scale, "eyes.png")
end

---@param biter data.UnitPrototype
local function tint(biter, color, brightness)
    if not biter or not biter.run_animation then return end

    brightness = brightness or .7

    local r = color[1] * brightness
    local g = color[2] * brightness
    local b = color[3] * brightness
    local a = color[4] or 1

    -- clamp so it doesn't blow out
    r = math.min(r, 1)
    g = math.min(g, 1)
    b = math.min(b, 1)

    local final_color = { r, g, b, a }

    for _, anim in pairs(biter.run_animation.layers or {}) do
        anim.tint = final_color
        anim.tint_as_overlay = true
    end
end

local biter_skin_setting = settings.startup["biter-skin-setting"].value
local small_biter = data.raw["unit"]["small-biter"]
local medium_biter = data.raw["unit"]["medium-biter"]
local big_biter = data.raw["unit"]["big-biter"]
local behemoth_biter = data.raw["unit"]["behemoth-biter"]

if biter_skin_setting == "goblins-and-orcs" then
    update_unit_to_goblin_skin(small_biter, 0.3)
    tint(small_biter, { 0.85, 0.7, 0.25, 1 }, .5)

    update_unit_to_goblin_skin(medium_biter, 0.5)
    tint(medium_biter, { 0.35, 0.45, 0.65, 1 })

    update_unit_to_orc_skin(big_biter, 1)
    tint(big_biter, { 0.85, 0.7, 0.25, 1 }, .5)

    update_unit_to_orc_skin(behemoth_biter, 1)
    tint(behemoth_biter, { 0.35, 0.45, 0.65, 1 })
else
    if biter_skin_setting == "goblins" then
        update_unit_to_goblin_skin(small_biter, 0.3)
        tint(small_biter, { 0.85, 0.7, 0.25, 1 }, .6)

        update_unit_to_goblin_skin(medium_biter, 0.5)
        tint(medium_biter, { 0.75, 0.30, 0.45, 1 })

        update_unit_to_goblin_skin(big_biter, 1)
        tint(big_biter, { 0.25, 0.35, 0.80, 1 })

        update_unit_to_goblin_skin(behemoth_biter, 1.5)
        tint(behemoth_biter, { 0.35, 0.45, 0.65, 1 })
    else
        if biter_skin_setting == "orcs" then
            update_unit_to_orc_skin(small_biter, 0.3)
            tint(small_biter, { 0.85, 0.7, 0.25, 1 }, .6)

            update_unit_to_orc_skin(medium_biter, 0.5)
            tint(medium_biter, { 0.75, 0.30, 0.45, 1 })

            update_unit_to_orc_skin(big_biter, 1)
            tint(big_biter, { 0.85, 0.7, 0.25, 1 }, .5)

            update_unit_to_orc_skin(behemoth_biter, 1)
            tint(behemoth_biter, { 0.35, 0.45, 0.65, 1 })
        end
    end
end

local spitter_skin_setting = settings.startup["spitter-skin-setting"].value
local small_spitter = data.raw["unit"]["small-spitter"]
local medium_spitter = data.raw["unit"]["medium-spitter"]
local big_spitter = data.raw["unit"]["big-spitter"]
local behemoth_spitter = data.raw["unit"]["behemoth-spitter"]

if spitter_skin_setting == "piggy-and-eyes" then
    update_unit_to_piggy_skin(small_spitter, 0.3)
    tint(small_spitter, { 0.85, 0.7, 0.25, 1 }, .6)

    update_unit_to_piggy_skin(medium_spitter, 0.5)
    tint(medium_spitter, { 0.35, 0.45, 0.65, 1 })

    update_unit_to_eye_skin(big_spitter, .6)

    update_unit_to_eye_skin(behemoth_spitter, .8)
    tint(behemoth_spitter, { 0.35, 0.45, 0.65, 1 })
else
    if spitter_skin_setting == "piggy" then
        update_unit_to_piggy_skin(small_spitter, 0.3)
        tint(small_spitter, { 0.85, 0.7, 0.25, 1 }, .6)

        update_unit_to_piggy_skin(medium_spitter, 0.5)
        tint(medium_spitter, { 0.75, 0.30, 0.45, 1 })

        update_unit_to_piggy_skin(big_spitter, .6)
        tint(big_spitter, { 0.25, 0.35, 0.80, 1 })

        update_unit_to_piggy_skin(behemoth_spitter, .8)
        tint(behemoth_spitter, { 0.35, 0.45, 0.65, 1 })
    else
        if spitter_skin_setting == "eyes" then
            update_unit_to_eye_skin(small_spitter, 0.3)
            tint(small_spitter, { 0.85, 0.7, 0.25, 1 }, .6)

            update_unit_to_eye_skin(medium_spitter, 0.5)
            tint(medium_spitter, { 0.75, 0.30, 0.45, 1 })

            update_unit_to_eye_skin(big_spitter, .6)
            tint(big_spitter, { 0.25, 0.35, 0.80, 1 })

            update_unit_to_eye_skin(behemoth_spitter, .8)
            tint(behemoth_spitter, { 0.35, 0.45, 0.65, 1 })
        end
    end
end




--opt a

-- local function evolution_tint(scale)
--     -- scale expected ~0.3 to ~1.5
--     local t = math.min(math.max(scale, 0.3), 1.5)

--     -- normalized factor
--     local f = (t - 0.3) / (1.5 - 0.3)

--     return {
--         0.85 - f * 0.4, -- red decreases slightly
--         0.75 - f * 0.2, -- green decreases slightly
--         0.35 + f * 0.3, -- blue increases slightly
--         1
--     }
-- end

-- -- usage
-- local small_biter = data.raw["unit"]["small-biter"]
-- update_unit(small_biter, 0.3)
-- tint(small_biter, evolution_tint(0.3))

-- local medium_biter = data.raw["unit"]["medium-biter"]
-- update_unit(medium_biter, 0.5)
-- tint(medium_biter, evolution_tint(0.5))

-- local big_biter = data.raw["unit"]["big-biter"]
-- update_unit(big_biter, 1.0)
-- tint(big_biter, evolution_tint(1.0))

-- local behemoth_biter = data.raw["unit"]["behemoth-biter"]
-- update_unit(behemoth_biter, 1.5)
-- tint(behemoth_biter, evolution_tint(1.5))


-- scary
-- local BASE = {0.78, 0.72, 0.40, 1} -- neutral warm base

-- local function shift_tint(base, r, g, b)
--   return {
--     base[1] * r,
--     base[2] * g,
--     base[3] * b,
--     1
--   }
-- end

-- -- usage
-- tint(data.raw["unit"]["small-biter"], shift_tint(BASE, 1.00, 1.00, 0.95)) -- slightly yellow
-- tint(data.raw["unit"]["medium-biter"], shift_tint(BASE, 0.95, 0.85, 0.90)) -- muted red shift
-- tint(data.raw["unit"]["big-biter"], shift_tint(BASE, 0.85, 0.90, 1.00)) -- muted blue shift
-- tint(data.raw["unit"]["behemoth-biter"], shift_tint(BASE, 0.85, 1.00, 0.85)) -- muted green shift



-- ok on default skin but not goblin skin
-- local function tint_with_brightness(color, brightness)
--   -- brightness: 0.6–1.2 typical
--   return {
--     color[1] * brightness,
--     color[2] * brightness,
--     color[3] * brightness,
--     1
--   }
-- end

-- -- softer palette
-- local small = tint_with_brightness({0.85, 0.72, 0.40}, 1.05)
-- local medium = tint_with_brightness({0.65, 0.38, 0.38}, 0.95)
-- local big = tint_with_brightness({0.40, 0.50, 0.70}, 0.90)
-- local behemoth = tint_with_brightness({0.40, 0.65, 0.45}, 0.90)

-- tint(data.raw["unit"]["small-biter"], small)
-- tint(data.raw["unit"]["medium-biter"], medium)
-- tint(data.raw["unit"]["big-biter"], big)
-- tint(data.raw["unit"]["behemoth-biter"], behemoth)




-- local small_biter = data.raw["unit"]["small-biter"]
-- update_unit(small_biter, 0.3)

-- -- medium = muted red (less pink, more earthy)
-- local medium_biter = data.raw["unit"]["medium-biter"]
-- update_unit(medium_biter, 0.5)

-- -- big = muted blue-gray
-- local big_biter = data.raw["unit"]["big-biter"]
-- update_unit(big_biter, 1)

-- -- behemoth = muted green-gray
-- local behemoth_biter = data.raw["unit"]["behemoth-biter"]
-- update_unit(behemoth_biter, 1.5)
