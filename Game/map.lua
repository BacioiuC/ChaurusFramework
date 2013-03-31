map = {}
map.data = {}

mapTilesX = resX / 32
mapTilesY = resY / 32

map_offsetX = resX/2
map_offsetY = resY/2

function map:init( )
	self.mapTable = {}
	
end

function map:loadTiles( )
	image:newTexture("water.png",1,"WATER_TEX")
end

function map:generate( )
	for y = 1, mapTilesY do
		map.data[y] = {}
		for x = 1, mapTilesX do
			map.data[y][x] = 1
			image:renderImage("WATER_TEX",map_offsetX-x*32,map_offsetY-y*32)
		end
	end
end
