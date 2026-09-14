local mod = {}

mod.postRunFn = function(captureParams : NativeLuaTable, configDict : {{string, string}}, allModParams : {string : {string : integer}} )

	local multipleUnitsToHide: {{string}} = {
		[1] = { 
			"mw_ice_1::/vehicle/train/ice_1/ice1_30jahre_fake.mu",
			"mw_ice_1::/vehicle/train/ice_1/ice1_ch_ch_fake.mu",
			"mw_ice_1::/vehicle/train/ice_1/ice1_ch_ch_klima_fake.mu",
			"mw_ice_1::/vehicle/train/ice_1/ice1_ch_ch_or_dbag_fake.mu",
			"mw_ice_1::/vehicle/train/ice_1/ice1_ch_ch_or_fake.mu",
			"mw_ice_1::/vehicle/train/ice_1/ice1_ch_de_fake.mu",
			"mw_ice_1::/vehicle/train/ice_1/ice1_ch_de_klima_fake.mu",
			"mw_ice_1::/vehicle/train/ice_1/ice1_ch_de_or_dbag_fake.mu",
			"mw_ice_1::/vehicle/train/ice_1/ice1_ch_de_or_fake.mu",
			"mw_ice_1::/vehicle/train/ice_1/ice1_duplo_fake.mu",
			"mw_ice_1::/vehicle/train/ice_1/ice1_fake.mu",
			"mw_ice_1::/vehicle/train/ice_1/ice1_klima_fake.mu",
			"mw_ice_1::/vehicle/train/ice_1/ice1_or_dbag_fake.mu",
			"mw_ice_1::/vehicle/train/ice_1/ice1_or_fake.mu",
			"mw_ice_1::/vehicle/train/ice_1/ice1_vr_fake.mu",
			"mw_ice_1::/vehicle/train/ice_1/ice1r_fake.mu",
			"mw_ice_1::/vehicle/train/ice_1/ice2_fake.mu",
			"mw_ice_1::/vehicle/train/ice_1/ice2_klima_fake.mu",
			"mw_ice_1::/vehicle/train/ice_1/ice2_or_dbag_fake.mu",
			"mw_ice_1::/vehicle/train/ice_1/ice2_vr_fake.mu",
		},
		[2] = { }
	}
	
	local selectedfilter_fake: integer = allModParams[getCurrentModId()].ice_1_fake

	for _, v in ipairs(multipleUnitsToHide[selectedfilter_fake]) do
		api.res.multipleUnitRep.setVisible(api.res.multipleUnitRep.find(v), false)
	end
	

end

return mod