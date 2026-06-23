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
    -- =====================
    -- Biters
    -- =====================
    {
        type = "string-setting",
        name = "small-biter-skin-setting",
        setting_type = "startup",
        default_value = biter_default_skin_small_biter,
        allowed_values = unit_skins,
        order = "a[biters]-01"
    },
    {
        type = "string-setting",
        name = "medium-biter-skin-setting",
        setting_type = "startup",
        default_value = biter_default_skin_medium_biter,
        allowed_values = unit_skins,
        order = "a[biters]-02"
    },
    {
        type = "string-setting",
        name = "big-biter-skin-setting",
        setting_type = "startup",
        default_value = biter_default_skin_big_biter,
        allowed_values = unit_skins,
        order = "a[biters]-03"
    },
    {
        type = "string-setting",
        name = "behemoth-biter-skin-setting",
        setting_type = "startup",
        default_value = biter_default_skin_behemoth_biter,
        allowed_values = unit_skins,
        order = "a[biters]-04"
    },

    -- =====================
    -- Spitters
    -- =====================
    {
        type = "string-setting",
        name = "small-spitter-skin-setting",
        setting_type = "startup",
        default_value = spitter_default_skin_small_spitter,
        allowed_values = unit_skins,
        order = "b[spitters]-01"
    },
    {
        type = "string-setting",
        name = "medium-spitter-skin-setting",
        setting_type = "startup",
        default_value = spitter_default_skin_medium_spitter,
        allowed_values = unit_skins,
        order = "b[spitters]-02"
    },
    {
        type = "string-setting",
        name = "big-spitter-skin-setting",
        setting_type = "startup",
        default_value = spitter_default_skin_big_spitter,
        allowed_values = unit_skins,
        order = "b[spitters]-03"
    },
    {
        type = "string-setting",
        name = "behemoth-spitter-skin-setting",
        setting_type = "startup",
        default_value = spitter_default_skin_behemoth_spitter,
        allowed_values = unit_skins,
        order = "b[spitters]-04"
    },
    -- =====================
    -- Worms
    -- =====================
    {
        type = "string-setting",
        name = "small-worm-skin-setting",
        setting_type = "startup",
        default_value = worm_default_skin_small,
        allowed_values = worm_skins,
        order = "c[worm]-01"
    },
    {
        type = "string-setting",
        name = "medium-worm-skin-setting",
        setting_type = "startup",
        default_value = worm_default_skin_medium,
        allowed_values = worm_skins,
        order = "c[worm]-02"
    },
    {
        type = "string-setting",
        name = "big-worm-skin-setting",
        setting_type = "startup",
        default_value = worm_default_skin_big,
        allowed_values = worm_skins,
        order = "c[worm]-03"
    },
    {
        type = "string-setting",
        name = "behemoth-worm-skin-setting",
        setting_type = "startup",
        default_value = worm_default_skin_behemoth,
        allowed_values = worm_skins,
        order = "c[worm]-04"
    },

    -- =====================
    -- Scale Settings
    -- =====================
    {
        type = "double-setting",
        name = "biter-scale-setting",
        setting_type = "startup",
        default_value = 1.0,
        minimum_value = 0.1,
        maximum_value = 10,
        order = "c[scale]-01"
    },
    {
        type = "double-setting",
        name = "spitter-scale-setting",
        setting_type = "startup",
        default_value = 1.0,
        minimum_value = 0.1,
        maximum_value = 10,
        order = "c[scale]-02"
    },
    {
        type = "double-setting",
        name = "worm-scale-setting",
        setting_type = "startup",
        default_value = 1.0,
        minimum_value = 0.1,
        maximum_value = 10,
        order = "c[scale]-03"
    },
    {
        type = "double-setting",
        name = "spawner-scale-setting",
        setting_type = "startup",
        default_value = 1.0,
        minimum_value = 0.1,
        maximum_value = 10,
        order = "c[scale]-04"
    }
})