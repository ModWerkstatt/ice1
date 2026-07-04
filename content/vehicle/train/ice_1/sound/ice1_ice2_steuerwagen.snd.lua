function data()

local data = soundsetutil.makeSoundSet()


soundsetutil.addTrackParam01
(data, "br401_402/roll.wav", 25.0,
				{
									{ 0.0, 0.0 }, { 1.0, 1.2 } },
				{
									{ 0.0, 0.9 }, { 0.57, 1.00 }, { 1.0, 1.031 } },
									{"vehicle", "speed01"})
									
soundsetutil.addTrackParam01
(data, "br401_402/schnell.wav", 25.0,
				{
									{ 0.00, 0.00 }, { 0.50, 0.00 }, { 1.00, 0.85 } },
				{
									{ 0.0, 0.85 }, { 0.50, 0.85 }, { 1.00, 1.10 } },
									{"vehicle", "speed01"})									
									
soundsetutil.addTrackBrake(data, "br401_402/bremse.wav", 25.0, 1.0)
soundsetutil.addTrackSqueal(data, "br401_402/kurve.wav", 25.0)

soundsetutil.addEvent(data, "openDoors", { "br401_402/dooropen.wav" }, 5.0)
soundsetutil.addEvent(data, "closeDoors", { "br401_402/doorclose.wav" }, 5.0)
soundsetutil.addEvent(data, "horn", { "br401_402/horn.wav" }, 50.0)

return data

end