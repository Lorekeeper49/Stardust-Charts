function onCreate()
    makeAnimatedLuaSprite('void','characters/void_assets', -2000, 0);
    --add animations
    addAnimationByPrefix('void', 'idle', 'Void Idle', 24, false);
	addAnimationByPrefix('void', 'singLEFT', 'Void Left Note Chill', 24, false);
    addAnimationByPrefix('void', 'singDOWN', 'Void Down Note Chill', 24, false);
    addAnimationByPrefix('void', 'singUP', 'Void Up Note Chill', 24, false);
    addAnimationByPrefix('void', 'singRIGHT', 'Void Right Note Chill', 24, false);
    addAnimationByPrefix('void', 'singLEFT-alt', 'Void Left Note Hype', 24, false);
    addAnimationByPrefix('void', 'singDOWN-alt', 'Void Down Note Hype', 24, false);
    addAnimationByPrefix('void', 'singUP-alt', 'Void Up Note Hype', 24, false);
    addAnimationByPrefix('void', 'singRIGHT-alt', 'Void Right Note Hype', 24, false);
    
end
function onEvent(name, value1, value2)
    if name == 'Add Void' then
        addLuaSprite('void', false);
        doTweenX('move0', 'void', -700, 0.4, 'sineOut');
    end
end
function onBeatHit()
    if curBeat%2 == 0 then
        objectPlayAnimation('void', 'idle', true);
    end
end