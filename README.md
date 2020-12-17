# Auto mpv A-V delay on bluetooth device

Lua script which adds desired a-v delay if default audio sink is a bluetooth device.

* **Supports:** Linux

## Setup

Copy `bluetooth-auto-audio-latency.lua` into `~/.config/mpv/scripts/`  

## Customization

Change A-V delay in `bluetooth-auto-audio-latency.lua`. By default it is -200ms.

```
latency = -0.2 -- change here according to desired latency, in seconds
```
