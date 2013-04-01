resX = 1024
resY = 480


    texture = MOAITexture.new ()

	if texture ~= nil then
		print("TEXTURE ARRAY = OK")
	else
		print("TEXTURE ARRAY = NO NO")
	end
	--texture:setFilter ( MOAITexture.GL_LINEAR_MIPMAP_LINEAR )

	if texture:load("water.png") then
		print("LOADING IS OK")
	else
		print("NOPE, NOPE, NOPE.jpeg")
	end

	local xtex, ytex = texture:getSize()






