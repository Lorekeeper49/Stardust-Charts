local allowCountdown = false
inCharSelect = false --in char select
changeChar = false --change char when song start
json = {'nikku', 'nikku-24', 'nikku-jojo', 'nikku-classic'} --json names
name = {'Nikku', 'Nikku 24', 'Nikku Jojo', 'Nikku Classic'} --display names
page = 1 --don't change it
variation = 1 --don't change it too

function onStartCountdown() --enter selector mode
	if changeChar == true then
		triggerEvent('Change Character', 1, json[page]);
		if variation == 2 then
		removeLuaSprite('bartop',true)
		removeLuaSprite('barbot',true)
	    end
	end
	if not allowCountdown and not seenCutscene then
		setProperty('inCutscene', true);
 	    runTimer('charSelector', 0.8);
        setProperty('camHUD.visible', false);
        makeLuaSprite('cs', 'characterselector/bg', 0, 0);
		setObjectCamera('cs', 'other')
		makeLuaSprite('cs2', 'characterselector/bars', 0, 0);
		setObjectCamera('cs2', 'other')
		makeLuaSprite('cs3', 'characterselector/text', 0, 0);
		setObjectCamera('cs3', 'other')
		makeLuaSprite('cs4', 'characterselector/triangles', 0, 0);
		setObjectCamera('cs4', 'other')
		
		makeLuaSprite('niks1', 'characterselector/nikkuShadow', 5, 0);
		setObjectCamera('niks1', 'other')
		makeLuaSprite('niks2', 'characterselector/nikku2Shadow', 5, 0);
		setObjectCamera('niks2', 'other')
		makeLuaSprite('niks3', 'characterselector/jojoShadow', 5, 0);
		setObjectCamera('niks3', 'other')
		makeLuaSprite('niks4', 'characterselector/classicShadow', 5, 0);
		setObjectCamera('niks4', 'other')
		setProperty('niks2.alpha', 0);
		setProperty('niks3.alpha', 0);
		setProperty('niks4.alpha', 0);
		
		
		addLuaSprite('cs', true);
		addLuaSprite('niks1', true);
		addLuaSprite('niks2', true);
		addLuaSprite('niks3', true);
		addLuaSprite('niks4', true);
		addLuaSprite('cs2', true);
		addLuaSprite('cs3', true);
		addLuaSprite('cs4', true);

		makeLuaSprite('nik1', 'characterselector/nikku', 0, 0);
		setObjectCamera('nik1', 'other')
		addLuaSprite('nik1', true);
		makeLuaSprite('nik2', 'characterselector/nikku2', 0, 0);
		setObjectCamera('nik2', 'other')
		addLuaSprite('nik2', true);
		setProperty('nik2.visible', false)
		makeLuaSprite('nik3', 'characterselector/jojo', 0, 0);
		setObjectCamera('nik3', 'other')
		addLuaSprite('nik3', true);
		setProperty('nik3.visible', false)
		makeLuaSprite('nik4', 'characterselector/classic', 0, 0);
		setObjectCamera('nik4', 'other')
		addLuaSprite('nik4', true);
		setProperty('nik2.visible', false)
		setProperty('nik3.visible', false)
		setProperty('nik4.visible', false)

		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end

function onTimerCompleted(tag)
	if tag == 'charSelector' then --in selector true
		inCharSelect = true
		playMusic('nightlight', 1, true);
	end
end

