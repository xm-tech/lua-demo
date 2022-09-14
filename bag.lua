local bag = {}

local bagmt = {
	put = function(t, item)
		table.insert(t.items, item)
		print("put", item, ",items=", table.concat(t.items, ","))
	end,

	pop = function(t)
		local item = table.remove(t.items)
		print("pop", item, ",items=", table.concat(t.items, ","))
		return item
	end,

	list = function (t)
		local item_list = table.concat(t.items, ",")
		print("items=", item_list)
		return item_list
	end,

	clear = function (t)
		print("clear")
		t.items = {}
	end
}

bagmt['__index'] = bagmt

function bag.new()
	local t = {
		items = {}
	}
	setmetatable(t, bagmt)
	return t
end


local b = bag:new()
b:put("apple")
b:put("pear")
b:put("banana")
b:list()
b:pop()
b:clear()
