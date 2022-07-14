function onCreate()
	makeLuaSprite('floor', 'ruvfloor', -350, -632)
	addLuaSprite('floor', false)
	scaleObject('floor', 1.1, 1.1)
	
	makeLuaSprite('bg', 'ruvbg', -350, -610)
	addLuaSprite('bg', false)
	setLuaSpriteScrollFactor('floor', 0.9, 0.9)
	scaleObject('bg', 1.1, 1.1)
	
	makeLuaSprite('pillars', 'ruvpillars', -450, -780)
	addLuaSprite('pillars', true)
	scaleObject('pillars', 1.2, 1.2)
	
	makeLuaSprite('pillarbroke', 'ruvpillarbroke', -450, -730)
	addLuaSprite('pillarbroke', true)
	scaleObject('pillarbroke', 1.2, 1.2)
end

function onBeatHit() -- calls every beat

end

function onStepHit() -- calls every step

end

function onUpdate() -- calls every frame

end