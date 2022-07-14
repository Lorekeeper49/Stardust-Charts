local allowCountdown = false
inCharSelect = false --in char select
changeCharNikku = false
changeCharBF = false --change char when song start
jsonNikku = {'nikku', 'nikku-24', 'nikku-jojo', 'nikku-classic'}
jsonBF = {'bf', 'bfog','bfcn','8owser','sonic'}
nikkupage = 1
BFpage = 1
barvariation = 1
page = 1

function onStartCountdown()
    if barvariation == 2 then
		removeLuaSprite('bartop',true)
		removeLuaSprite('barbot',true)
	    end
	if changeCharNikku == true then
		triggerEvent('Change Character', 1, jsonNikku[nikkupage]);
	end
	if changeCharBF == true then
		triggerEvent('Change Character', 0, jsonBF[BFpage]);
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

		makeLuaSprite('bfs1', 'characterselector/bfShadow', 5, 0);
		setObjectCamera('bfs1', 'other')
		makeLuaSprite('bfs2', 'characterselector/bf-classicShadow', 5, 0);
		setObjectCamera('bfs2', 'other')
		makeLuaSprite('bfs3', 'characterselector/bf-cnShaddow', 5, 0);
		setObjectCamera('bfs3', 'other')
		makeLuaSprite('bfs4', 'characterselector/bf-8owserShadow', 5, 0);
		setObjectCamera('bfs4', 'other')
		makeLuaSprite('bfs5', 'characterselector/bf-sonicShadow', 5, 0);
		setObjectCamera('bfs5', 'other')
		setProperty('bfs1.alpha', 0);
		setProperty('bfs2.alpha', 0);
		setProperty('bfs3.alpha', 0);
		setProperty('bfs4.alpha', 0);
		setProperty('bfs5.alpha', 0);

		addLuaSprite('cs', true);
		addLuaSprite('niks1', true);
		addLuaSprite('niks2', true);
		addLuaSprite('niks3', true);
		addLuaSprite('niks4', true);
		addLuaSprite('bfs1', true);
		addLuaSprite('bfs2', true);
		addLuaSprite('bfs3', true);
		addLuaSprite('bfs4', true);
		addLuaSprite('bfs5', true);

		makeLuaSprite('bf1', 'characterselector/bf', 0, 0);
		setObjectCamera('bf1', 'other')
		addLuaSprite('bf1', true);
		makeLuaSprite('bf2', 'characterselector/bf-classic', 0, 0);
		setObjectCamera('bf2', 'other')
		addLuaSprite('bf2', true);
		makeLuaSprite('bf3', 'characterselector/bf-cn', 0, 0);
		setObjectCamera('bf3', 'other')
		addLuaSprite('bf3', true);
		makeLuaSprite('bf4', 'characterselector/bf-8owser', 0, 0);
		setObjectCamera('bf4', 'other')
		addLuaSprite('bf4', true);
		makeLuaSprite('bf5', 'characterselector/bf-sonic', 0, 0);
		setObjectCamera('bf5', 'other')
		addLuaSprite('bf5', true);
		
		setProperty('bf1.visible', false)
		setProperty('bf2.visible', false)
		setProperty('bf3.visible', false)
		setProperty('bf4.visible', false)
		setProperty('bf5.visible', false)

		makeLuaSprite('nik1', 'characterselector/nikku', 0, 0);
		setObjectCamera('nik1', 'other')
		addLuaSprite('nik1', true);
		makeLuaSprite('nik2', 'characterselector/nikku2', 0, 0);
		setObjectCamera('nik2', 'other')
		addLuaSprite('nik2', true);
		makeLuaSprite('nik3', 'characterselector/jojo', 0, 0);
		setObjectCamera('nik3', 'other')
		addLuaSprite('nik3', true);
		makeLuaSprite('nik4', 'characterselector/classic', 0, 0);
		setObjectCamera('nik4', 'other')
		addLuaSprite('nik4', true);
		setProperty('nik2.visible', false)
		setProperty('nik3.visible', false)
		setProperty('nik4.visible', false)

		addLuaSprite('cs2', true);
		addLuaSprite('cs3', true);
		addLuaSprite('cs4', true);

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
		if  keyJustPressed('right') then
			if page == 1 then
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

			nikkupage = nikkupage+1
			end
			if page == 2 then
			setProperty('bfs1.alpha', 0.5);
			setProperty('bfs2.alpha', 0.5);
			setProperty('bfs3.alpha', 0.5);
			setProperty('bfs4.alpha', 0.5);
			setProperty('bfs5.alpha', 0.5);

			setProperty('bfs1.x', 0);
			setProperty('bfs2.x', 0);
			setProperty('bfs3.x', 0);
			setProperty('bfs4.x', 0);
			setProperty('bfs5.x', 0);

			setProperty('bf1.x', -50);
			setProperty('bf2.x', -50);
			setProperty('bf3.x', -50);
			setProperty('bf4.x', -50);
			setProperty('bf5.x', -50);

			BFpage = BFpage+1
			end
			playSound('selectsfx', 1);
			doTweenY('ArrowMove','cs4',5,0.075,'quadInOut')
		end
		if  keyJustPressed('left') then
			if page == 1 then
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

			nikkupage = nikkupage-1
			end
			if page == 2 then
			setProperty('bfs1.alpha', 0.5);
			setProperty('bfs2.alpha', 0.5);
			setProperty('bfs3.alpha', 0.5);
			setProperty('bfs4.alpha', 0.5);
			setProperty('bfs5.alpha', 0.5);

			setProperty('bfs1.x', 10);
			setProperty('bfs2.x', 10);
			setProperty('bfs3.x', 10);
			setProperty('bfs4.x', 10);
			setProperty('bfs5.x', 10);

			setProperty('bf1.x', 50);
			setProperty('bf2.x', 50);
			setProperty('bf3.x', 50);
			setProperty('bf4.x', 50);
			setProperty('bf5.x', 50);

			BFpage = BFpage-1
			end
			playSound('selectsfx', 1);
			doTweenY('ArrowMove','cs4',5,0.075,'quadInOut')
		end
		if  keyJustPressed('down') then
			playSound('selectsfx', 1);
			barvariation = barvariation-1
		end
		if  keyJustPressed('up') then
			playSound('selectsfx', 1);
			barvariation = barvariation+1
		end
		if  keyJustPressed('accept') then
		    removeLuaSprite('nik1', true);
		    removeLuaSprite('nik2', true);
		    removeLuaSprite('nik3', true);
			removeLuaSprite('nik4', true);
			removeLuaSprite('niks1', true);
			removeLuaSprite('niks2', true);
			removeLuaSprite('niks3', true);
			removeLuaSprite('niks4', true);
			page = page+1
			changeCharNikku = true
			playSound('entersfx', 1);
			if page == 3 then
			setProperty('camHUD.visible', true);
			removeLuaSprite('cs', true);
			removeLuaSprite('cs2', true);
			removeLuaSprite('cs3', true);
			removeLuaSprite('cs4', true);
			removeLuaSprite('bf1', true);
		    removeLuaSprite('bf2', true);
			removeLuaSprite('bf3', true);
			removeLuaSprite('bf4', true);
			removeLuaSprite('bf5', true);
			removeLuaSprite('bfs1', true);
			removeLuaSprite('bfs2', true);
			removeLuaSprite('bfs3', true);
			removeLuaSprite('bfs4', true);
			removeLuaSprite('bfs5', true);
			soundFadeOut('nightlight', 0.5, 0);
			changeCharBF = true
			inCharSelect = false
			startCountdown()
			end
		end
	if page == 1 then
		if nikkupage < 1 then --nikkupage cycles back from 1 to 4
			    nikkupage = 4
    	    end
    	if nikkupage > 4 then
			nikkupage = 1
    	end
		if nikkupage == 1 then
		setProperty('nik1.visible', true)
		doTweenAlpha('niksog1', 'niks1', 1, 0.1, 'smoothStepOut');
		    if getProperty('niks1.x') == 5 then
			else
		    doTweenX('sm51','niks1',5,0.1,'smoothStepOut')
		    end
			if getProperty('nik1.x') == 0 then
			else
		        doTweenX('sm321','nik1',0,0.075,'smoothStepOut')
		    end
		else
		    if nikkupage == 5 then
	    	setProperty('nik1.visible', true)
	    	doTweenAlpha('niksog1', 'niks1', 1, 0.1, 'smoothStepOut');
			else
			setProperty('nik1.visible', false)
	    	setProperty('niks1.alpha', 0);
			end
    	end
	    if nikkupage == 2 then
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
    	if nikkupage == 3 then
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
    	if nikkupage == 4 then
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
		    if nikkupage == 0 then
	    	setProperty('nik4.visible', true)
	    	doTweenAlpha('niksog4', 'niks4', 1, 0.1, 'smoothStepOut');
			else
			setProperty('nik4.visible', false)
	    	setProperty('niks4.alpha', 0);
			end
    	end
	end
	if page == 2 then
	if BFpage < 1 then --BFpage cycles back from 1 to 5
			BFpage = 5
    	    end
    	if BFpage > 5 then
			BFpage = 1
    	end
		if BFpage == 1 then
		setProperty('bf1.visible', true)
		doTweenAlpha('bfs11', 'bfs1', 1, 0.1, 'smoothStepOut');
		    if getProperty('bfs1.x') == 5 then
			else
		    doTweenX('bfsm1','bfs1',5,0.1,'smoothStepOut')
		    end
			if getProperty('bf1.x') == 0 then
			else
		        doTweenX('bfm1','bf1',0,0.075,'smoothStepOut')
		    end
		else
		    if BFpage == 6 then
	    	setProperty('bf1.visible', true)
	    	doTweenAlpha('bfs62', 'bfs1', 1, 0.1, 'smoothStepOut');
			else
			setProperty('bf1.visible', false)
	    	setProperty('bfs1.alpha', 0);
			end
    	end
	    if BFpage == 2 then
		setProperty('bf2.visible', true)
		doTweenAlpha('bfs63', 'bfs2', 1, 0.1, 'smoothStepOut');
		    if getProperty('bfs2.x') == 5 then
			else
		    doTweenX('bfsm2','bfs2',5,0.1,'smoothStepOut')
		    end
			if getProperty('bf2.x') == 0 then
			else
		        doTweenX('bfm2','bf2',0,0.075,'smoothStepOut')
		    end
		else
		setProperty('bf2.visible', false)
		setProperty('bfs2.alpha', 0);
    	end
		if BFpage == 3 then
		setProperty('bf3.visible', true)
		doTweenAlpha('bfsa31', 'bfs3', 1, 0.1, 'smoothStepOut');
		    if getProperty('bfs3.x') == 5 then
			else
		    doTweenX('bfsm32','bfs3',5,0.1,'smoothStepOut')
		    end
			if getProperty('bf3.x') == 0 then
			else
		        doTweenX('bfm13','bf3',0,0.075,'smoothStepOut')
		    end
		else
		setProperty('bf3.visible', false)
		setProperty('bfs3.alpha', 0);
    	end
		if BFpage == 4 then
		setProperty('bf4.visible', true)
		doTweenAlpha('bfsa41', 'bfs4', 1, 0.1, 'smoothStepOut');
		    if getProperty('bfs4.x') == 5 then
			else
		    doTweenX('bfsm41','bfs4',5,0.1,'smoothStepOut')
		    end
			if getProperty('bf4.x') == 0 then
			else
		        doTweenX('bfm42','bf4',0,0.075,'smoothStepOut')
		    end
		else
		setProperty('bf4.visible', false)
		setProperty('bfs4.alpha', 0);
    	end
    	if BFpage == 5 then
		setProperty('bf5.visible', true)
		doTweenAlpha('bfsa51', 'bfs5', 1, 0.1, 'smoothStepOut');
		    if getProperty('bfs5.x') == 5 then
			else
		    doTweenX('bfsm51','bfs5',5,0.1,'smoothStepOut')
		    end
			if getProperty('bf5.x') == 0 then
			else
		        doTweenX('bfm51','bf5',0,0.075,'smoothStepOut')
		    end
		else
		    if BFpage == 0 then
	    	setProperty('bf5.visible', true)
	    	doTweenAlpha('bfsa52', 'bfs5', 1, 0.1, 'smoothStepOut');
			else
			setProperty('bf5.visible', false)
	    	setProperty('bfs5.alpha', 0);
			end
    	end
	end
	    if getProperty('cs4.y') == 5 then
		doTweenY('ArrowMove','cs4',0,0.075,'quadInOut')
	    end
	    if barvariation < 1 then --barvariation cycles from 1 to 2
			barvariation = 2
    	end
    	if barvariation > 2 then
			barvariation = 1
    	end
		if barvariation == 1 then
			doTweenX('bs1', 'cs2.scale', 1, 0.1, 'smoothStepInOut');
			doTweenY('bs2', 'cs2.scale', 1, 0.1, 'smoothStepInOut');
			else
			doTweenX('bs3', 'cs2.scale', 1.4, 0.1, 'smoothStepInOut');
			doTweenY('bs4', 'cs2.scale', 1.4, 0.1, 'smoothStepInOut');
    	end
	end
end