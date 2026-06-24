require('helpers/common')
require('helpers/unit_logic')
require('helpers/worm_logic')
require('helpers/spawner_logic')

local rampant_fixed = {}

local enemy_tints = {
    -- Vanilla
    -- ["small-biter"]      = {181, 150,  64},
    -- ["medium-biter"]     = {255, 105, 180},
    -- ["big-biter"]        = { 64, 128, 255},
    -- ["behemoth-biter"]   = { 32, 200,  64},

    -- ["small-spitter"]    = {220, 220,  80},
    -- ["medium-spitter"]   = {255, 140, 200},
    -- ["big-spitter"]      = { 80, 150, 255},
    -- ["behemoth-spitter"] = { 80, 255, 120},

    -- Rampant
    ["acid"]         = { 0, 255, 0 },     -- neon green
    ["arachnids"]    = { 120, 60, 20 },   -- brown
    ["electric"]     = { 0, 255, 255 },   -- cyan
    ["energy-thief"] = { 160, 0, 255 },   -- purple
    ["fast"]         = { 255, 255, 255 }, -- white
    ["fire"]         = { 255, 64, 0 },    -- orange-red
    ["inferno"]      = { 255, 0, 0 },     -- bright red
    ["juggernaut"]   = { 96, 96, 96 },    -- dark gray
    ["laser"]        = { 255, 0, 255 },   -- magenta
    ["neutral"]      = { 192, 192, 192 }, -- light gray
    ["nuclear"]      = { 128, 255, 0 },   -- radioactive lime
    ["physical"]     = { 139, 69, 19 },   -- dark brown
    ["poison"]       = { 128, 0, 128 },   -- violet
    ["spawner"]      = { 255, 215, 0 },   -- gold
    ["suicide"]      = { 255, 255, 0 },   -- bright yellow
    ["troll"]        = { 0, 128, 255 },   -- azure
    ["wasp"]         = { 255, 200, 0 },   -- amber
}

local function rgb_to_factorio(r, g, b, a)
    return {
        r / 255,
        g / 255,
        b / 255,
        a or 1
    }
end
local function normalize_tier_for_scaling(tier)
    if type(tier) ~= "number" then
        return nil
    end

    if tier <= 5 then
        return tier
    end

    return 5 + ((tier - 5) * 0.5)
    -- 1 → 1
    -- 5 → 5
    -- 6 → 5.5
    -- 7 → 6
    -- 8 → 6.5
    -- 9 → 7
end


function rampant_fixed.apply_compatability()
    local small_biter_skin = settings.startup["small-biter-skin-setting"].value
    local medium_biter_skin = settings.startup["medium-biter-skin-setting"].value
    local big_biter_skin = settings.startup["big-biter-skin-setting"].value
    local behemoth_biter_skin = settings.startup["behemoth-biter-skin-setting"].value

    local small_spitter_skin = settings.startup["small-spitter-skin-setting"].value
    local medium_spitter_skin = settings.startup["medium-spitter-skin-setting"].value
    local big_spitter_skin = settings.startup["big-spitter-skin-setting"].value
    local behemoth_spitter_skin = settings.startup["behemoth-spitter-skin-setting"].value

    for name, unit in pairs(data.raw["unit"]) do
        if name:find("rampant") then
            local tier = tonumber(name:match("%-t(%d+)%-"))

            if tier then
                if name:find("biter", 1, true) then
                    if tier <= 2 and small_biter_skin ~= "default" then
                        update_unit(unit, small_biter_scale, small_biter_skin .. ".png")
                    elseif tier <= 5 and medium_biter_skin ~= "default" then
                        update_unit(unit, medium_biter_scale, medium_biter_skin .. ".png")
                    elseif tier <= 8 and big_biter_skin ~= "default" then
                        update_unit(unit, big_biter_scale, big_biter_skin .. ".png")
                    elseif behemoth_biter_skin ~= "default" then
                        update_unit(unit, behemoth_biter_scale, behemoth_biter_skin .. ".png")
                    end
                end

                if name:find("spitter", 1, true) then
                    if tier <= 2 and small_spitter_skin ~= "default" then
                        update_unit(unit, small_spitter_scale, small_spitter_skin .. ".png")
                    elseif tier <= 5 and medium_spitter_skin ~= "default" then
                        update_unit(unit, medium_spitter_scale, medium_spitter_skin .. ".png")
                    elseif tier <= 8 and big_spitter_skin ~= "default" then
                        update_unit(unit, big_spitter_scale, big_spitter_skin .. ".png")
                    elseif behemoth_spitter_skin ~= "default" then
                        update_unit(unit, behemoth_spitter_scale, behemoth_spitter_skin .. ".png")
                    end
                end
            end

            for keyword, color in pairs(enemy_tints) do
                if name:find(keyword) then
                    tint(unit, rgb_to_factorio(color[1], color[2], color[3]))
                    break
                end
            end
        end
    end

    local small_worm_skin = settings.startup["small-worm-skin-setting"].value
    local medium_worm_skin = settings.startup["medium-worm-skin-setting"].value
    local big_worm_skin = settings.startup["big-worm-skin-setting"].value
    local behemoth_worm_skin = settings.startup["behemoth-worm-skin-setting"].value

    for name, turret in pairs(data.raw["turret"]) do
        if name:find("rampant") then
            local tier = tonumber(name:match("%-t(%d+)%-"))

            if tier then
                if name:find("worm", 1, true) then
                    if tier <= 2 and small_worm_skin ~= "default" then
                        update_worm(turret, small_worm_scale, small_worm_skin .. ".png")
                    elseif tier <= 5 and medium_worm_skin ~= "default" then
                        update_worm(turret, medium_worm_scale, medium_worm_skin .. ".png")
                    elseif tier <= 8 and big_worm_skin ~= "default" then
                        update_worm(turret, big_worm_scale, big_worm_skin .. ".png")
                    elseif behemoth_worm_skin ~= "default" then
                        update_worm(turret, behemoth_worm_scale, behemoth_worm_skin .. ".png")
                    end
                end
            end

            for keyword, color in pairs(enemy_tints) do
                if name:find(keyword) then
                    tint_turret(turret, rgb_to_factorio(color[1], color[2], color[3]))
                    break
                end
            end
        end
    end

    local biter_spawner_skin_setting = settings.startup["biter-spawner-skin-setting"].value
    local spitter_spawner_skin_setting = settings.startup["spitter-spawner-skin-setting"].value

    for name, spawner in pairs(data.raw["unit-spawner"]) do
        if name:find("rampant") then
            local tier = tonumber(name:match("%-t(%d+)%-"))
            tier = normalize_tier_for_scaling(tier)

            if tier then
                if name:find("biter", 1, true) and biter_spawner_skin_setting ~= "default" then
                    update_spawner(spawner, tier, biter_spawner_skin_setting .. ".png")
                elseif name:find("spitter", 1, true) and spitter_spawner_skin_setting ~= "default" then
                    update_spawner(spawner, tier, spitter_spawner_skin_setting .. ".png")
                end
            end
        end

        for keyword, color in pairs(enemy_tints) do
            if name:find(keyword) then
                tint_spawner(spawner, rgb_to_factorio(color[1], color[2], color[3]))
                break
            end
        end
    end
end

return rampant_fixed
