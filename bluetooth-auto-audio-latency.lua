require 'io'
require 'mp'
latency = -0.2 -- change here according to desired latency, in seconds

function is_blutooth_sink_active() 
	default_sink = io.popen("pactl info | grep 'Default Sink' "):read()
	if default_sink:find("blue") then
		return true
	end
end

function mpv_latency(delay)
	mp.set_property("audio-delay", delay)
	mp.osd_message("Blutooth device detected A-V delay: " .. delay .. " s", 2)
end

if is_blutooth_sink_active() then
	mpv_latency(latency)
end
