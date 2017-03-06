local colors = {
	["0"] = "#000000",
	["1"] = "#0000AA",
	["2"] = "#00AA00",
	["3"] = "#00AAAA",
	["4"] = "#AA0000",
	["5"] = "#AA00AA",
	["6"] = "#AA5500",
	["7"] = "#AAAAAA",
	["8"] = "#555555",
	["9"] = "#5555FF",
	["A"] = "#55FF55",
	["B"] = "#55FFFF",
	["C"] = "#FF5555",
	["D"] = "#FF55FF",
	["E"] = "#FFFF55",
	["F"] = "#FFFFFF",
}

local function get_escape(color)
	return minetest.get_color_escape_sequence(colors[string.upper(color)] or "#FFFFFF")
end

local function colorize(text)
	return string.gsub(text,"#([0123456789abcdefABCDEF])",get_escape)
end

minetest.register_on_chat_message(function(name,message)
	minetest.chat_send_all("<"..name.."> "..colorize(message))
	return true
end)

minetest.override_chatcommand("me",{
	func = function(name,param)
		minetest.chat_send_all("* "..name.." "..colorize(param))
	end,
})
