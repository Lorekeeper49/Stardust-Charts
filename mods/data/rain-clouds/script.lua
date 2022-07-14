-- Combo numbers --

local uno = 0
local dos = 0
local thr = 0
local fuo = 0

local unoPx  -- For pixel combo 
local dosPx 
local thrPx 
local fuoPx 

local MAXED = false -- Kinda useless, who tf has 9999 notes, much less 10000?? | Don't even work right
local thous = false -- For the fourth digit to appear
local eh = 0        -- Make the sprites load in the way it does

-- Opponent Combo Numbers --

local unoOp = 0
local dosOp = 0
local thrOp = 0
local fuoOp = 0

local unoOpPx  -- For pixel combo 
local dosOpPx 
local thrOpPx 
local fuoOpPx 

local MAXEDOP = false -- Kinda useless, who tf has 9999 notes, much less 10000?? | Don't even work right
local thousOp = false -- For the fourth digit to appear
local ehOp = 0        -- Make the sprites load in the way it does


-- Settings --

local pixel = false -- PIXEL SUPPORT WOOOO | Want cool pixel combo?
local pixelOp = false

local ratingGrab = {'doki/sick', 'doki/good', 'doki/bad', 'doki/shit'} -- what it'll grab | either change these or the names down below | IF CHANGED, FILE NAME HAS TO BE IN MODS/IMAGES
local ratingGrabOp = {'doki/sick', 'doki/good', 'doki/bad', 'doki/shit'}
local numPrefix = 'doki/num'               -- Easier to change numbers | Name it like "rednum" or "Invnum"
local numPrefixOp = 'doki/num'


local constantGameCam = true          -- Incase things move around, keeps thing hooked onto game character or item

local defaultPosRating = {450, 300}    -- Positions it'll use for ratings when not on player combo | HUD 'n Other cam | default numbers: 450, 300
local defaultPosNum = {450, 385}                                                                                    --| default numbers: 450, 385
local defaultPosRateGame = {nil, nil}  -- Position for game cam | Defaults to my preset if untouched 
local defaultPosNumGame = {nil, nil}

local defaultPosRatingOp = {350, 440}   -- Positions it'll use | default numbers: 350, 440
local defaultPosNumOp = {380, 535}                           --| default numbers: 380, 535
local defaultPosRateGameOp = {nil, nil} -- Position for game cam
local defaultPosNumGameOp = {nil, nil}


local ratingScale = {0.69, 0.69}        -- You can guess what these are for | DEFAULT numbers for both: rating = 0.69, 0.69 | num = 0.5, 0.5
local numScale = {0.5, 0.5}             -- IF you mess with the numScale, be sure to adjust it's spacing down below as they might overlap 

local ratingScaleOp = {0.69, 0.69}
local numScaleOp = {0.5, 0.5}


local visible = true     -- Show it?
local visibleOp = true   -- Show it? (Opponent)

local onPlayerCombo = true  -- If it'll show on where the player has the ratings offsets, not 100% perfect | INCOMPATIBLE with 'game' & 'other' cam? | Make sure RATINGS is tied to HUD
local onPlayerComboOp = false


local camSet = 'hud'    -- Should it be on the Hud or Game or Other?  Hud | Game | Other  (NOTICE: for the game cam, I have its default set to rely on Gfs position)
local camSetOp = 'hud'  --                                            Hud | Game | Other


local limitTo = 100     -- How many new sprites should be able to be spawned before getting overwritten (Default 100) | Don't turn this off please

local randGoods = false -- Makes some goods occasionally appear (Opponent)
local randBads = false  -- Makes some bads occasionally appear (Opponent)         | Should you turn all these on? Probably not
local randShits = false -- Makes some shits occasionally appear (Opponent)

local chanceGood -- For said options
local chanceBad 
local chanceShit

-- Modes --

local simpleMode = false -- Only 1 set of numbers and ratings are shown at a time | Can help prevent lag if too many ratings usually appear
local simpleModeOp = false

local stationaryMode = false -- Prevent the Rating hop | Simple mode recommended
local stationaryModeOp = false


local hideRating = false -- Hides rating, not numbers (who coulda guessed)
local hideNums = false -- Hides numbers, not ratings (who coulda guessed)

local hideRatingOp = false 
local hideNumsOp = false 


local hideNumsTil = false -- woah just like fnf!!! (how worthy you gotta be before you see your combo)
local tillWhen = 10

-- Dont touch these unless you want to mess with combo offset
local xAyy = 440 -- combo offset (exists just to shove the thing when you got combo of 1000)
local xAyyOp = 440 
local once = false -- for said option
local onceOp = false

--------------------------------------------------------------------------|The Code Shit|----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------|By Unholywanderer04|-------------------------------------------------------------------------------------------

function onCreate()
    -- THIS IS HERE TO HELP WITH THE LAYERING WHEN THE COMBO IS ON THE HUD --
    makeLuaText("layer", '', 200, -999, 99999);
    setObjectCamera("layer", 'hud');
    addLuaText("layer");
    -- WITHOUT THIS, IT'LL BE ON TOP OF THE ARROWS LIKE KADE ENGINE --
        -- Might still be layering issues though, so let me know --
end

