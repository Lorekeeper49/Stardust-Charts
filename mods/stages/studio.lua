function onCreate()
	-- background shit
	makeLuaSprite('studio_back', 'studio_back', -1053, -521);
	setScrollFactor('studio_back', 1, 1);
	scaleObject('studio_back', 1, 1);
	
	makeLuaSprite('studio_evenfurtherback', 'studio_evenfurtherback', -411, -254);
	setScrollFactor('studio_evenfurtherback', 1, 1);
	
	makeLuaSprite('studio_fx', 'studio_fx', -1095, -589);
	setScrollFactor('studio_fx', 1, 1);
	scaleObject('studio_fx', 1, 1);
	
	makeAnimatedLuaSprite('studio_speaker', 'studio_speaker', 1100, 120);
	addAnimationByPrefix('studio_speaker', 'beat', 'speaker', 24, true);
	objectPlayAnimation('studio_speaker', 'beat', true);
	setProperty('studio_speaker.flipX', true);
	
	makeAnimatedLuaSprite('studio_speaker2', 'studio_speaker', -340, 120);
	addAnimationByPrefix('studio_speaker2', 'beat', 'speaker', 24, true);
	objectPlayAnimation('studio_speaker2', 'beat', true);
	
	addLuaSprite('studio_evenfurtherback', false);
	addLuaSprite('studio_fx', false);
	addLuaSprite('studio_back', false);
	addLuaSprite('studio_speaker', false);
	addLuaSprite('studio_speaker2', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end