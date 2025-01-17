-- Titanium recipe & tech changes
--
local util = require("__bztitanium__.data-util");

if (not mods["bobplates"] and not mods["angelssmelting"]) then
  util.replace_ingredient("power-armor", "steel", "titanium")
  util.add_prerequisite("power-armor", util.titanium_processing)

  -- All equipment that uses steel now uses titanium. Who wants to carry around steel!
  for name, recipe in pairs(data.raw.recipe) do
    if recipe.result ~= nil and recipe.result:find("equipment") then
      util.steel_to_titanium(recipe)
    end
  end
end

-- Generally, steel-based equipment techs require solar panel tech, so only require
-- titanium processing for that.
util.add_prerequisite("solar-panel-equipment", util.titanium_processing)


-- Also add titanium to some nuclear steam-handling stuff
util.add_titanium_ingredient(20, "steam-turbine")
if not mods["pyrawores"] then
  util.add_titanium_ingredient(20, "heat-exchanger")
  util.add_prerequisite("nuclear-power", util.titanium_processing)
end

-- Krastorio 2 changes
if mods["Krastorio2"] then
  util.add_prerequisite("kr-electric-mining-drill-mk2", util.titanium_processing)
  util.add_prerequisite("kr-quarry-minerals-extraction", util.titanium_processing)
end

if mods["Aircraft"] then
  util.add_prerequisite("advanced-aerodynamics", util.titanium_processing)
end
