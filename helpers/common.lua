function scale_modifier(scale, setting_name)
    local scale_setting_multiplier = settings.startup[setting_name].value
    return scale * scale_setting_multiplier
end

default_small_tint_color = { 0.85, 0.7, 0.25, 1 }
default_medium_tint_color = { 0.35, 0.45, 0.65, 1 }
default_big_tint_color = { 0.25, 0.35, 0.80, 1 }
default_medium_tint_color_all_same_troop = { 0.75, 0.30, 0.45, 1 }

---@param biter data.UnitPrototype
function tint(biter, color, brightness)
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

