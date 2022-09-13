local cjson = require "cjson"

function println()
	print("\n")
end

function L_encode(t)
	print("L_encode")
	return cjson.encode(t)
end

function L_decode(str)
	print("L_decode("..str..")")
	return cjson.decode(str)
end

function G_sleep(second)
	os.execute("sleep " .. tonumber(second))
end
