local wpairs;
local heartGen;

function onCreate()
	wpairs = loadstring(getTextFromFile('libs/walking_pairs.lua'))();
	heartGen = loadstring(getTextFromFile('libs/heart_generator.lua'))();

	if (os and os.time) then
		math.randomseed(os.time());
	end
	heartGen:init(-450, 'bg3');
	--bg_sky
	makeAnimatedLuaSprite('sky','dateweek/stage3/sky_heartbass', -60, 0)
	scaleObject('sky', 1, 1)
	setLuaSpriteScrollFactor('sky', 0.1, 0.1);
	addAnimationByPrefix('sky','sky_heartbass','sky_heartbass0', 10, true)
	objectPlayAnimation('sky','sky_heartbass', true)
	addLuaSprite('sky', false)
	
	--background
	makeLuaSprite('bg1','dateweek/stage3/bg_city', -345, -420);
	addLuaSprite('bg1',false);
	scaleObject('bg1', 1, 1);
	setLuaSpriteScrollFactor('bg1', 0.2, 0.2);
	
	makeLuaSprite('bg2','dateweek/stage3/ambulant', -430, -420);
	addLuaSprite('bg2',false);
	scaleObject('bg2', 1, 1);
	setLuaSpriteScrollFactor('bg2', 0.6, 0.6);
	
	--object_roulette
	makeAnimatedLuaSprite('roulette','dateweek/stage3/farris_wheel', -140, -80)
	scaleObject('roulette', 1, 1)
	setLuaSpriteScrollFactor('roulette', 0.6, 0.6);
	addAnimationByPrefix('roulette','farris_wheel','farris_wheel0', 1, true)
	objectPlayAnimation('roulette','farris_wheel', true)
	addLuaSprite('roulette', false)
	
	for i = 0,23 do
		makeLuaSprite('seat_'..i,'dateweek/stage3/farris_seat', 80, 350);
		addLuaSprite('seat_'..i,false);
		scaleObject('seat_'..i, 1, 1);
		setLuaSpriteScrollFactor('seat_'..i, 0.6, 0.6);
	end
	
	wpairs:init(20, 0.8);
	
	makeLuaSprite('bg3','dateweek/stage3/fair_gate', -520, -420);
	addLuaSprite('bg3',false);
	scaleObject('bg3', 1, 1);
	setLuaSpriteScrollFactor('bg3', 0.95, 0.95);
	
	--bg_chairs
	makeLuaSprite('chairs','dateweek/stage3/chairs', 80, 370);
	addLuaSprite('chairs',false);
	scaleObject('chairs', 1, 1);
	setLuaSpriteScrollFactor('chairs', 1 , 1);
	
	--bg_table
	makeLuaSprite('table','dateweek/stage3/table', 223, 508);
	addLuaSprite('table',false);
	scaleObject('table', 1, 1);
	setLuaSpriteScrollFactor('table', 1 , 1);
	
	--lights
	makeLuaSprite('bg4','dateweek/lights', -460, -280);
	addLuaSprite('bg4',false);
	scaleObject('bg4', 1, 1);
	setLuaSpriteScrollFactor('bg4', 1 , 1);

	makeLuaSprite('bg5','dateweek/lighting', -460, -280);
	addLuaSprite('bg5', true);
	setProperty('bg5.alpha', 0.3)
	setBlendMode('bg5', 'add');
	scaleObject('bg5', 1, 1);
	
	--close(true);
end


function onEvent(n, v1, v2)
	--A conditional based on the beat/step would go here, if it didn't crash the engine for some reason.
	if n == 'Alt Idle Animation' then
		heartGen:spawnHeart(math.random(-400, 1280), 0, math.random(200, 250)/100);
	end
end

function onTweenCompleted(tag)
	heartGen:evalTweenEnd(tag);
end

function onUpdate(elapsed)
	setProperty('roulette.angle', getProperty('roulette.angle') + 10 * elapsed);
	local rr = getProperty('roulette.width') / 2 - 3;
	local rx = getProperty('roulette.x') + rr;
	local ry = getProperty('roulette.y') + rr;
	for i = 0,23 do
		local angle = math.rad(getProperty('roulette.angle') + (i * 360 / 24)); --Deg to Rad
		local px = rx + rr * math.cos(angle);
		local py = ry + rr * math.sin(angle);
		setProperty('seat_'..i..'.x', px - 20);
		setProperty('seat_'..i..'.y', py - 10);
	end
end

-- Thank you, @filmor from StackOverflow
function string.startsWith(String, Start)
   return string.sub(String, 1, string.len(Start)) == Start
end