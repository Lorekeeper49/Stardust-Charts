
local u = false;
local r = 0;
local i =0
local shot = false;
local agent = 1
local health = 0;
local xx = -650;
local yy = 570;
local xx2 = -150;
local yy2 = 925;
local ofs = 35;
local followchars = true;
local stopMoving = false;
local del = 0;
local del2 = 0;
function onCreate()
    setProperty('defaultCamZoom',0.5)
    makeLuaSprite('bartop','',0,-380)
    makeGraphic('bartop',1280,500,'000000')
    addLuaSprite('bartop',true)
    setObjectCamera('bartop','hud')
    setScrollFactor('bartop',0,0)

    makeLuaSprite('barbot','',0,600)
    makeGraphic('barbot',1280,500,'000000')
    addLuaSprite('barbot',true)
    setScrollFactor('barbot',0,0)
    setObjectCamera('barbot','hud')

    makeLuaSprite('1', 'nightland/BG1', -2400, -1500)
    scaleObject('1', 2, 2)
    addLuaSprite('1', false)
    makeLuaSprite('2', 'nightland/BAC2', -2400, -1500)
    scaleObject('2', 2, 2)
    addLuaSprite('2', false)
    makeLuaSprite('3', 'nightland/ROC3', -2400, -1500)
    scaleObject('3', 2, 2)
    addLuaSprite('3', false)
    makeLuaSprite('4', 'nightland/TREE4', -2400, -1500)
    scaleObject('4', 2, 2)
    addLuaSprite('4', false)
    makeLuaSprite('5', 'nightland/GROUMD5', -2400, -1500)
    scaleObject('5', 2, 2)
    addLuaSprite('5', false)
    makeLuaSprite('6', 'nightland/BLURROC6', -2400, -1500)
    scaleObject('6', 2, 2)
    addLuaSprite('6', false)
end

function onUpdate(elapsed)

	daElapsed = elapsed * 30
	i = i + daElapsed
	
	if stopMoving == false then
		setProperty('dad.y', (math.sin(i/20)*75) - 600)
		yy = (math.sin(i/20)*75) - 200
	
		setProperty('boyfriend.y', (math.sin(i/11)*30) - 350)
		yy2 = (math.sin(i/11)*30) - 100
	end

	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
     if followchars == true then
        if mustHitSection == false then
            setProperty('defaultCamZoom',0.5)
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
        else
      
            setProperty('defaultCamZoom',0.55)
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
    
end

function onGameOver()
	stopMoving = true;
end

function onEvent(n, v1, v2)
    if n == 'close' then
        doTweenY('closetop', 'bartop', -30, 0.25, 'linear');
        doTweenY('closebot', 'barbot', 250, 0.25, 'linear');
    end
end

function onTweenCompleted(tag)
    if tag == 'closetop' then
        removeLuaSprite('1')
        removeLuaSprite('2')
        removeLuaSprite('3')
        removeLuaSprite('4')
        removeLuaSprite('5')
        removeLuaSprite('6')
        doTweenAlpha('hidebf', 'boyfriend', 0, 0.001, 'linear');
        doTweenAlpha('', 'gf', 0, 0.001, 'linear');
        doTweenAlpha('hidedad', 'dad', 0, 0.001, 'linear');
    end
end