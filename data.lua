require('helpers/common')
require('helpers/spawner_logic')
require('helpers/worm_logic')
require('helpers/unit_logic')


biter_spawner_skin_setting = settings.startup["biter-spawner-skin-setting"].value
update_spawner(biter_spawner, 3, biter_spawner_skin_setting .. ".png")


spitter_spawner_skin_setting = settings.startup["spitter-spawner-skin-setting"].value
update_spawner(spitter_spawner, 3, spitter_spawner_skin_setting .. ".png")


worm_skin_setting = settings.startup["worm-skin-setting"].value
set_all_worms(worm_skin_setting)

set_biters()
set_spitters()



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
