function onCreate()
    makeLuaSprite('2', 'expurgation/bg', 0, 0)
    scaleObject('2', 1.8, 1.8)
    addLuaSprite('2', false)
    makeLuaSprite('wall', 'expurgation/Energywall', 3500, 0)
    scaleObject('wall', 1.8, 1.8)
    addLuaSprite('wall', false)
    makeLuaSprite('1', 'expurgation/daBackground', 0, 0)
    scaleObject('1', 1.8, 1.8)
    addLuaSprite('1', false)
    makeAnimatedLuaSprite('clone0', 'expurgation/clone', 1800, 1000)
    scaleObject('clone0', 1.2, 1.2)
    addAnimationByPrefix('clone0', 'show', 'Clone1', 24, false)
    addLuaSprite('clone0', false)
    makeAnimatedLuaSprite('clone1', 'expurgation/clone', 1250, 1000)
    scaleObject('clone1', 1.2, 1.2)
    addAnimationByPrefix('clone1', 'show', 'Clone1', 24, false)
    addLuaSprite('clone1', false)
    makeLuaSprite('cover', 'expurgation/cover', 1250, 1680)
    scaleObject('cover', 1.8, 1.8)
    addLuaSprite('cover', true)
    makeLuaSprite('hole', 'expurgation/Spawnhole_Ground_BACK', 1300, 1700)
    scaleObject('hole', 1.8, 1.8)
    addLuaSprite('hole', false)
    makeLuaSprite('holecover', 'expurgation/Spawnhole_Ground_COVER', 1300, 1700)
    scaleObject('holecover', 1.8, 1.8)
    addLuaSprite('holecover', true)
    makeAnimatedLuaSprite('spikes', 'expurgation/FloorSpikes', 1400, 1100)
    scaleObject('spikes', 1, 1)
    addAnimationByPrefix('spikes', 'up', 'Floor Spikes', 24, false)
    addAnimationByIndices('spikes', 'up-hold', 'Floor Spikes', '2, 3, 4, 5', 24)
    addLuaSprite('spikes', true)
end
function onBeatHit()
    if curBeat%10 == 0 then
        local random = getRandomInt(1, 3)
        if random == 1 then
            objectPlayAnimation('clone0', 'show', true)
        elseif random == 2 then
            objectPlayAnimation('clone1', 'show', true)
        end
    end
end
function opponentNoteHit(i, d, t, l)
    if difficulty == 0 then
        if d == 2 then
            if not l then
                objectPlayAnimation('spikes', 'up', true)
            else
                objectPlayAnimation('spikes', 'up-hold', true)
            end
        end
    end
end
function goodNoteHit(i, d, t, l)
    if difficulty == 1 then
        if d == 2 then
            if not l then
                objectPlayAnimation('spikes', 'up', true)
            else
                objectPlayAnimation('spikes', 'up-hold', true)
            end
        end
    end
end
local allowCountdown = false
function onStartCountdown()
    if not allowCountdown then
        setProperty('inCutscene', true)
        triggerEvent('Change Character', 'dad', 'startex')
        triggerEvent('Play Animation', 'start', 'dad')
        playSound('Trickyspawn', 1)
        runTimer('start', 1)
        runTimer('begin', 1.3)
        allowCountdown = true
        return Function_Stop
    end
    return Function_Continue
end  
function onTimerCompleted(t,l,ll)
    if t == 'start' then
        playSound('TrickyGlitch', 1)
    end
    if t == 'begin' then
        triggerEvent('Change Character', 'dad', 'exTricky')
        startCountdown()
    end
end