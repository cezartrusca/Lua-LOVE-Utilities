function switch(val, cases, default)
	if cases[val] then
		return cases[val]()
	else
		return cases[default]()
	end
end

return switch