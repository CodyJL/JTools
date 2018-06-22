
Water = {

}

	for i,v in pairs(Water) do
		local water = createWater (unpack(v))
		local x,y,z = getElementPosition(water)
		setElementPosition(water,x,y,z)
	end
	
	
	
height = 0
SizeVal = 3000
-- Defining variables.
southWest_X = -SizeVal
southWest_Y = -SizeVal
southEast_X = SizeVal
southEast_Y = -SizeVal
northWest_X = -SizeVal
northWest_Y = SizeVal
northEast_X = SizeVal
northEast_Y = SizeVal

water = createWater ( southWest_X, southWest_Y, height, southEast_X, southEast_Y, height, northWest_X, northWest_Y, height, northEast_X, northEast_Y, height )
