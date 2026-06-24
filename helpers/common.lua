function scale_modifier(scale, setting_name)
    if setting_name:find('nil') then
        return scale
    end
    local scale_setting_multiplier = settings.startup[setting_name].value
    return scale * scale_setting_multiplier
end

default_small_tint_color = { 0.85, 0.7, 0.25, 1 }
default_medium_tint_color = { 0.35, 0.45, 0.65, 1 }
default_big_tint_color = { 0.25, 0.35, 0.80, 1 }
default_medium_tint_color_all_same_troop = { 0.75, 0.30, 0.45, 1 }


function tint_base(color, brightness)
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
    return final_color
end

---@param biter data.UnitPrototype
function tint(biter, color, brightness)
    local final_color = tint_base(color, brightness)

    if not biter or not biter.run_animation then return end
    for _, anim in pairs(biter.run_animation.layers or {}) do
        anim.tint = final_color
        -- anim.tint_as_overlay = true
    end

    if not biter or not biter.attack_parameters.animation then return end
    for _, anim in pairs(biter.attack_parameters.animation.layers or {}) do
        anim.tint = final_color
        anim.tint_as_overlay = true
    end
end

---@param turret data.TurretPrototype
function tint_turret(turret, color, brightness)
    local final_color = tint_base(color, brightness)

    local fields = {
        "folded_animation",
        "preparing_animation",
        "prepared_animation",
        "folding_animation",
        "attacking_animation",
        "energy_glow_animation",
        "ending_attack_animation",
        "starting_attack_animation",
        "prepared_alternative_animation",
    }

    local function tint_animation(anim)
        if not anim or not anim.layers then return end

        for _, layer in pairs(anim.layers) do
            layer.tint = final_color
            layer.tint_as_overlay = true
        end
    end

    for _, field in ipairs(fields) do
        if turret[field] then
            tint_animation(turret[field])
        end
    end

    if turret.attack_parameters and turret.attack_parameters.animation then
        tint_animation(turret.attack_parameters.animation)
    end
end

---@param spawner data.EnemySpawnerPrototype
function tint_spawner(spawner, color, brightness)
    local final_color = tint_base(color, brightness)

    local final_color = tint_base(color, brightness)


    if not spawner or not spawner.graphics_set or not spawner.graphics_set.animations then return end
    for _, anim in pairs(spawner.graphics_set.animations.layers or {}) do
        anim.tint = final_color
        -- anim.tint_as_overlay = true
    end

    -- corpse.animation = corpse_animation
    -- corpse.decay_animation = corpse_animation
end
