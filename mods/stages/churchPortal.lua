function onCreate()
	makeLuaSprite('floor', 'portalfloor', -350, -632)
	addLuaSprite('floor', false)
	scaleObject('floor', 1.1, 1.1)
	
	makeLuaSprite('bg', 'portalbg', -350, -610)
	addLuaSprite('bg', false)
	setLuaSpriteScrollFactor('floor', 0.9, 0.9)
	scaleObject('bg', 1.1, 1.1)
	
	makeLuaSprite('pillars', 'portalpillars', -450, -780)
	addLuaSprite('pillars', true)
	scaleObject('pillars', 1.2, 1.2)
	
	if not lowQuality then
		makeAnimatedLuaSprite('portal', 'portal', 200, -450)
		addAnimationByPrefix('portal','spin','portalRotationLoop',24,true)
		addLuaSprite('portal',false)
		objectPlayAnimation('portal','spin',false)
	end
end

function onBeatHit() -- calls every beat

end

function onStepHit() -- calls every step

end

function onUpdate() -- calls every frame

end