function onUpdate()
	if inCharSelect == true then
		screenCenter('char', 'x');
		setTextString('char', name[page]);
		if page < 1 then --page cycle
			page = 4
    	end
    	if page > 4 then
			page = 1
    	end
		if  keyJustPressed('right') then
			playSound('selectsfx', 1);
			page = page+1
			doTweenY('ArrowMove','cs4',5,0.075,'quadInOut')

			setProperty('niks1.alpha', 0.5);
			setProperty('niks2.alpha', 0.5);
			setProperty('niks3.alpha', 0.5);
			setProperty('niks4.alpha', 0.5);
			
			setProperty('niks1.x', 0);
			setProperty('niks2.x', 0);
			setProperty('niks3.x', 0);
			setProperty('niks4.x', 0);
			
			setProperty('nik1.x', -50);
			setProperty('nik2.x', -50);
			setProperty('nik3.x', -50);
			setProperty('nik4.x', -50);
		end
		if  keyJustPressed('left') then
			playSound('selectsfx', 1);
			page = page-1
			doTweenY('ArrowMove','cs4',5,0.075,'quadInOut')

			setProperty('niks1.alpha', 0.5);
			setProperty('niks2.alpha', 0.5);
			setProperty('niks3.alpha', 0.5);
			setProperty('niks4.alpha', 0.5);
			
			setProperty('niks1.x', 10);
			setProperty('niks2.x', 10);
			setProperty('niks3.x', 10);
			setProperty('niks4.x', 10);
			
			setProperty('nik1.x', 50);
			setProperty('nik2.x', 50);
			setProperty('nik3.x', 50);
			setProperty('nik4.x', 50);
		end
		if  keyJustPressed('down') then
			playSound('selectsfx', 1);
			variation = variation-1
		end
		if  keyJustPressed('up') then
			playSound('selectsfx', 1);
			variation = variation+1
		end
		if  keyJustPressed('accept') then
			changeChar = true
			setProperty('camHUD.visible', true);
			removeLuaSprite('cs', true);
			removeLuaSprite('cs2', true);
			removeLuaSprite('cs3', true);
			removeLuaSprite('cs4', true);
			removeLuaSprite('nik1', true);
		    removeLuaSprite('nik2', true);
		    removeLuaSprite('nik3', true);
			removeLuaSprite('nik4', true);
			removeLuaSprite('niks1', true);
			removeLuaSprite('niks2', true);
			removeLuaSprite('niks3', true);
			removeLuaSprite('niks4', true);
			soundFadeOut('nightlight', 0.5, 0);
			playSound('entersfx', 1);
			startCountdown()
			inCharSelect = false
		end
		if page == 1 then --change variation
		setProperty('nik1.visible', true)
		doTweenAlpha('niksog1', 'niks1', 1, 0.1, 'smoothStepOut');
		    if getProperty('niks1.x') == 5 then
			else
		    doTweenX('sm1','niks1',5,0.1,'smoothStepOut')
		    end
			if getProperty('nik1.x') == 0 then
			else
		    doTweenX('sm2','nik1',0,0.075,'smoothStepOut')
		    end
		else
		    if page == 5 then
			setProperty('nik1.visible', true)
	    	doTweenAlpha('niksog1', 'niks1', 1, 0.1, 'smoothStepOut');
			else
			setProperty('nik1.visible', false)
		    setProperty('niks1.alpha', 0);
			end
	    end
	    if page == 2 then --change variation
		setProperty('nik2.visible', true)
		doTweenAlpha('niksog2', 'niks2', 1, 0.1, 'smoothStepOut');
		    if getProperty('niks2.x') == 5 then
			else
		    doTweenX('sm5','niks2',5,0.1,'smoothStepOut')
		    end
			if getProperty('nik2.x') == 0 then
			else
		        doTweenX('sm6','nik2',0,0.075,'smoothStepOut')
		    end
		else
		setProperty('nik2.visible', false)
		setProperty('niks2.alpha', 0);
    	end
    	if page == 3 then --change variation
		setProperty('nik3.visible', true)
		doTweenAlpha('niksog3', 'niks3', 1, 0.1, 'smoothStepOut');
		    if getProperty('niks3.x') == 5 then
			else
		    doTweenX('sm7','niks3',5,0.1,'smoothStepOut')
		    end
			if getProperty('nik3.x') == 0 then
			else
		        doTweenX('sm8','nik3',0,0.075,'smoothStepOut')
		    end
		else
		setProperty('nik3.visible', false)
		setProperty('niks3.alpha', 0);
    	end
    	if page == 4 then --change variation
		setProperty('nik4.visible', true)
		doTweenAlpha('niksog4', 'niks4', 1, 0.1, 'smoothStepOut');
		    if getProperty('niks4.x') == 5 then
			else
		    doTweenX('sm9','niks4',5,0.1,'smoothStepOut')
		    end
			if getProperty('nik4.x') == 0 then
			else
		        doTweenX('sm10','nik4',0,0.075,'smoothStepOut')
		    end
		else
		    if page == 0 then --change variation
	    	setProperty('nik4.visible', true)
	    	doTweenAlpha('niksog4', 'niks4', 1, 0.1, 'smoothStepOut');
			else
			setProperty('nik4.visible', false)
	    	setProperty('niks4.alpha', 0);
			end
    	end
		if variation < 1 then --variation cycle
			variation = 2
    	end
    	if variation > 2 then
			variation = 1
    	end
		if variation == 1 then
			doTweenX('bs1', 'cs2.scale', 1, 0.1, 'smoothStepInOut');
			doTweenY('bs2', 'cs2.scale', 1, 0.1, 'smoothStepInOut');
			else
			doTweenX('bs3', 'cs2.scale', 1.4, 0.1, 'smoothStepInOut');
			doTweenY('bs4', 'cs2.scale', 1.4, 0.1, 'smoothStepInOut');
    	end
    	if getProperty('cs4.y') == 5 then
		doTweenY('ArrowMove','cs4',0,0.075,'quadInOut')
	    end	
	    end
end
--script by TerrorGaming473