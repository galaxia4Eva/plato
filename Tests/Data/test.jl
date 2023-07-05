#!/usr/bin/env julia -t 4 --project
import KittyTerminalImages: draw_direct
import FileIO: Stream, DataFormat
import ImageIO: load


open("./image.png") do file
	@debug "Opened file"
	let io = Stream{DataFormat{:PNG}}(file)
		@debug "Opened :PNG stream"
		let image = load(io)
			@debug "as an image"
			image |> draw_direct
			println()
			@debug "sent an image to terminal"
		end
	end
end
