function onCreate()
    --create character
    makeAnimatedLuaSprite('kou', 'characters/Kou_assets', -800, 200);
    makeLuaSprite('cute little spaceship', "KOU's ship", -800, 200);
    --add animations
    addAnimationByPrefix('kou', 'idle', 'Kou Idle Pose', 24, true);
    addAnimationByPrefix('kou', 'singLEFT', 'Kou Left Note', 24, false);
    addAnimationByPrefix('kou', 'singDOWN', 'Kou Down Note', 24, false);
    addAnimationByPrefix('kou', 'singUP', 'Kou Up Note', 24, false);
    addAnimationByPrefix('kou', 'singRIGHT', 'Kou Right Note', 24, false);
    addAnimationByPrefix('kou', 'wave', 'HIIII', 24, false)
    objectPlayAnimation('kou', 'idle', true);
    setProperty('kou.offset.x', 0);
	setProperty('kou.offset.y', 0);
end
function onEvent(name, value1, value2)
    if name == 'Add KOU' then
        addLuaSprite('kou', false);
        doTweenX('move0', 'kou', 400, 0.3, 'sineOut');
        doTweenX('move1', 'cute little spaceship', 400, 0.3, 'sineOut');
    end
end
function onTweenCompleted(t,l,ll)
    if t == 'move0' then
        objectPlayAnimation('kou', 'wave', true)
    end
end