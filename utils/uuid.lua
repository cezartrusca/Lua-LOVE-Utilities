-- 48:0 <-> 57:9
-- 65:A <-> 90:Z
-- 97:a <-> 122:z

math.randomseed(os.time())

--local uuid = setmetatable({list = {}}, {__index = list})
local mt = {
	__len = function(t)
		local len = 0
		for _ in pairs(t.list) do len = len + 1 end
		return len
	end,

	__index = function(t, k)
		return t.list[k]
	end
}

local uuid = setmetatable({list = {}}, mt)

function uuid:new(numChars, struct)
	numChars = numChars or 8
	local uuid = ""

	for c = 1, numChars do
		local i = math.random(48,122)

		while (i > 57 and i < 65) or (i > 90 and i < 97) do
			i = math.random(48,122)
		end

		uuid = uuid .. string.char(i)
	end

	if self.list[uuid] then
		return generateUUID(uuidTable, numChars)
	else
		self.list[uuid] = struct and struct or {}
		return uuid
	end
end

--[[
for i = 1, 10000 do
	uuid:new(8, {x=2,y=4})
end

for k,v in pairs(uuid.list) do print(k,v) end
print("Entries: ".. #uuid)
]]

--[[
	id = uuid:new(8, {x=5})
print(uuid[id].x)
]]

return uuid