function onDestroy()
    setPropertyFromClass('ClientPrefs', 'hideHud', false); -- (Fail Safe) So the stupid thing actually unhides once you complete a song >:(
end

function onCreatePost()
        -- Can't call this stuff outside of a function so --
        -- Checks if BOTH values are nil. Why? just cause --

                    -- Rating game POS check --
    if defaultPosRateGame[1] == nil and defaultPosRateGame[2] == nil then
        defaultPosRateGame[1] = getProperty('gf.x') + 400
        defaultPosRateGame[2] = getProperty('gf.y') + 200
    end
    if defaultPosRateGameOp[1] == nil and defaultPosRateGameOp[2] == nil then
        defaultPosRateGameOp[1] = getProperty('gf.x') + 100
        defaultPosRateGameOp[2] = getProperty('gf.y') + 400
    end

                    -- Number game POS check --
    if defaultPosNumGame[1] == nil and defaultPosNumGame[2] == nil then
        defaultPosNumGame[1] = getProperty('gf.x') + 400
        defaultPosNumGame[2] = getProperty('gf.y') + 300
    end
    if defaultPosNumGameOp[1] == nil and defaultPosNumGameOp[2] == nil then
        defaultPosNumGameOp[1] = getProperty('gf.x') + 90
        defaultPosNumGameOp[2] = getProperty('gf.y') + 500
    end
   
    -- Pixel shit, move this to onUpdate if you're gonna do sumthin wacky --
    -- But if it's for setting a stage, like the school, just keep it here --

    if pixel == true then 
        ratingGrab[1] = 'pixelUI/sick-pixel' 
        ratingGrab[2] = 'pixelUI/good-pixel'
        ratingGrab[3] = 'pixelUI/bad-pixel' 
        ratingGrab[4] = 'pixelUI/shit-pixel'

        ratingScale[1] = 5
        ratingScale[2] = 5

        numPrefix = 'pixelUI/num'
        numScale[1] = 5
        numScale[2] = 5

        defaultPosRateGame[1] = getProperty('gf.x') + 300
        defaultPosRateGame[2] = getProperty('gf.y') + 100
        defaultPosNumGame[1] = getProperty('gf.x') + 300
        defaultPosNumGame[2] = getProperty('gf.y') + 200
    
    end

    if pixelOp == true then
        ratingGrabOp[1] = 'pixelUI/sick-pixel' 
        ratingGrabOp[2] = 'pixelUI/good-pixel'
        ratingGrabOp[3] = 'pixelUI/bad-pixel' 
        ratingGrabOp[4] = 'pixelUI/shit-pixel'

        ratingScaleOp[1] = 5
        ratingScaleOp[2] = 5

        numPrefixOp = 'pixelUI/num'
        numScaleOp[1] = 5
        numScaleOp[2] = 5

        defaultPosRateGameOp[1] = getProperty('gf.x') - 150
        defaultPosRateGameOp[2] = getProperty('gf.y') + 150
        defaultPosNumGameOp[1] = getProperty('gf.x') - 150
        defaultPosNumGameOp[2] = getProperty('gf.y') + 250
    end

    if visible == true then
        setPropertyFromClass('ClientPrefs', 'hideHud', true); -- Doing it like this hides ONLY the combo counter and nothing else from the hud
    end
end

function onUpdate()

    if visible == true then
        setPropertyFromClass('ClientPrefs', 'hideHud', true); -- If you're gonna do cool rating shit, mess with it here
    end
    if visible == false --[[nil]] then
        setPropertyFromClass('ClientPrefs', 'hideHud', false);
    end

    if constantGameCam == true then
          -- For your moving characters and things --
                   -- Rating POS check --

                 -- example for constant --
        defaultPosRateGame[1] = getProperty('gf.x') + 400
        defaultPosRateGame[2] = getProperty('gf.y') + 200
    
        defaultPosRateGameOp[1] = getProperty('gf.x') + 100
        defaultPosRateGameOp[2] = getProperty('gf.y') + 400

                    -- Number POS check --

        defaultPosNumGame[1] = getProperty('gf.x') + 400
        defaultPosNumGame[2] = getProperty('gf.y') + 300

        defaultPosNumGameOp[1] = getProperty('gf.x') + 90
        defaultPosNumGameOp[2] = getProperty('gf.y') + 500
    end


    -- Example (incase you don't know how to fuck with strings) --
    --[[if curBeat == 20 and getProperty('boyfriend.curCharacter') == 'bf' then
        ratingGrab[1] = 'sickRed'
    end]]

    if thous == true and once == false then
        -- shoves the numbers to the right a bit once 1000 is reached --
        -- just like psych enginge!!!!1!!1 --
        once = true
        defaultPosNum[1] = defaultPosNum[1] + 20
        defaultPosNumGame[1] = defaultPosNumGame[1] + 20
        xAyy = xAyy + 20
    end

    if thousOp == true and onceOp == false then
        -- shoves the numbers to the right a bit once 1000 is reached --
        -- just like psych enginge!!!!1!!1 --
        onceOp = true
        defaultPosNumOp[1] = defaultPosNumOp[1] + 20
        defaultPosNumGameOp[1] = defaultPosNumGameOp[1] + 20
        xAyyOp = xAyyOp + 20
    end

    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SEVEN') or getPropertyFromClass('flixel.FlxG', 'keys.justPressed.EIGHT') then
        setPropertyFromClass('ClientPrefs', 'hideHud', false);
    end

    -- the "tieTo" number thing is kinda useless

    -- These are here for more randomness --
    chanceGood = math.random(1, 50)
    chanceBad = math.random(1, 65)
    chanceShit = math.random(1, 74)
end


function goodNoteHit(id, direction, noteType, isSustainNote) 
    if visible == true then
        comboOffset = getPropertyFromClass('ClientPrefs', 'comboOffset') -- rating offsets ( [1] Rating X | [2] Rating Y | [3] Number X | [4] Number Y ) 
        if not isSustainNote then
            
            if simpleMode == true then
                eh = 0 -- Keeps 'eh' at 0 so it can't spawn more than one at a time
            end

            -------------------------------Ratings---------------------------------------
            
            -- Took from Whitty mod >:)
            strumTime = getPropertyFromGroup('notes', id, 'strumTime');
            local rating = getRating(strumTime - getSongPosition() + getPropertyFromClass('ClientPrefs','ratingOffset'));
            hmm = rating
            local combo = getProperty('combo');

            if hideRating == true then
                hmm = ''
            end

            -- This grabs the default Rating images in either assets/shared/images or mods/images depending on if you're using a mod AND if there are Rating images in there.
            -- I recommend making a folder for ratings if you do some wacky things, specifially for ease of access.

            if hmm == 'sick' then
                if onPlayerCombo == true and camSet == 'hud' then
                    makeLuaSprite('sickly' .. eh, ratingGrab[1], 400 + comboOffset[1], 230 - comboOffset[2])
                elseif camSet == 'game' then
                    makeLuaSprite('sickly' .. eh, ratingGrab[1], defaultPosRateGame[1], defaultPosRateGame[2]) -- default position for game cam | change if you want
                else
                    makeLuaSprite('sickly' .. eh, ratingGrab[1], defaultPosRating[1], defaultPosRating[2]) -- Default position for any other cam, hud, other, etc
                end
                setObjectCamera('sickly' .. eh, camSet)
                setObjectOrder('sickly' .. eh, getObjectOrder('layer')-1)
                scaleObject('sickly' .. eh, ratingScale[1], ratingScale[2])
                if pixel == true then
                    setProperty('sickly' .. eh .. '.antialiasing', false)
                end
                addLuaSprite('sickly' .. eh, true)
                if stationaryMode == false then
                    setProperty('sickly' .. eh .. '.acceleration.y', 550)
                    setProperty('sickly'.. eh ..'.velocity.x', math.random(0,10))
                    setProperty('sickly'.. eh ..'.velocity.y', -180)
                end
                doTweenAlpha('nachotweenSick' .. eh, 'sickly' .. eh, 0, 0.2 + (stepCrochet * 0.004), 'quartIn')
                if getProperty('sickly'.. eh ..'.alpha') == 0 then -- don't think this works :(, not with the default mode
                    removeLuaSprite('sickly'.. eh, false)
                end 
            end

            if hmm == 'good' then
                if onPlayerCombo == true and camSet == 'hud' then
                    makeLuaSprite('goodly' .. eh, ratingGrab[2], 400 + comboOffset[1], 230 - comboOffset[2])
                elseif camSet == 'game' then
                    makeLuaSprite('goodly' .. eh, ratingGrab[2], defaultPosRateGame[1], defaultPosRateGame[2]) -- default position for game cam | change if you want
                else
                    makeLuaSprite('goodly' .. eh, ratingGrab[2], defaultPosRating[1], defaultPosRating[2])
                end
                --makeLuaSprite('goodly' .. eh, 'good', 350, 440)
                setObjectCamera('goodly' .. eh, camSet)
                setObjectOrder('goodly' .. eh, getObjectOrder('layer')-1)
                scaleObject('goodly' .. eh, ratingScale[1], ratingScale[2])
                if pixel == true then
                    setProperty('goodly' .. eh .. '.antialiasing', false)
                end
                addLuaSprite('goodly' .. eh, true)
                if stationaryMode == false then
                    setProperty('goodly' .. eh .. '.acceleration.y', 550)
                    setProperty('goodly'.. eh ..'.velocity.x', math.random(0,10))
                    setProperty('goodly'.. eh ..'.velocity.y', -180)
                end
                doTweenAlpha('nachotweenGood' .. eh, 'goodly' .. eh, 0, 0.2 + (stepCrochet * 0.004), 'quartIn')
                if getProperty('goodly'.. eh ..'.alpha') == 0 then
                    removeLuaSprite('goodly'.. eh, false)
                end 
            end

            if hmm == 'bad' then
                if onPlayerCombo == true and camSet == 'hud' then
                    makeLuaSprite('badly' .. eh, ratingGrab[3], 400 + comboOffset[1], 230 - comboOffset[2])
                elseif camSet == 'game' then
                    makeLuaSprite('badly' .. eh, ratingGrab[3], defaultPosRateGame[1], defaultPosRateGame[2]) -- default position for game cam | change if you want
                else
                    makeLuaSprite('badly' .. eh, ratingGrab[3], defaultPosRating[1], defaultPosRating[2])
                end
               --makeLuaSprite('badly' .. eh, 'bad', 350, 440)
                setObjectCamera('badly' .. eh, camSet)
                setObjectOrder('badly' .. eh, getObjectOrder('layer')-1)
                scaleObject('badly' .. eh, ratingScale[1], ratingScale[2])
                if pixel == true then
                    setProperty('badly' .. eh .. '.antialiasing', false)
                end
                addLuaSprite('badly' .. eh, true)
                if stationaryMode == false then
                    setProperty('badly' .. eh .. '.acceleration.y', 550)
                    setProperty('badly'.. eh ..'.velocity.x', math.random(0,10))
                    setProperty('badly'.. eh ..'.velocity.y', -180)
                end
                doTweenAlpha('nachotweenBad' .. eh, 'badly' .. eh, 0, 0.2 + (stepCrochet * 0.004), 'quartIn')
                if getProperty('badly'.. eh ..'.alpha') == 0 then
                    removeLuaSprite('badly'.. eh, false)
                end 
            end

            if hmm == 'shit' then
                if onPlayerCombo == true and camSet == 'hud' then
                    makeLuaSprite('shitly' .. eh, ratingGrab[4], 400 + comboOffset[1], 230 - comboOffset[2])
                elseif camSet == 'game' then
                    makeLuaSprite('shitly' .. eh, ratingGrab[4], defaultPosRateGame[1], defaultPosRateGame[2]) -- default position for game cam | change if you want
                else
                    makeLuaSprite('shitly' .. eh, ratingGrab[4], defaultPosRating[1], defaultPosRating[2])
                end
                --makeLuaSprite('shitly' .. eh, 'shit', 350, 440)
                setObjectCamera('shitly' .. eh, camSet)
                setObjectOrder('shitly' .. eh, getObjectOrder('layer')-1)
                scaleObject('shitly' .. eh, ratingScale[1], ratingScale[2])
                if pixel == true then
                    setProperty('shitly' .. eh .. '.antialiasing', false)
                end
                addLuaSprite('shitly' .. eh, true)
                if stationaryMode == false then
                    setProperty('shitly' .. eh .. '.acceleration.y', 550)
                    setProperty('shitly'.. eh ..'.velocity.x', math.random(0,10))
                    setProperty('shitly'.. eh ..'.velocity.y', -180)
                end
                doTweenAlpha('nachotweenShit' .. eh, 'shitly' .. eh, 0, 0.2 + (stepCrochet * 0.004), 'quartIn')
                if getProperty('shitly'.. eh ..'.alpha') == 0 then
                    removeLuaSprite('shitly'.. eh, false)
                end 
            end

            eh = eh + 1 -- makes the sprites spawn the way they do

            if eh > limitTo then
                eh = 0 -- So it begins to overwrite inital sprites (stops lag)
            end

            -------------------------------Counter---------------------------------------
           
            uno = uno + 1
            if uno > 9 and MAXED ~= true then
               uno = 0
               dos = dos + 1
               if dos > 9 then
                    dos = 0
                    thr = thr + 1
                    if thr > 9 then
                        thr = 0
                        thous = true
                        fuo = fuo + 1
                        if fuo == 9 and thr == 9 and dos == 9 and uno == 9 then -- questionable at best
                            MAXED = true
                        end
                    end
                end
            elseif MAXED == true then
                -- who tf puts over 10000 notes
                uno = 9
                dos = 9
                thr = 9
                fuo = 9
            end
                      --Pixel--
                unoPx = uno .. '-pixel'
                dosPx = dos .. '-pixel'
                thrPx = thr .. '-pixel'
                fuoPx = fuo .. '-pixel'
        

            --------------------------------Numbers----------------------------------------
       
                    -- Only change the this number's x and y as the other numbers are based on it --
                        -- If this number doesn't spawn, none of them will, so watch for that --
            if hideNums == false then
                if hideNumsTil == false then -- this is stupid but works
                    if pixel == true then
                        if onPlayerCombo == true and camSet == 'hud' then
                            makeLuaSprite('firstNum' .. eh, numPrefix.. unoPx, xAyy + comboOffset[3], 390 - comboOffset[4])
                        elseif camSet == 'game' then
                            makeLuaSprite('firstNum' .. eh, numPrefix.. unoPx, defaultPosNumGame[1], defaultPosNumGame[2]) 
                        else
                            makeLuaSprite('firstNum' .. eh, numPrefix.. unoPx, defaultPosNum[1], defaultPosNum[2])
                        end
                        --makeLuaSprite('firstNum' .. eh, 'num'.. uno, 380, 535)
                        setObjectCamera('firstNum' .. eh, camSet)
                        setObjectOrder('firstNum' .. eh, getObjectOrder('layer')-1)
                        scaleObject('firstNum' .. eh, numScale[1], numScale[2])
                        setProperty('firstNum' .. eh .. '.antialiasing', false)
                        addLuaSprite('firstNum' .. eh, true)
                        if stationaryMode == false then
                            setProperty('firstNum' .. eh .. '.acceleration.y', math.random(200, 400))
                            setProperty('firstNum'.. eh ..'.velocity.x', math.random(-5, 5))
                            setProperty('firstNum'.. eh ..'.velocity.y', math.random(-140, -160))
                        end
                        doTweenAlpha('nachotweenNum1' .. eh, 'firstNum' .. eh, 0, 0.2 + (stepCrochet * 0.008), 'quartIn')
                        if getProperty('firstNum' .. eh.. '.alpha') == 0 then
                            removeLuaSprite('firstNum' .. eh, false)
                        end
                    else
                        if onPlayerCombo == true and camSet == 'hud' then
                            makeLuaSprite('firstNum' .. eh, numPrefix.. uno, xAyy + comboOffset[3], 390 - comboOffset[4])
                        elseif camSet == 'game' then
                            makeLuaSprite('firstNum' .. eh, numPrefix.. uno, defaultPosNumGame[1], defaultPosNumGame[2]) 
                        else
                            makeLuaSprite('firstNum' .. eh, numPrefix.. uno, defaultPosNum[1], defaultPosNum[2])
                        end
                        --makeLuaSprite('firstNum' .. eh, 'num'.. uno, 380, 535)
                        setObjectCamera('firstNum' .. eh, camSet)
                        setObjectOrder('firstNum' .. eh, getObjectOrder('layer')-1)
                        scaleObject('firstNum' .. eh, numScale[1], numScale[2])
                        addLuaSprite('firstNum' .. eh, true)
                        if stationaryMode == false then
                            setProperty('firstNum' .. eh .. '.acceleration.y', math.random(200, 400))
                            setProperty('firstNum'.. eh ..'.velocity.x', math.random(-5, 5))
                            setProperty('firstNum'.. eh ..'.velocity.y', math.random(-140, -160))
                        end
                        doTweenAlpha('nachotweenNum1' .. eh, 'firstNum' .. eh, 0, 0.2 + (stepCrochet * 0.008), 'quartIn')
                        if getProperty('firstNum' .. eh.. '.alpha') == 0 then
                            removeLuaSprite('firstNum' .. eh, false)
                        end
                    end
                end
            end
            if hideNumsTil == true then
                if getProperty('combo') >= tillWhen then
                    if pixel == true then
                        if onPlayerCombo == true and camSet == 'hud' then
                            makeLuaSprite('firstNum' .. eh, numPrefix.. unoPx, xAyy + comboOffset[3], 390 - comboOffset[4])
                        elseif camSet == 'game' then
                            makeLuaSprite('firstNum' .. eh, numPrefix.. unoPx, defaultPosNumGame[1], defaultPosNumGame[2]) 
                        else
                            makeLuaSprite('firstNum' .. eh, numPrefix.. unoPx, defaultPosNum[1], defaultPosNum[2])
                        end
                        --makeLuaSprite('firstNum' .. eh, 'num'.. uno, 380, 535)
                        setObjectCamera('firstNum' .. eh, camSet)
                        setObjectOrder('firstNum' .. eh, getObjectOrder('layer')-1)
                        scaleObject('firstNum' .. eh, numScale[1], numScale[2])
                        setProperty('firstNum' .. eh .. '.antialiasing', false)
                        addLuaSprite('firstNum' .. eh, true)
                        if stationaryMode == false then
                            setProperty('firstNum' .. eh .. '.acceleration.y', math.random(200, 400))
                            setProperty('firstNum'.. eh ..'.velocity.x', math.random(-5, 5))
                            setProperty('firstNum'.. eh ..'.velocity.y', math.random(-140, -160))
                        end
                        doTweenAlpha('nachotweenNum1' .. eh, 'firstNum' .. eh, 0, 0.2 + (stepCrochet * 0.008), 'quartIn')
                        if getProperty('firstNum' .. eh.. '.alpha') == 0 then
                            removeLuaSprite('firstNum' .. eh, false)
                        end
                    else
                        if onPlayerCombo == true and camSet == 'hud' then
                            makeLuaSprite('firstNum' .. eh, numPrefix.. uno, xAyy + comboOffset[3], 390 - comboOffset[4])
                        elseif camSet == 'game' then
                            makeLuaSprite('firstNum' .. eh, numPrefix.. uno, defaultPosNumGame[1], defaultPosNumGame[2]) 
                        else
                            makeLuaSprite('firstNum' .. eh, numPrefix.. uno, defaultPosNum[1], defaultPosNum[2])
                        end
                        setObjectCamera('firstNum' .. eh, camSet)
                        setObjectOrder('firstNum' .. eh, getObjectOrder('layer')-1)
                        scaleObject('firstNum' .. eh, numScale[1], numScale[2])
                        addLuaSprite('firstNum' .. eh, true)
                        if stationaryMode == false then
                            setProperty('firstNum' .. eh .. '.acceleration.y', math.random(200, 400))
                            setProperty('firstNum'.. eh ..'.velocity.x', math.random(-5, 5))
                            setProperty('firstNum'.. eh ..'.velocity.y', math.random(-140, -160))
                        end
                        doTweenAlpha('nachotweenNum1' .. eh, 'firstNum' .. eh, 0, 0.2 + (stepCrochet * 0.008), 'quartIn')
                        if getProperty('firstNum' .. eh.. '.alpha') == 0 then
                            removeLuaSprite('firstNum' .. eh, false)
                        end
                    end
                end
            end
            
            if pixel == true then
                makeLuaSprite('secNum' .. eh, numPrefix.. dosPx, getProperty('firstNum' ..eh.. '.x') - 44, getProperty('firstNum' .. eh.. '.y'))
                setObjectCamera('secNum' .. eh, camSet)
                setObjectOrder('secNum' .. eh, getObjectOrder('layer')-1)
                scaleObject('secNum' .. eh, numScale[1], numScale[2])
                setProperty('secNum' .. eh .. '.antialiasing', false)
                addLuaSprite('secNum' .. eh, true)
                if stationaryMode == false then
                    setProperty('secNum' .. eh .. '.acceleration.y', math.random(200, 400))
                    setProperty('secNum'.. eh ..'.velocity.x', math.random(-5, 5))
                    setProperty('secNum'.. eh ..'.velocity.y', math.random(-140, -160))
                end
                doTweenAlpha('nachotweenNum2' .. eh, 'secNum' .. eh, 0, 0.2 + (stepCrochet * 0.008), 'quartIn')
                if getProperty('secNum' .. eh.. '.alpha') == 0 then
                    removeLuaSprite('secNum' .. eh, false)
                end

                makeLuaSprite('thrdNum' .. eh, numPrefix.. thrPx, getProperty('secNum' ..eh.. '.x') - 44, getProperty('firstNum' .. eh.. '.y'))
                setObjectCamera('thrdNum' .. eh, camSet)
                setObjectOrder('thrdNum' .. eh, getObjectOrder('layer')-1)
                scaleObject('thrdNum' .. eh, numScale[1], numScale[2])
                setProperty('thrdNum' .. eh .. '.antialiasing', false)
                addLuaSprite('thrdNum' .. eh, true)
                if stationaryMode == false then
                    setProperty('thrdNum' .. eh .. '.acceleration.y', math.random(200, 400))
                    setProperty('thrdNum'.. eh ..'.velocity.x', math.random(-5, 5))
                    setProperty('thrdNum'.. eh ..'.velocity.y', math.random(-140, -160))
                end
                doTweenAlpha('nachotweenNum3' .. eh, 'thrdNum' .. eh, 0, 0.2 + (stepCrochet * 0.008), 'quartIn')
                if getProperty('thrdNum' .. eh.. '.alpha') == 0 then
                    removeLuaSprite('thrdNum' .. eh, false)
                end

                if thous == true then
                    makeLuaSprite('fourNum' .. eh, numPrefix.. fuoPx, getProperty('thrdNum' ..eh.. '.x') - 44, getProperty('firstNum' .. eh.. '.y'))
                    setObjectCamera('fourNum' .. eh, camSet)
                    setObjectOrder('fourNum' .. eh, getObjectOrder('layer')-1)
                    scaleObject('fourNum' .. eh, numScale[1], numScale[2])
                    setProperty('fourNum' .. eh .. '.antialiasing', false)
                    addLuaSprite('fourNum' .. eh, true)
                    if stationaryMode == false then
                        setProperty('fourNum' .. eh .. '.acceleration.y', math.random(200, 400))
                        setProperty('fourNum'.. eh ..'.velocity.x', math.random(-5, 5))
                        setProperty('fourNum'.. eh ..'.velocity.y', math.random(-140, -160))
                    end
                    doTweenAlpha('nachotweenNum4' .. eh, 'fourNum' .. eh, 0, 0.2 + (stepCrochet * 0.008), 'quartIn')
                    if getProperty('fourNum' .. eh.. '.alpha') == 0 then
                        removeLuaSprite('fourNum' .. eh, false)
                    end
                end

            else
                    -- non Pixel
                makeLuaSprite('secNum' .. eh, numPrefix.. dos, getProperty('firstNum' ..eh.. '.x') - 44, getProperty('firstNum' .. eh.. '.y'))
                setObjectCamera('secNum' .. eh, camSet)
                setObjectOrder('secNum' .. eh, getObjectOrder('layer')-1)
                scaleObject('secNum' .. eh, numScale[1], numScale[2])
                addLuaSprite('secNum' .. eh, true)
                if stationaryMode == false then
                    setProperty('secNum' .. eh .. '.acceleration.y', math.random(200, 400))
                    setProperty('secNum'.. eh ..'.velocity.x', math.random(-5, 5))
                    setProperty('secNum'.. eh ..'.velocity.y', math.random(-140, -160))
                end
                doTweenAlpha('nachotweenNum2' .. eh, 'secNum' .. eh, 0, 0.2 + (stepCrochet * 0.008), 'quartIn')
                if getProperty('secNum' .. eh.. '.alpha') == 0 then
                    removeLuaSprite('secNum' .. eh, false)
                end

                makeLuaSprite('thrdNum' .. eh, numPrefix.. thr, getProperty('secNum' ..eh.. '.x') - 44, getProperty('firstNum' .. eh.. '.y'))
                setObjectCamera('thrdNum' .. eh, camSet)
                setObjectOrder('thrdNum' .. eh, getObjectOrder('layer')-1)
                scaleObject('thrdNum' .. eh, numScale[1], numScale[2])
                addLuaSprite('thrdNum' .. eh, true)
                if stationaryMode == false then
                    setProperty('thrdNum' .. eh .. '.acceleration.y', math.random(200, 400))
                    setProperty('thrdNum'.. eh ..'.velocity.x', math.random(-5, 5))
                    setProperty('thrdNum'.. eh ..'.velocity.y', math.random(-140, -160))
                end
                doTweenAlpha('nachotweenNum3' .. eh, 'thrdNum' .. eh, 0, 0.2 + (stepCrochet * 0.008), 'quartIn')
                if getProperty('thrdNum' .. eh.. '.alpha') == 0 then
                    removeLuaSprite('thrdNum' .. eh, false)
                end

                if thous == true then
                    makeLuaSprite('fourNum' .. eh, numPrefix.. fuo, getProperty('thrdNum' ..eh.. '.x') - 44, getProperty('firstNum' .. eh.. '.y'))
                    setObjectCamera('fourNum' .. eh, camSet)
                    setObjectOrder('fourNum' .. eh, getObjectOrder('layer')-1)
                    scaleObject('fourNum' .. eh, numScale[1], numScale[2])
                    addLuaSprite('fourNum' .. eh, true)
                    if stationaryMode == false then
                        setProperty('fourNum' .. eh .. '.acceleration.y', math.random(200, 400))
                        setProperty('fourNum'.. eh ..'.velocity.x', math.random(-5, 5))
                        setProperty('fourNum'.. eh ..'.velocity.y', math.random(-140, -160))
                    end
                    doTweenAlpha('nachotweenNum4' .. eh, 'fourNum' .. eh, 0, 0.2 + (stepCrochet * 0.008), 'quartIn')
                    if getProperty('fourNum' .. eh.. '.alpha') == 0 then
                        removeLuaSprite('fourNum' .. eh, false)
                    end
                end
            end
        end
    end
end

function noteMiss()
    -- Sets back to 0
    uno = 0
    dos = 0
    thr = 0
    fuo = 0
end

---------------------------- Daddy Dearest <3 (Opponent) ---------------------------------

function opponentNoteHit(id, direction, noteType, isSustainNote) 
    hmmOp = rateGet()
    if visibleOp == true then
     

        comboOffset = getPropertyFromClass('ClientPrefs', 'comboOffset') -- rating offsets
        if not isSustainNote then

               
            if simpleModeOp == true then
                ehOp = 0 -- Keeps 'eh' at 0 so it can't spawn more than one at a time
            end

            if hideRatingOp == true then
                hmmOp = ''
            end

            -------------------------------Ratings---------------------------------------
            

            if hmmOp == 'sick' then
                if onPlayerComboOp == true and camSetOp == 'hud' then
                    makeLuaSprite('sicklyOp' .. ehOp, ratingGrabOp[1], 400 + comboOffset[1], 230 - comboOffset[2])
                elseif camSetOp == 'game' then
                    makeLuaSprite('sicklyOp' .. ehOp, ratingGrabOp[1], defaultPosRateGameOp[1], defaultPosRateGameOp[2])
                else
                    makeLuaSprite('sicklyOp' .. ehOp, ratingGrabOp[1], defaultPosRatingOp[1], defaultPosRatingOp[2])
                end
                setObjectCamera('sicklyOp' .. ehOp, camSetOp)
                setObjectOrder('sicklyOp' .. ehOp, getObjectOrder('layer')-1)
                scaleObject('sicklyOp' .. ehOp, ratingScaleOp[1], ratingScaleOp[2])
                if pixelOp == true then
                    setProperty('sicklyOp' .. ehOp .. '.antialiasing', false)
                end
                addLuaSprite('sicklyOp' .. ehOp, true)
                if stationaryModeOp == false then
                    setProperty('sicklyOp' .. ehOp .. '.acceleration.y', 550)
                    setProperty('sicklyOp'.. ehOp ..'.velocity.x', math.random(0,10))
                    setProperty('sicklyOp'.. ehOp ..'.velocity.y', -180)
                end
                doTweenAlpha('nachotweenSickO' .. ehOp, 'sicklyOp' .. ehOp, 0, 0.2 + (stepCrochet * 0.004), 'quartIn')
                if getProperty('sicklyOp'.. ehOp ..'.alpha') == 0 then -- don't think this works :(
                    removeLuaSprite('sicklyOp'.. ehOp, false)
                end 
            end

            if hmmOp == 'good' then
                if onPlayerComboOp == true and camSetOp == 'hud' then
                    makeLuaSprite('goodlyOp' .. ehOp, ratingGrabOp[2], 400 + comboOffset[1], 230 - comboOffset[2])
                elseif camSetOp == 'game' then
                    makeLuaSprite('goodlyOp' .. ehOp, ratingGrabOp[2], defaultPosRateGameOp[1], defaultPosRateGameOp[2])
                else
                    makeLuaSprite('goodlyOp' .. ehOp, ratingGrabOp[2], defaultPosRatingOp[1], defaultPosRatingOp[2])
                end
                --makeLuaSprite('goodlyOp' .. ehOp, 'good', 350, 440)
                setObjectCamera('goodlyOp' .. ehOp, camSetOp)
                setObjectOrder('goodlyOp' .. ehOp, getObjectOrder('layer')-1)
                scaleObject('goodlyOp' .. ehOp, ratingScaleOp[1], ratingScaleOp[2])
                if pixelOp == true then
                    setProperty('goodlyOp' .. ehOp .. '.antialiasing', false)
                end
                addLuaSprite('goodlyOp' .. ehOp, true)
                if stationaryModeOp == false then
                    setProperty('goodlyOp' .. ehOp .. '.acceleration.y', 550)
                    setProperty('goodlyOp'.. ehOp ..'.velocity.x', math.random(0,10))
                    setProperty('goodlyOp'.. ehOp ..'.velocity.y', -180)
                end
                doTweenAlpha('nachotweenGoodO' .. ehOp, 'goodlyOp' .. ehOp, 0, 0.2 + (stepCrochet * 0.004), 'quartIn')
                if getProperty('goodlyOp'.. ehOp ..'.alpha') == 0 then
                    removeLuaSprite('goodlyOp'.. ehOp, false)
                end 
            end

            if hmmOp == 'bad' then
                if onPlayerComboOp == true and camSetOp == 'hud' then
                    makeLuaSprite('badlyOp' .. ehOp, ratingGrabOp[3], 400 + comboOffset[1], 230 - comboOffset[2])
                elseif camSetOp == 'game' then
                    makeLuaSprite('badlyOp' .. ehOp, ratingGrabOp[3], defaultPosRateGameOp[1], defaultPosRateGameOp[2])
                else
                    makeLuaSprite('badlyOp' .. ehOp, ratingGrabOp[3], defaultPosRatingOp[1], defaultPosRatingOp[2])
                end
               --makeLuaSprite('badlyOp' .. ehOp, 'bad', 350, 440)
                setObjectCamera('badlyOp' .. ehOp, camSetOp)
                setObjectOrder('badlyOp' .. ehOp, getObjectOrder('layer')-1)
                scaleObject('badlyOp' .. ehOp, ratingScaleOp[1], ratingScaleOp[2])
                if pixelOp == true then
                    setProperty('badlyOp' .. ehOp .. '.antialiasing', false)
                end
                addLuaSprite('badlyOp' .. ehOp, true)
                if stationaryModeOp == false then
                    setProperty('badlyOp' .. ehOp .. '.acceleration.y', 550)
                    setProperty('badlyOp'.. ehOp ..'.velocity.x', math.random(0,10))
                    setProperty('badlyOp'.. ehOp ..'.velocity.y', -180)
                end
                doTweenAlpha('nachotweenBadO' .. ehOp, 'badlyOp' .. ehOp, 0, 0.2 + (stepCrochet * 0.004), 'quartIn')
                if getProperty('badlyOp'.. ehOp ..'.alpha') == 0 then
                    removeLuaSprite('badlyOp'.. ehOp, false)
                end 
            end

            if hmmOp == 'shit' then
                if onPlayerComboOp == true and camSetOp == 'hud' then
                    makeLuaSprite('shitlyOp' .. ehOp, ratingGrabOp[4], 400 + comboOffset[1], 230 - comboOffset[2])
                elseif camSetOp == 'game' then
                    makeLuaSprite('shitlyOp' .. ehOp, ratingGrabOp[4], defaultPosRateGameOp[1], defaultPosRateGameOp[2])
                else
                    makeLuaSprite('shitlyOp' .. ehOp, ratingGrabOp[4], defaultPosRatingOp[1], defaultPosRatingOp[2])
                end
                --makeLuaSprite('shitlyOp' .. ehOp, 'shit', 350, 440)
                setObjectCamera('shitlyOp' .. ehOp, camSetOp)
                setObjectOrder('shitlyOp' .. ehOp, getObjectOrder('layer')-1)
                scaleObject('shitlyOp' .. ehOp, ratingScaleOp[1], ratingScaleOp[2])
                if pixelOp == true then
                    setProperty('shitlyOp' .. ehOp .. '.antialiasing', false)
                end
                addLuaSprite('shitlyOp' .. ehOp, true)
                if stationaryModeOp == false then
                    setProperty('shitlyOp' .. ehOp .. '.acceleration.y', 550)
                    setProperty('shitlyOp'.. ehOp ..'.velocity.x', math.random(0,10))
                    setProperty('shitlyOp'.. ehOp ..'.velocity.y', -180)
                end
                doTweenAlpha('nachotweenShitO' .. ehOp, 'shitlyOp' .. ehOp, 0, 0.2 + (stepCrochet * 0.004), 'quartIn')
                if getProperty('shitlyOp'.. ehOp ..'.alpha') == 0 then
                    removeLuaSprite('shitlyOp'.. ehOp, false)
                end 
            end

            ehOp = ehOp + 1 -- makes it look right

            if ehOp > limitTo then
                ehOp = 0 -- So it begins to overwrite inital sprites (stops lag)
            end

            -------------------------------Counter---------------------------------------

            unoOp = unoOp + 1
            if unoOp > 9 and MAXEDOP ~= true then
                unoOp = 0
                dosOp = dosOp + 1
                if dosOp > 9 then
                    dosOp = 0
                    thrOp = thrOp + 1
                    if thrOp > 9 then
                        thrOp = 0
                        thousOp = true
                        if fuoOp ~= 9 then
                            fuoOp = fuoOp + 1
                        elseif fuoOp > 9 then -- ?? and thrOp == 9 and dosOp == 9 and unoOp == 9 then
                            MAXEDOP = true
                        end
                    end
                end
            end
            if MAXEDOP == true then
                -- who tf puts over 10000 notes
                unoOp = 9
                dosOp = 9
                thrOp = 9
                fuoOp = 9
            end
                      --Pixel--
                unoOpPx = unoOp .. '-pixel'
                dosOpPx = dosOp .. '-pixel'
                thrOpPx = thrOp .. '-pixel'
                fuoOpPx = fuoOp .. '-pixel'
           
            --------------------------------Numbers----------------------------------------
            if hideNumsOp == false then
                if pixelOp == true then
                    if onPlayerComboOp == true and camSetOp == 'hud' then
                        makeLuaSprite('firstNumOp' .. ehOp, numPrefixOp .. unoOpPx, 440 + comboOffset[3], 390 - comboOffset[4])
                    elseif camSetOp == 'game' then
                        makeLuaSprite('firstNumOp' .. ehOp, numPrefixOp .. unoOpPx, defaultPosNumGameOp[1], defaultPosNumGameOp[2])
                    else                            
                        makeLuaSprite('firstNumOp' .. ehOp, numPrefixOp .. unoOpPx, defaultPosNumOp[1], defaultPosNumOp[2])
                    end
                    setObjectCamera('firstNumOp' .. ehOp, camSetOp)
                    setObjectOrder('firstNumOp' .. ehOp, getObjectOrder('layer')-1)
                    scaleObject('firstNumOp' .. ehOp, numScaleOp[1], numScaleOp[2])
                    setProperty('firstNumOp' .. ehOp .. '.antialiasing', false)
                    addLuaSprite('firstNumOp' .. ehOp, true)
                    if stationaryModeOp == false then                            
                        setProperty('firstNumOp' .. ehOp .. '.acceleration.y', math.random(200, 400))
                        setProperty('firstNumOp'.. ehOp ..'.velocity.x', math.random(-5, 5))
                        setProperty('firstNumOp'.. ehOp ..'.velocity.y', math.random(-140, -160))
                    end
                    doTweenAlpha('nachotweenNum1O' .. ehOp, 'firstNumOp' .. ehOp, 0, 0.2 + (stepCrochet * 0.008), 'quartIn')
                    if getProperty('firstNumOp' .. ehOp.. '.alpha') == 0 then
                        removeLuaSprite('firstNumOp' .. ehOp, false)
                    end
                else
                    if onPlayerComboOp == true and camSetOp == 'hud' then
                        makeLuaSprite('firstNumOp' .. ehOp, numPrefixOp .. unoOp, 440 + comboOffset[3], 390 - comboOffset[4])
                    elseif camSetOp == 'game' then
                        makeLuaSprite('firstNumOp' .. ehOp, numPrefixOp .. unoOp, defaultPosNumGameOp[1], defaultPosNumGameOp[2])
                    else
                        makeLuaSprite('firstNumOp' .. ehOp, numPrefixOp .. unoOp, defaultPosNumOp[1], defaultPosNumOp[2])
                    end
                    setObjectCamera('firstNumOp' .. ehOp, camSetOp)
                    setObjectOrder('firstNumOp' .. ehOp, getObjectOrder('layer')-1)
                    scaleObject('firstNumOp' .. ehOp, numScaleOp[1], numScaleOp[2])
                    addLuaSprite('firstNumOp' .. ehOp, true)
                    if stationaryModeOp == false then
                        setProperty('firstNumOp' .. ehOp .. '.acceleration.y', math.random(200, 400))
                        setProperty('firstNumOp'.. ehOp ..'.velocity.x', math.random(-5, 5))
                        setProperty('firstNumOp'.. ehOp ..'.velocity.y', math.random(-140, -160))
                    end
                    doTweenAlpha('nachotweenNum1O' .. ehOp, 'firstNumOp' .. ehOp, 0, 0.2 + (stepCrochet * 0.008), 'quartIn')
                    if getProperty('firstNumOp' .. ehOp.. '.alpha') == 0 then
                        removeLuaSprite('firstNumOp' .. ehOp, false)
                    end
                end
            end

            if pixelOp == true then
                makeLuaSprite('secNumOp' .. ehOp, numPrefixOp .. dosOpPx, getProperty('firstNumOp' ..ehOp.. '.x') - 44, getProperty('firstNumOp' .. ehOp.. '.y'))
                setObjectCamera('secNumOp' .. ehOp, camSetOp)
                setObjectOrder('secNumOp' .. ehOp, getObjectOrder('layer')-1)
                scaleObject('secNumOp' .. ehOp, numScaleOp[1], numScaleOp[2])
                setProperty('secNumOp' .. ehOp .. '.antialiasing', false)
                addLuaSprite('secNumOp' .. ehOp, true)
                if stationaryModeOp == false then
                    setProperty('secNumOp' .. ehOp .. '.acceleration.y', math.random(200, 400))
                    setProperty('secNumOp'.. ehOp ..'.velocity.x', math.random(-5, 5))
                    setProperty('secNumOp'.. ehOp ..'.velocity.y', math.random(-140, -160))
                end
                doTweenAlpha('nachotweenNum2O' .. ehOp, 'secNumOp' .. ehOp, 0, 0.2 + (stepCrochet * 0.008), 'quartIn')
                if getProperty('secNumOp' .. ehOp.. '.alpha') == 0 then
                    removeLuaSprite('secNumOp' .. ehOp, false)
                end

                makeLuaSprite('thrdNumOp' .. ehOp, numPrefixOp .. thrOpPx, getProperty('secNumOp' ..ehOp.. '.x') - 44, getProperty('firstNumOp' .. ehOp.. '.y'))
                setObjectCamera('thrdNumOp' .. ehOp, camSetOp)
                setObjectOrder('thrdNumOp' .. ehOp, getObjectOrder('layer')-1)
                scaleObject('thrdNumOp' .. ehOp, numScaleOp[1], numScaleOp[2])
                setProperty('thrdNumOp' .. ehOp .. '.antialiasing', false)
                addLuaSprite('thrdNumOp' .. ehOp, true)
                if stationaryModeOp == false then
                    setProperty('thrdNumOp' .. ehOp .. '.acceleration.y', math.random(200, 400))
                    setProperty('thrdNumOp'.. ehOp ..'.velocity.x', math.random(-5, 5))
                    setProperty('thrdNumOp'.. ehOp ..'.velocity.y', math.random(-140, -160))
                end
                doTweenAlpha('nachotweenNum3O' .. ehOp, 'thrdNumOp' .. ehOp, 0, 0.2 + (stepCrochet * 0.008), 'quartIn')
                if getProperty('thrdNumOp' .. ehOp.. '.alpha') == 0 then
                    removeLuaSprite('thrdNumOp' .. ehOp, false)
                end

                if thousOp == true then
                    makeLuaSprite('fourNumOp' .. ehOp, numPrefixOp .. fuoOpPx, getProperty('thrdNumOp' ..ehOp.. '.x') - 44, getProperty('firstNumOp' .. ehOp.. '.y'))
                    setObjectCamera('fourNumOp' .. ehOp, camSetOp)
                    setObjectOrder('fourNumOp' .. ehOp, getObjectOrder('layer')-1)
                    scaleObject('fourNumOp' .. ehOp, numScaleOp[1], numScaleOp[2])
                    setProperty('fourNumOp' .. ehOp .. '.antialiasing', false)
                    addLuaSprite('fourNumOp' .. ehOp, true)
                    if stationaryModeOp == false then
                        setProperty('fourNumOp' .. ehOp .. '.acceleration.y', math.random(200, 400))
                        setProperty('fourNumOp'.. ehOp ..'.velocity.x', math.random(-5, 5))
                        setProperty('fourNumOp'.. ehOp ..'.velocity.y', math.random(-140, -160))
                    end
                    doTweenAlpha('nachotweenNum4O' .. ehOp, 'fourNumOp' .. ehOp, 0, 0.2 + (stepCrochet * 0.008), 'quartIn')
                    if getProperty('fourNumOp' .. ehOp.. '.alpha') == 0 then
                        removeLuaSprite('fourNumOp' .. ehOp, false)
                    end
                end
            else
                -- no pixel
                makeLuaSprite('secNumOp' .. ehOp, numPrefixOp .. dosOp, getProperty('firstNumOp' ..ehOp.. '.x') - 44, getProperty('firstNumOp' .. ehOp.. '.y'))
                setObjectCamera('secNumOp' .. ehOp, camSetOp)
                setObjectOrder('secNumOp' .. ehOp, getObjectOrder('layer')-1)
                scaleObject('secNumOp' .. ehOp, numScaleOp[1], numScaleOp[2])
                addLuaSprite('secNumOp' .. ehOp, true)
                if stationaryModeOp == false then
                    setProperty('secNumOp' .. ehOp .. '.acceleration.y', math.random(200, 400))
                    setProperty('secNumOp'.. ehOp ..'.velocity.x', math.random(-5, 5))
                    setProperty('secNumOp'.. ehOp ..'.velocity.y', math.random(-140, -160))
                end
                doTweenAlpha('nachotweenNum2O' .. ehOp, 'secNumOp' .. ehOp, 0, 0.2 + (stepCrochet * 0.008), 'quartIn')
                if getProperty('secNumOp' .. ehOp.. '.alpha') == 0 then
                    removeLuaSprite('secNumOp' .. ehOp, false)
                end

                makeLuaSprite('thrdNumOp' .. ehOp, numPrefixOp .. thrOp, getProperty('secNumOp' ..ehOp.. '.x') - 44, getProperty('firstNumOp' .. ehOp.. '.y'))
                setObjectCamera('thrdNumOp' .. ehOp, camSetOp)
                setObjectOrder('thrdNumOp' .. ehOp, getObjectOrder('layer')-1)
                scaleObject('thrdNumOp' .. ehOp, numScaleOp[1], numScaleOp[2])
                addLuaSprite('thrdNumOp' .. ehOp, true)
                if stationaryModeOp == false then
                    setProperty('thrdNumOp' .. ehOp .. '.acceleration.y', math.random(200, 400))
                    setProperty('thrdNumOp'.. ehOp ..'.velocity.x', math.random(-5, 5))
                    setProperty('thrdNumOp'.. ehOp ..'.velocity.y', math.random(-140, -160))
                end
                doTweenAlpha('nachotweenNum3O' .. ehOp, 'thrdNumOp' .. ehOp, 0, 0.2 + (stepCrochet * 0.008), 'quartIn')
                if getProperty('thrdNumOp' .. ehOp.. '.alpha') == 0 then
                    removeLuaSprite('thrdNumOp' .. ehOp, false)
                end

                if thousOp == true then
                    makeLuaSprite('fourNumOp' .. ehOp, numPrefixOp .. fuoOp, getProperty('thrdNumOp' ..ehOp.. '.x') - 44, getProperty('firstNumOp' .. ehOp.. '.y'))
                    setObjectCamera('fourNumOp' .. ehOp, camSetOp)
                    setObjectOrder('fourNumOp' .. ehOp, getObjectOrder('layer')-1)
                    scaleObject('fourNumOp' .. ehOp, numScaleOp[1], numScaleOp[2])
                    addLuaSprite('fourNumOp' .. ehOp, true)
                    if stationaryModeOp == false then
                        setProperty('fourNumOp' .. ehOp .. '.acceleration.y', math.random(200, 400))
                        setProperty('fourNumOp'.. ehOp ..'.velocity.x', math.random(-5, 5))
                        setProperty('fourNumOp'.. ehOp ..'.velocity.y', math.random(-140, -160))
                    end
                    doTweenAlpha('nachotweenNum4O' .. ehOp, 'fourNumOp' .. ehOp, 0, 0.2 + (stepCrochet * 0.008), 'quartIn')
                    if getProperty('fourNumOp' .. ehOp.. '.alpha') == 0 then
                        removeLuaSprite('fourNumOp' .. ehOp, false)
                    end
                end
            end
        end
    end
end

function rateGet()
    -- Change to mess with the frequency | can be a lil' iffy at times --
    if chanceGood >= 48 and randGoods == true then
        return 'good'
    elseif chanceBad >= 63 and randBads == true then
        return 'bad'
    elseif chanceShit >= 72 and randShits == true then
        return 'shit'
    else
        return 'sick'
    end

end

----- BbPanzu >:) ----------

function getRating(diff)
	diff = math.abs(diff);
	if diff <= getPropertyFromClass('ClientPrefs', 'badWindow') then
		if diff <= getPropertyFromClass('ClientPrefs', 'goodWindow') then
			if diff <= getPropertyFromClass('ClientPrefs', 'sickWindow') then
				return 'sick';
			end
			return 'good';
		end
		return 'bad';
	end
	return 'shit';
end

function onGameOver()
	if visible == true then
		setPropertyFromClass('ClientPrefs', 'hideHud', false);
	end
end
function onEndSong()
	if visible == true then
		setPropertyFromClass('ClientPrefs', 'hideHud', false);
	end
end
function onPause()
	if visible == true then
		setPropertyFromClass('ClientPrefs', 'hideHud', false);
	end
end
function onResume() -- lol put it back on
	if visible == true then
		setPropertyFromClass('ClientPrefs', 'hideHud', true);
	end
end