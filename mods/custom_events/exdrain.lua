local drain = 0;
local preset0 = 0;
local preset1 = 0;
function onCreate()
    --create character
    makeAnimatedLuaSprite('drainer', 'expurgation/HP GREMLIN', 0, 0);
    --add animations
    addAnimationByPrefix('drainer', 'comeOut', 'start', 24, false);
    addAnimationByPrefix('drainer', 'pull', 'pull', 24, true);
    addAnimationByPrefix('drainer', 'fall', 'fall', 24, false);
    scaleObject('drainer', 0.5, 0.5)
    setObjectCamera('drainer', 'hud');
    setObjectOrder('drainer', 200);
    setProperty('drainer.alpha', 0);
end
function onEvent(name, value1, value2)
    if name == 'exdrain' then
        setProperty('drainer.alpha', 1);
        addLuaSprite('drainer', true);
        objectPlayAnimation('drainer', 'comeOut', true);
        playSound('GremlinWoosh', 1);
        preset0 = value1;
        preset1 = value2;
        runTimer('wait', 1);
    end
end
function onTimerCompleted(t,l,ll)
    if t == 'wait' then
        drain = preset0;
        objectPlayAnimation('drainer', 'pull', true)
        runTimer('drain', preset1);
    end
    if t == 'drain' then
        drain = 0;
        objectPlayAnimation('drainer', 'fall', true);
        runTimer('fell', 0.2);
    end
    if t == 'fell' then
        removeLuaSprite('drainer', false);
    end
end
function onUpdate(e)
    setProperty('health', getProperty('health')-drain*e);
    setProperty('drainer.x', getProperty('iconP1.x')+50) 
    setProperty('drainer.y', getProperty('iconP1.y')-100)
end
function noteMiss(i, t, d, l)
    cancelTimer('drain')
    drain = 0;
    objectPlayAnimation('drainer', 'fall', true);
    runTimer('fell', 0.2);
end