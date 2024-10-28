function love.load()
	local fp = io.open("methods.txt",'w')

	for k,v in pairs(love) do
		if type(v) == "table" then
			fp:write("love."..k.."\n")
			for _k,_v in pairs(v) do
				fp:write("love."..k..".".._k.."\n")
			end
		elseif type(v) == "function" then
			fp:write("love."..k.."\n")
		elseif type(v) == "number" or type(v) == "string" then
			fp:write("love."..k.."\n")
		elseif type(v) == "boolean" then
			fp:write("love."..tostring(k).."\n")
		else
			fp:write("love."..tostring(k).."\n")
		end
		fp:write("\n")
	end

	fp:close()
	love.event.quit()
end
