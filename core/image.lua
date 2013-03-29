function core:newImage(_fileName, _parrentLayer)
	local temp = {
		id = #self.imageTable + 1,
		pathToImage = _fileName,
		image = nil,
		prop = nil,
		layer = _parrentLayer,
	}
	table.insert(self.imageTable, temp)
	self.imageTable[#self.imageTable].image = MOAIGfxQuad2D.new( )
	self.imageTable[#self.imageTable].image:setTexture(_fileName)
	self.imageTable[#self.imageTable].image:setRect(0,0,32,32)

	-- all images are assigned to a prop and a layer by default.
	self.imageTable[#self.imageTable].prop = MOAIProp2D.new()
	self.imageTable[#self.imageTable].prop:setDeck(self.imageTable[#self.imageTable].image)
	self.layerTable[self.imageTable[#self.imageTable].layer].layer:insertProp( self.imageTable[#self.imageTable].prop )
	print("New image created in self.ImageTable with id: "..temp.id.."")
	print("Table now contains: "..#self.imageTable.." images")
end

function core:draw(_image, _x, _y)
	if self.imageTable[_image] ~= nil then
		self.imageTable[_image].prop:setLoc(_x,_y)
		print("Image: ".._image.." is being drawn at x: ".._x.." y: ".._y.."")
	else
		print("No image mate... Check again. Image Index in table is: ".._image.."")
	end
end

function core:removeImage(_image)
	self.layerTable[ self.imageTable[_image].layer ].layer:removeProp(self.imageTable[_image].prop)
	table.remove(self.imageTable,_image)
	print("Image id: ".._image.." removed from self.imageTable. Table now contains "..#self.imageTable.." images")
end