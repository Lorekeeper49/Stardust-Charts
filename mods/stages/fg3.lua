function onCreate()
	-- -- background shit
	if lowQuality then
		makeLuaSprite('lowquality', 'allegro/bbc3', -700, -200);
		addLuaSprite('lowquality', false);
	else
		makeLuaSprite('bg', 'allegro/beatCity-3', -700, -200);
		addLuaSprite('bg', false);
	end
end