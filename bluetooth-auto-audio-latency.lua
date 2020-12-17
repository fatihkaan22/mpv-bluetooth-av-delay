require 'io'
require 'mp'
latency = -0.2 -- change here according to desired latency, in seconds
local utils = require("mp.utils")

function mpv_latency(delay)
	mp.set_property("audio-delay", delay)
	mp.osd_message("Blutooth device detected A-V delay: " .. delay .. " s", 2)
end

mp.observe_property("audio-device-list", "native", function(name, val)
		blue_device = false
		current_delay = tonumber(mp.get_property("audio-delay"))
    for index, e in ipairs(val) do
			if e.name:find("blue") then
				blue_device = true
				mpv_latency(latency)
			end
		end
		if not blue_device and current_delay ~= 0 then
			mp.set_property("audio-delay", 0)
			mp.osd_message("A-V delay: " .. 0 .. " s", 2)
		end
end)
