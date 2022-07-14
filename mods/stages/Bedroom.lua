local resetHideHud = false
function onCreate()	
	makeLuaSprite('bg', 'b3/halloween/room', -500, -150)
	addLuaSprite('bg', false)
	scaleObject('bg', 1, 1)
	
	makeLuaSprite('filter1', 'b3/halloween/filter1', -500, -20)
	addLuaSprite('filter1', true)
	scaleObject('filter1', 1, 1)

	makeLuaSprite('filter2', 'b3/halloween/filter2', -500, -20)
	addLuaSprite('filter2', true)
	scaleObject('filter2', 1, 1)
	
	makeLuaSprite('window', 'b3/halloween/windowcity', -520, -140)
	addLuaSprite('window', false)
	scaleObject('window', 1, 1)

	makeLuaSprite('bgfilter', 'b3/halloween/filterforbg', -500, -20)
	addLuaSprite('bgfilter', false)
	scaleObject('bgfilter', 1, 1)
end

function onBeatHit() -- calls every beat

end

function onStepHit() -- calls every step

end

function onUpdate() -- calls every frame

end
function onCountdownTick(swagCounter)
	if swagCounter == 0 then
		makeLuaSprite('b33', 'b3/countdown/3', screenWidth / 2 - 159, screenHeight / 2 - 165);
		setObjectCamera('b33','hud');
		doTweenAlpha('b33Alpha', 'b33', 0, crochet / 1000, 'cubeInOut');
		addLuaSprite('b33', true);
	end
	if swagCounter == 1 then
		makeLuaSprite('b3Ready', 'b3/countdown/ready', screenWidth / 2 - 439, screenHeight / 2 - 205);
		setObjectCamera('b3Ready','hud');
		doTweenAlpha('b3ReadyAlpha', 'b3Ready', 0, crochet / 1000, 'cubeInOut');
		setProperty('countdownReady.visible', false);
		addLuaSprite('b3Ready', true);
	end
	if swagCounter == 2 then
		makeLuaSprite('b3Set', 'b3/countdown/set', screenWidth / 2 - 459, screenHeight / 2 - 205);
		setObjectCamera('b3Set','hud');
		doTweenAlpha('b3SetAlpha', 'b3Set', 0, crochet / 1000, 'cubeInOut');
		setProperty('countdownSet.visible', false);
		addLuaSprite('b3Set', true);
	end
	if swagCounter == 3 then
		makeLuaSprite('b3Go', 'b3/countdown/go', screenWidth / 2 - 279, screenHeight / 2 - 215);
		setObjectCamera('b3Go','hud');
		doTweenAlpha('b3GoAlpha', 'b3Go', 0, crochet / 1000, 'cubeInOut');
		setProperty('countdownGo.visible', false);
		addLuaSprite('b3Go', true);
	end
end
