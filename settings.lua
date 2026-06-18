data:extend({
    {
        type = "string-setting",
        name = "biter-skin-setting",
        setting_type = "startup",
        default_value = "goblins-and-orcs",
        allowed_values = {
            "goblins-and-orcs",
            "goblins",
            "orcs",
            "default"
        },
        order = "a"
    }
})
data:extend({
    {
        type = "string-setting",
        name = "spitter-skin-setting",
        setting_type = "startup",
        default_value = "piggy-and-eyes",
        allowed_values = {
            "piggy-and-eyes",
            "piggy",
            "eyes",
            "default"
        },
        order = "a"
    }
})

data:extend({
    {
        type = "string-setting",
        name = "worm-skin-setting",
        setting_type = "startup",
        default_value = "zerg",
        allowed_values = {
            "zerg",
            "default"
        },
        order = "a"
    }
})
data:extend({
    {
        type = "string-setting",
        name = "biter-spawner-skin-setting",
        setting_type = "startup",
        default_value = "horn-tent",
        allowed_values = {
            "horn-tent",
            "grey-tent",
            "default"
        },
        order = "a"
    }
})
data:extend({
    {
        type = "string-setting",
        name = "spitter-spawner-skin-setting",
        setting_type = "startup",
        default_value = "grey-tent",
        allowed_values = {
            "horn-tent",
            "grey-tent",
            "default"
        },
        order = "a"
    }
})
data:extend({
    {
        type = "double-setting",
        name = "enemy-scale-setting",
        setting_type = "startup",
        default_value = 1.0,
        minimum_value = 0.1,
        maximum_value = 10,
        order = "a"
    }
})
data:extend({
    {
        type = "double-setting",
        name = "enemy-spawner-scale-setting",
        setting_type = "startup",
        default_value = 1.0,
        minimum_value = 0.1,
        maximum_value = 10,
        order = "a"
    }
})
