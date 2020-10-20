local AddonName, AddOn = ...

local function Vendor_GetAverageItemLevel()
	return select(2, GetAverageItemLevel())
end

local function register_GetAverageItemLevel()
	local AvgItemLevel =
	{
			-- Vendor will check this source is loaded prior to registration.
			-- It will also be displayed in the Vendor UI.
			Source = "fuba",
			Addon = AddonName,
			
			Functions =
        {
            {
                Name="GetAverageItemLevel",
                Function=Vendor_GetAverageItemLevel,
                Help="Return the Average Equiped Item Level.",
            },
        },
	}

	-- Register this extension with Vendor.
	-- For safety, you should make sure both Vendor and the RegisterExtension method exist before
	-- calling, as done below. If not a clean LUA error will be thrown that can be reported back to players.
	assert(Vendor and Vendor.RegisterExtension, "Vendor RegisterExtension not found, cannot register extension: "..tostring(AvgItemLevel.Source))
	if (not Vendor.RegisterExtension(AvgItemLevel)) then
			-- something went wrong
	end
end

register_GetAverageItemLevel()