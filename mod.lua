function data()
return {
	info = {
		minorVersion = 2,
		severityAdd = "NONE",
		severityRemove = "WARNING",
		name = _("mod_name"),
		description = _("mod_desc"),
		tags = { "europe", "train", "deutsche bahn", "ice", "high speed" },

        params = {
			{
				key = "ice1fake",
				name = _("Fake"),
				values = { "No", "Yes", },
				tooltip = _("option_fake_ice1_desc"),
				defaultIndex = 0,
			},
		},

		dependencies = { },

        requiredMods = { },

		authors = {
		    {
		        name = "ModWerkstatt",
		        role = "CREATOR",
		    },
            {
		        name = "Skyrames",
		        role = "Sound",
		    },
		},
        url = { "" },
        visible = true,
	},

	runFn = function (settings, modParams)

	    local hidden = {
			["CH-CH_fake.lua"] = true,
			["CH-CH_klima_fake.lua"] = true,
			["CH-CH_or_DBAG_fake.lua"] = true,
			["CH-CH_or_fake.lua"] = true,
			["CH-DE_fake.lua"] = true,
            ["CH-DE_klima_fake.lua"] = true,
			["CH-DE_or_DBAG_fake.lua"] = true,
			["CH-DE_or_fake.lua"] = true,
			["duplo_fake.lua"] = true,
			["fake.lua"] = true,
            ["klima_fake.lua"] = true,
			["or_DBAG_fake.lua"] = true,
			["or_fake.lua"] = true,
            ["klima_fake.lua"] = true,
			["klima_rev_fake.lua"] = true,
			["or_DBAG_fake.lua"] = true,
			["or_DBAG_rev_fake.lua"] = true,
			["rev_fake.lua"] = true,
            ["30Jahre_fake.lua"] = true,
            ["vr_fake.lua"] = true,
            ["vr_ref_fake.lua"] = true,
		}

		local modelFilter = function(fileName, data)
			local modelName = fileName:match('/ice1_([^/]*.lua)') or fileName:match('/ice1R_([^/]*.lua)') or fileName:match('/ice2_([^/]*.lua)')
			return (modelName==nil or hidden[modelName]~=true)
		end

		if modParams[getCurrentModId()] ~= nil then
			local params = modParams[getCurrentModId()]
			if params["ice1fake"] == 0 then
				addFileFilter("multipleUnit", modelFilter)
			end
		else
			addFileFilter("multipleUnit", modelFilter)
		end
	end
	}
end
