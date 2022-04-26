script.on_configuration_changed(function ()
    for _, force in pairs(game.forces) do
        force.reset_technology_effects()
    end
end)
