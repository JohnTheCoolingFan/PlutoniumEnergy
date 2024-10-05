log("SchallRadioactiveWaste compat tweaks")

---@diagnostic disable: undefined-global
SchallRadioactiveWaste_add_incineration_recipe('used-up-MOX-fuel', 22.3, 0.9)
SchallRadioactiveWaste_add_incineration_recipe('used-up-breeder-fuel-cell', 45.0, 1.5)
SchallRadioactiveWaste_add_incineration_recipe('plutonium-238', 3, 0.85)
SchallRadioactiveWaste_add_incineration_recipe('plutonium-239', 700, 0.85)

SchallRadioactiveWaste_add_radioactive_effects('plutonium-atomic-rocket', 84, 2.8, 70)

if data.raw['artillery-projectile']['plutonium-atomic-artillery-projectile'] then
    SchallRadioactiveWaste_add_radioactive_effects('plutonium-atomic-artillery-projectile', 84, 2.8, 70)
end
