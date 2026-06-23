local function show_message(event)
    if not settings.global["startup-message-setting"].value then
        return
    end
    game.print(
        "Thanks for using Enemy Reskins. This mod adds MANY choices of skins for enemies that is all configurable in Settings > Mod Settings > Startup > Enemy Reskins. You will need to leave the world and restart to apply the changes. You can also disable this message there (in Map instead of Startup, no restart required). Enjoy :)"
    )
    script.on_event(defines.events.on_player_changed_position, nil)
end

script.on_event(defines.events.on_player_changed_position, show_message)
