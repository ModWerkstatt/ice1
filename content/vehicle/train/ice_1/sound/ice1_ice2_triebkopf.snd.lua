local soundeffectsutil = require "soundeffectsutil"

function data()
return {
	tracks = {
		{ name = "vehicle/ICE1_ICE2/ICE1_ICE2_Lueftung.wav", refDist = 20.0 },
		{ name = "vehicle/ICE1_ICE2/ICE1_ICE2_Roll.wav", refDist = 20.5 },
		{ name = "vehicle/ICE1_ICE2/ICE1_ICE2_Schnell.wav", refDist = 19.0 },
		{ name = "vehicle/ICE1_ICE2/ICE1_ICE2_FreqR.wav", refDist = 10.0 }, --Tonleiter
		{ name = "vehicle/ICE1_ICE2/ICE1_ICE2_FreqR.wav", refDist = 10.3 }, --Aufschaltend
		{ name = "vehicle/ICE1_ICE2/ICE1_ICE2_FreqR.wav", refDist = 10.3 }, --Ablaufend
		{ name = "vehicle/train/brakes.wav", refDist = 15.0 }
	},
	events = {
		horn = { names = { "vehicle/ICE1_ICE2/ICE1_ICE2_Horn.wav" }, refDist = 50.0 }
	},

	updateFn = function (input)
		return {	
			tracks = {
				{ 
					gain = soundeffectsutil.sampleCurve({ { 0.0, 0.37 }, { 0.07, 1.095 }, { 1.0, 1.455 } }, input.speed01),
					pitch = soundeffectsutil.sampleCurve({ { 0.0, 1.0 }, { 0.07, 1.80 }, { 1.0, 2.05 } }, input.speed01)
				},
				{ 
					gain = soundeffectsutil.sampleCurve({ { 0.0, 0.0 }, { 1.0, 1.2 } }, input.speed01),
					pitch = soundeffectsutil.sampleCurve({ { 0.0, 0.9 }, { 0.57, 1.00 }, { 1.0, 1.033 } }, input.speed01)
				},
				{ 
					gain = soundeffectsutil.sampleCurve({ { 0.00, 0.00 }, { 0.50, 0.00 }, { 1.00, 1.00 } }, input.speed01),
					pitch = soundeffectsutil.sampleCurve({ { 0.0, 0.85 }, { 0.50, 0.85 }, { 1.00, 1.10 } }, input.speed01)
				},
				{ 
					gain = soundeffectsutil.sampleCurve({ { 0.0000, 0.0 }, { 0.0005, 0.30 }, { 0.0050, 0.37 }, { 0.0100, 1.00 }, { 0.0600, 1.0 }, { 0.0710, 0.0 }, { 1.0000, 0.0 } }, input.speed01),
					pitch = soundeffectsutil.sampleCurve({ 	{ 0.0000, 0.00 },	{ 0.0001, 0.300 }, { 0.0048, 0.300 },  { 0.0050, 0.340 }, { 0.0098, 0.340 },  { 0.0100, 0.380 }, { 0.0148, 0.380 },  { 0.0150, 0.400 }, { 0.0198, 0.400 },
																				{ 0.0200, 0.440 }, { 0.0248, 0.440 },  { 0.0250, 0.490 }, { 0.0298, 0.490 },  { 0.0300, 0.540 }, { 0.0348, 0.540 },  { 0.0350, 0.590 }, { 0.0398, 0.590 }, 
																				{ 0.0400, 0.660 }, { 0.0448, 0.660 },  { 0.0450, 0.740 }, { 0.0498, 0.740 },  { 0.0500, 0.780 }, { 0.0548, 0.780 },  { 0.0550, 0.890 }, { 0.0598, 0.890 }, 
																				{ 0.0600, 1.000 }, { 1.0000, 1.000 } }, input.speed01),
				},
				{ 
					gain = soundeffectsutil.sampleCurve({ { 0.0, 0.0 }, { 0.75, 1.0 }, { 1.0, 1.0 } }, input.power01),
					pitch = soundeffectsutil.sampleCurve({ 	{ 0.0000, 0.00 }, { 0.0649, 0.00 }, { 0.0650, 1.00 }, { 0.1789, 1.02 }, { 0.1791, 0.85 }, { 0.2499, 1.05 }, { 0.2501, 0.40 }, { 1.0000, 1.20 } }, input.speed01),
				},
				{ 
					gain = soundeffectsutil.sampleCurve({ { 0.0, 0.0 }, { 0.75, 1.0 }, { 1.0, 1.0 } }, input.brakeDecel),
					pitch = soundeffectsutil.sampleCurve({ 	{ 0.0000, 0.00 }, { 0.0649, 0.00 }, { 0.0650, 1.00 }, { 0.1789, 1.02 }, { 0.1791, 0.85 }, { 0.2499, 1.05 }, { 0.2501, 0.40 }, { 1.0000, 1.20 } }, input.speed01),
				},
				soundeffectsutil.brake(input.speed, input.brakeDecel, 0.5)
			},
			events = {
				horn = { gain = 1.2, pitch = 1.0 }
			}
		}
	end
}
end