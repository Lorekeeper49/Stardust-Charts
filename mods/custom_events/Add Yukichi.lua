function onCreate()
    makeAnimatedLuaSprite('yukichi', 'characters/Yukichi', -100, -1050);
    --add animations
    addAnimationByPrefix('yukichi', 'idle', 'pierogii idle', 24, false);
    addAnimationByPrefix('yukichi', 'singLEFT', 'pierogii left', 24, false);
    addAnimationByPrefix('yukichi', 'singDOWN', 'pierogii down', 24, false);
    addAnimationByPrefix('yukichi', 'singUP', 'pierogii up', 24, false);
    addAnimationByPrefix('yukichi', 'singRIGHT', 'pierogii right', 24, false);
    --play idle but not the rest
    objectPlayAnimation('yukichi', 'idle', true);
end
function onEvent(name, value1, value2)
    if name == 'Add Yukichi' then
        addLuaSprite('yukichi', false);
        doTweenY('move0', 'yukichi', -150, 0.2, 'sineOut');
    end
end
function onBeatHit()
    if curBeat%2 == 0 then
        objectPlayAnimation('yukichi', 'idle', true);
    end
end