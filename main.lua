require "core.core"
require "core.image"
require "Game.game"
require "Game.map"


core:init( )
core:seWindow(640, 480)

--[[ Used for Top-Left corner, normal stuff.
	viewport:setSize ( 480, 320 )
	viewport:setScale ( 480, -320 ) -- use negative Y axis
	viewport:setScale ( -1, 1 ) -- offset projection origin by -1, 1 in OpenGL projection space
]]
core:setViewPort(ViewPort1, 640, 480, 1)
core:setLayer(Layer1, 1)


core:_debugRenderLayer(1)
core:newImage("media/pimp.png",1)
core:removeImage(1)
core:newImage("media/pimp.png",1)
core:draw(1,0,0)




