image = {}

function image:init( )
	self.imageTable = {}
	self.propTable = {}
end

function image:newTexture(_fileName, _parrentLayer, _name)

	local temp = {
		id = #self.imageTable + 1,
		pathToImage = _fileName,
		image = nil,
		prop = nil,
		layer = _parrentLayer,
		name = _name,
		texture = nil,
	}
	table.insert(self.imageTable, temp)
	
	self.imageTable[#self.imageTable].texture = MOAITexture.new ()

	if self.imageTable[#self.imageTable].texture ~= nil then
		print("TEXTURE ARRAY = OK")
	else
		print("TEXTURE ARRAY = NO NO")
	end
	self.imageTable[#self.imageTable].texture:setFilter ( MOAITexture.GL_LINEAR_MIPMAP_LINEAR )

	self.imageTable[#self.imageTable].texture:load(_fileName)


	local xtex, ytex = self.imageTable[#self.imageTable].texture:getSize()

	self.imageTable[#self.imageTable].image = MOAIGfxQuad2D.new( )
	self.imageTable[#self.imageTable].image:setTexture( self.imageTable[#self.imageTable].texture )
	self.imageTable[#self.imageTable].image:setRect(0, 0, xtex, ytex)


	print("New image created in self.ImageTable with id: "..temp.id.."")
	print("Table now contains: "..#self.imageTable.." images")
end

function image:renderImage(_image, _x, _y)
	
	local imageToRender = nil 
	local imageID = image:returnImageId(_image)



	if imageID > 0 then
		local temp = {
			id = #self.propTable + 1,
			prop = nil,
		}
		table.insert(self.propTable, temp)

		self.propTable[#self.propTable].prop = MOAIProp2D.new()
		self.propTable[#self.propTable].prop:setDeck(self.imageTable[imageID].image)
		core:returnLayerTable( )[self.imageTable[imageID].layer].layer:insertProp( self.propTable[#self.propTable].prop )	
		self.propTable[#self.propTable].prop:setLoc(_x, _y)

		--[[self.imageTable[imageID].prop = MOAIProp2D.new()
		self.imageTable[imageID].prop:setDeck(self.imageTable[imageID].image)

		core:returnLayerTable( )[self.imageTable[imageID].layer].layer:insertProp( self.imageTable[imageID].prop )	
		self.imageTable[imageID].prop:setLoc(_x, _y)--]]
	end
	
end

function image:dropProps( )
	for i,v in ipairs(self.propTable) do
		core:returnLayerTable( )[1].layer:removeProp( v.prop )	
	end
	self.propTable = {}
end

function image:returnImageId(_imageName)
	for i,v in ipairs(self.imageTable) do
		if v.name == _imageName then
			return i
		end
	end	
	return 0
end

function image:dropImage(_image)
	local imageID = image:returnImageId(_image)
	if imageID > 0 then
		print("REMOVING PROP: "..imageID.."")
		core:returnLayerTable( )[1].layer:removeProp( self.imageTable[imageID].prop )		
	end
end

function image:returnNumberOfProps( )
	return #self.propTable
end