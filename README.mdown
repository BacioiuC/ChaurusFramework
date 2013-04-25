ChaurusFramework:
================================

I initially started working on this framework in order to mimic Love2D's way of handling drawing and updating of images and sprites. Now that I got accostumed to MOAI I decided to change the goal for Chaurus. I'm using it as a base framework in order to prototype games during jams (ludumdare, f*ck this jam, BlazeJam?, etc). 

<dl>
<dt>A quick overview:</dt>
<dd>In order to load and display a new image:</dd>
</dl>

<pre>
myImage_Texture = image:newTexture("path/to/texture.png",Layer,"STRING IDENTIFIER")
myImage = image:newImage(MyImageTexture, posX, posY)
</pre>

image:newTexture returns the id of the image file. That ID is then used to create a new prop (sprite) when called by image:newImage. In order to update an image position during the Main Loop, just call image:updateImage(myImage, posX, posY).

Image functions:
* image:setVisible(myImage, bool)
* image:setScale(myImage, scaleOnX, scaleOnY) `-- 1 is the default scale`
* image:removeProp(myImage) `-- removes the image from the layer`
* image:returnImageId("STRING IDENTIFIER") `-- returns the ID of the Texture based on the String Identifier used when first creating it `
* image:textureGetSize(myImage) `-- returns the Width and Height of the Texture.`

