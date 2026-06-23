require('helpers/constants')

data:extend({
    {
        type = "bool-setting",
        name = "startup-message-setting",
        setting_type = "runtime-global",
        default_value = true,
        order = "a"
    }
})
data:extend({
    {
        type = "string-setting",
        name = "biter-skin-setting",
        setting_type = "startup",
        default_value = unit_default_skin_biter,
        allowed_values = unit_skins,
        order = "a"
    }
})
data:extend({
    {
        type = "string-setting",
        name = "spitter-skin-setting",
        setting_type = "startup",
        default_value = unit_default_skin_spitter,
        allowed_values = unit_skins,
        order = "a"
    }
})

data:extend({
    {
        type = "string-setting",
        name = "worm-skin-setting",
        setting_type = "startup",
        default_value = worm_default_skin,
        allowed_values = worm_skins,
        order = "a"
    }
})
data:extend({
    {
        type = "string-setting",
        name = "biter-spawner-skin-setting",
        setting_type = "startup",
        default_value = spawner_default_skin_biter,
        allowed_values = spawner_skins,
        order = "a"
    }
})
data:extend({
    {
        type = "string-setting",
        name = "spitter-spawner-skin-setting",
        setting_type = "startup",
        default_value = spawner_default_skin_spitter,
        allowed_values = spawner_skins,
        order = "a"
    }
})
data:extend({
    {
        type = "double-setting",
        name = "biter-scale-setting",
        setting_type = "startup",
        default_value = 1.0,
        minimum_value = 0.1,
        maximum_value = 10,
        order = "a"
    },
    {
        type = "double-setting",
        name = "spitter-scale-setting",
        setting_type = "startup",
        default_value = 1.0,
        minimum_value = 0.1,
        maximum_value = 10,
        order = "b"
    },
    {
        type = "double-setting",
        name = "worm-scale-setting",
        setting_type = "startup",
        default_value = 1.0,
        minimum_value = 0.1,
        maximum_value = 10,
        order = "c"
    },
    {
        type = "double-setting",
        name = "spawner-scale-setting",
        setting_type = "startup",
        default_value = 1.0,
        minimum_value = 0.1,
        maximum_value = 10,
        order = "a"
    }
})