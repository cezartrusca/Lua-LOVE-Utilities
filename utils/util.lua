local util = setmetatable({},{__index=util})

function util.fields(t)
	for k,v in pairs(t) do
		print(k)
	end
end

function util.array(t)
	for k,v in ipairs(t) do
		print(k)
	end
end

function util.size(t)
	local size = 0
	for k,v in pairs(t) do
		size = size + 1
	end
	return size
end

function util.isTable(t)
	return type(t) == "table"
end

return util